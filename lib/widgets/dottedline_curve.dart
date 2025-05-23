import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DottedLineWithCurves extends StatelessWidget {
  const DottedLineWithCurves({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: CustomPaint(
        painter: DottedLineCurvePainter(),
        child: Container(),
      ),
    );
  }
}

class DottedLineCurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Color(0xFFEEEFF3)!
      ..style = PaintingStyle.fill;

    // Gambar setengah lingkaran kiri
    canvas.drawArc(
      Rect.fromCircle(center: Offset(0, size.height / 2), radius: 8),
      1.5 * 3.14,
      3.14,
      false,
      paint,
    );

    // Gambar setengah lingkaran kanan
    canvas.drawArc(
      Rect.fromCircle(center: Offset(size.width, size.height / 2), radius: 8),
      0.5 * 3.14,
      3.14,
      false,
      paint,
    );

    // Garis putus-putus
    final linePaint = Paint()
      ..color = Color(0xFFEEEFF3)
      ..strokeWidth = 1.5;

    const dashWidth = 5;
    const dashSpace = 4;
    double startX = 10;
    final y = size.height / 2;

    while (startX < size.width - 10) {
      canvas.drawLine(
        Offset(startX, y),
        Offset(startX + dashWidth, y),
        linePaint,
      );
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

