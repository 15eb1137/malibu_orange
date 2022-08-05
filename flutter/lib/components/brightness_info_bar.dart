import 'package:flutter/material.dart';

class BrightnessInfoBar extends StatelessWidget {
  const BrightnessInfoBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: CustomPaint(
          painter: _Painter(),
        ));
  }
}

class _Painter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final strokePaint = Paint()
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;
    final fillPaint = Paint()
      ..color = Colors.blue.withOpacity(0.4)
      ..style = PaintingStyle.fill;
    final thermometerPath = Path()
      ..moveTo(-1, -1)
      ..lineTo(size.width / 6, -1)
      ..lineTo(size.width / 6, size.height * 0.8)
      ..arcToPoint(Offset(-1, size.height * 0.98),
          radius: const Radius.circular(1))
      ..lineTo(-1, -1);
    final filledThermometerPath = Path()
      ..moveTo(-1, size.height / 2)
      ..lineTo(size.width / 6, size.height / 2)
      ..lineTo(size.width / 6, size.height * 0.8)
      ..arcToPoint(Offset(-1, size.height * 0.98),
          radius: const Radius.circular(1))
      ..lineTo(-1, size.height / 2);
    canvas.drawPath(thermometerPath, strokePaint..color = Colors.grey);
    canvas.drawPath(filledThermometerPath, fillPaint);
    for (int i = 1; i <= 8; i++) {
      final thermometerScalePath = Path()
        ..moveTo(0, size.height * 0.1 * i)
        ..lineTo(20, size.height * 0.1 * i);
      canvas.drawPath(thermometerScalePath,
          strokePaint..color = Colors.blueGrey.withOpacity(0.6));
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
