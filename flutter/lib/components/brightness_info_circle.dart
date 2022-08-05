import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:malibu_orange/pages/brightness.dart';

class BrightnessInfoCircle extends ConsumerWidget {
  const BrightnessInfoCircle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final brightness = ref.watch(
            brightnessModelProvider.select((model) => model.brightness)) ??
        0;
    final isbrightnessSensorAvailable = ref.watch(brightnessModelProvider
            .select((model) => model.isBrightnessSensorAvailable)) ??
        false;
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: isbrightnessSensorAvailable
            ? CustomPaint(painter: _Painter(brightness: brightness))
            : const Text('⚠センサーが使えません。',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.redAccent)));
  }
}

class _Painter extends CustomPainter {
  _Painter({required this.brightness});

  final double brightness;

  @override
  void paint(Canvas canvas, Size size) {
    final Offset center = Offset(size.width / 12 * 7, size.height / 2);
    final strokePaint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 12
      ..style = PaintingStyle.stroke;
    final circlePath = Path()
      ..addOval(Rect.fromCircle(center: center, radius: size.width / 12 * 4));
    canvas.drawPath(circlePath, strokePaint);
    final textPainter = TextPainter(
        textDirection: TextDirection.ltr,
        text: TextSpan(children: [
          TextSpan(
              text: brightness.toStringAsFixed(1),
              style: const TextStyle(fontSize: 64, color: Colors.blue)),
          const TextSpan(
              text: 'ルクス', style: TextStyle(fontSize: 32, color: Colors.blue))
        ]))
      ..layout(minWidth: 0, maxWidth: size.width);

    textPainter.paint(canvas,
        center.translate(-textPainter.width / 2, -textPainter.height / 2));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
