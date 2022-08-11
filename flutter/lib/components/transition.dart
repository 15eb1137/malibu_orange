import 'package:flutter/material.dart';

class Transition extends StatefulWidget {
  const Transition({Key? key
      // , required this.child, required this.shape
      })
      : super(key: key);

  @override
  _TransitionState createState() => _TransitionState();
}

class _TransitionState extends State<Transition> with TickerProviderStateMixin {
  late final AnimationController _controller;
  final duration = const Duration(seconds: 4);
  ScaleTransition createTransition(Widget child,
          {required double before,
          required double length,
          required double after}) =>
      ScaleTransition(
          scale: _controller.drive(TweenSequence([
            TweenSequenceItem(tween: ConstantTween(0.0), weight: before),
            TweenSequenceItem(
                tween: Tween(begin: 0.0, end: 8.0)
                    .chain(CurveTween(curve: Curves.easeInCubic)),
                weight: length),
            TweenSequenceItem(tween: ConstantTween(8.0), weight: after),
          ])),
          child: child);

  @override
  void initState() {
    _controller = AnimationController(
      duration: duration,
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
      Container(color: Colors.blueGrey),
      createTransition(
          Image.asset('assets/images/transitions.png',
              color: Colors.yellow,
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width),
          before: 6.0,
          length: 1.5,
          after: 8.5),
      createTransition(
          Image.asset('assets/images/transitions.png',
              color: Colors.green,
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width),
          before: 7.0,
          length: 1.5,
          after: 7.5),
      createTransition(
          Image.asset('assets/images/transitions.png',
              color: Colors.red,
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width),
          before: 8.0,
          length: 1.5,
          after: 6.5),
      createTransition(
          Image.asset('assets/images/transitions.png',
              color: Colors.grey,
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width),
          before: 11.0,
          length: 3.0,
          after: 2.0)
    ]);
  }
}
