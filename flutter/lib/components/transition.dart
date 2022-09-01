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
  SlideTransition createSlideTransition(Widget child,
      {Offset start = const Offset(0, 0),
      required double before,
      required double length,
      required double after,
      Offset end = const Offset(0, 0)}) {
    final List<TweenSequenceItem<Offset>> beforeSequence = before == 0.0
        ? []
        : [TweenSequenceItem(tween: ConstantTween(start), weight: before)];
    final List<TweenSequenceItem<Offset>> mainSequence = [
      TweenSequenceItem(
          tween: Tween(begin: start, end: end)
              .chain(CurveTween(curve: Curves.linear)),
          weight: length)
    ];
    final List<TweenSequenceItem<Offset>> afterSequence = after == 0.0
        ? []
        : [TweenSequenceItem(tween: ConstantTween(end), weight: after)];
    final List<TweenSequenceItem<Offset>> sequence = [
      ...beforeSequence,
      ...mainSequence,
      ...afterSequence
    ];
    return SlideTransition(
        position: _controller.drive(TweenSequence(sequence)), child: child);
  }

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
      createSlideTransition(widget.child,
          start: const Offset(1, 0),
          before: 4.0,
          length: 8.0,
          after: 4.0,
          end: const Offset(0, 0)),
      createSlideTransition(Container(color: const Color(0xffbbd5a6)),
          start: const Offset(1, 0),
          before: 4.0,
          length: 8.0,
          after: 4.0,
          end: const Offset(-1, 0)),
      createSlideTransition(Container(color: const Color(0xffbbd5a6)),
          start: const Offset(1, 0),
          before: 6.0,
          length: 8.0,
          after: 2.0,
          end: const Offset(-1, 0)),
      createSlideTransition(Container(color: const Color(0xfffbceb9)),
          start: const Offset(1, 0),
          before: 7.0,
          length: 8.0,
          after: 1.0,
          end: const Offset(-1, 0)),
      createSlideTransition(Container(color: const Color(0xffffdfa2)),
          start: const Offset(1, 0),
          before: 8.0,
          length: 8.0,
          after: 0.0,
          end: const Offset(-1, 0)),
      createSlideTransition(const TransitonShape(color: Colors.white),
          start: const Offset(1, 0),
          before: 5.5,
          length: 8.0,
          after: 2.5,
          end: const Offset(-1, 0))
    ]);
  }
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
