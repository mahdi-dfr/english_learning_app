import 'package:flutter/cupertino.dart';

class GradientBorderPainter extends CustomPainter {
  final double strokeWidth;
  final Gradient gradient;

  GradientBorderPainter({required this.strokeWidth, required this.gradient});

  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = Offset.zero & size;
    final Paint paint = Paint()
      ..shader = gradient.createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    final RRect outerRect = RRect.fromRectAndRadius(
      rect,
      const Radius.circular(12.0), // You can adjust the corner radius here
    );

    canvas.drawRRect(outerRect, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}