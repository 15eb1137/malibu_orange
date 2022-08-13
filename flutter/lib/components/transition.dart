import 'package:flutter/material.dart';

class Transition extends StatefulWidget {
  const Transition(
      {Key? key,
      required this.duration,
      required this.child,
      required this.animation})
      : super(key: key);

  final Duration duration;
  final Widget child;
  final Animation<double> animation;

  @override
  _TransitionState createState() => _TransitionState();
}

class _TransitionState extends State<Transition> with TickerProviderStateMixin {
  late final AnimationController _controller;
  ScaleTransition createScaleTransition(Widget child,
          {required double before,
          required double length,
          required double after,
          double multiplier = 8.0}) =>
      ScaleTransition(
          scale: _controller.drive(TweenSequence([
            TweenSequenceItem(tween: ConstantTween(0.0), weight: before),
            TweenSequenceItem(
                tween: Tween(begin: 0.0, end: multiplier)
                    .chain(CurveTween(curve: Curves.easeInCubic)),
                weight: length),
            TweenSequenceItem(tween: ConstantTween(multiplier), weight: after),
          ])),
          child: child);
  FadeTransition createFadeTransition(Widget child,
          {required double before,
          required double length,
          required double after}) =>
      FadeTransition(
          opacity: _controller.drive(TweenSequence([
            TweenSequenceItem(tween: ConstantTween(0.0), weight: before),
            TweenSequenceItem(
                tween: Tween(begin: 0.0, end: 1.0)
                    .chain(CurveTween(curve: Curves.easeInCubic)),
                weight: length),
            TweenSequenceItem(tween: ConstantTween(1.0), weight: after),
          ])),
          child: child);

  @override
  void initState() {
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    );
    _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      createScaleTransition(const TransitonShape(color: Colors.lightBlue),
          before: 6.0, length: 1.5, after: 8.5),
      createScaleTransition(const TransitonShape(color: Colors.lightGreen),
          before: 7.0, length: 1.5, after: 7.5),
      createScaleTransition(const TransitonShape(color: Colors.yellow),
          before: 8.0, length: 1.5, after: 6.5),
      widget.animation.value * 16.0 < 11.5
          ? createScaleTransition(
              ClipPath(clipper: TransitionClipper(), child: widget.child),
              before: 11.0,
              length: 0.5,
              after: 4.5,
              multiplier: 1.0)
          : widget.child
    ]);
  }
}

class TransitionClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) => Path()
    ..moveTo(size.width * 0.3, size.height * 0.65)
    ..arcToPoint(Offset(size.width * 0.7, size.height * 0.25),
        radius: const Radius.circular(0.1))
    ..arcToPoint(Offset(size.width * 0.3, size.height * 0.65),
        radius: const Radius.circular(0.1))
    ..lineTo(size.width * 0.7, size.height * 0.65)
    ..lineTo(size.width * 0.7, size.height * 0.7)
    ..lineTo(size.width * 0.3, size.height * 0.7)
    ..lineTo(size.width * 0.3, size.height * 0.65)
    ..moveTo(size.width * 0.3, size.height * 0.75)
    ..addRRect(RRect.fromLTRBAndCorners(size.width * 0.3, size.height * 0.75,
        size.width * 0.7, size.height * 0.8,
        bottomLeft: const Radius.circular(8),
        bottomRight: const Radius.circular(8)));

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class TransitonShape extends StatelessWidget {
  const TransitonShape({Key? key, required this.color}) : super(key: key);

  final Color color;

  @override
  Widget build(BuildContext context) => CustomPaint(
      painter: _Painter(color),
      size: Size(MediaQuery.of(context).size.width,
          MediaQuery.of(context).size.height));
}

class _Painter extends CustomPainter {
  _Painter(this.color);

  final Color color;
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    Path path = Path();

    paint.color = color;
    path = Path();
    path.moveTo(size.width * 0.35, size.height * 0.6);
    path.arcToPoint(Offset(size.width * 0.65, size.height * 0.3),
        radius: const Radius.circular(0.1));
    path.arcToPoint(Offset(size.width * 0.35, size.height * 0.6),
        radius: const Radius.circular(0.1));
    path.lineTo(size.width * 0.65, size.height * 0.6);
    path.lineTo(size.width * 0.65, size.height * 0.65);
    path.lineTo(size.width * 0.35, size.height * 0.65);
    path.lineTo(size.width * 0.35, size.height * 0.6);
    canvas.drawPath(path, paint);

    paint.color = color;
    path = Path();
    path.moveTo(size.width * 0.35, size.height * 0.7);
    path.addRRect(RRect.fromLTRBAndCorners(size.width * 0.35, size.height * 0.7,
        size.width * 0.65, size.height * 0.75,
        bottomLeft: const Radius.circular(8),
        bottomRight: const Radius.circular(8)));
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
