import 'package:flutter/material.dart';

enum DottedLineDirection { horizontal, vertical }

class DottedLineWithCurves extends StatelessWidget {
  final DottedLineDirection direction;
  final Color color;
  final double strokeWidth;
  final double dashWidth;
  final double dashSpace;
  final double curveRadius;

  const DottedLineWithCurves({
    super.key,
    this.direction = DottedLineDirection.horizontal,
    this.color = const Color(0xFFEEEFF3),
    this.strokeWidth = 1.5,
    this.dashWidth = 5,
    this.dashSpace = 4,
    this.curveRadius = 8,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: direction == DottedLineDirection.horizontal ? null : 30,
      height: direction == DottedLineDirection.horizontal ? 30 : null,
      child: CustomPaint(
        painter: DottedLineCurvePainter(
          direction: direction,
          color: color,
          strokeWidth: strokeWidth,
          dashWidth: dashWidth,
          dashSpace: dashSpace,
          curveRadius: curveRadius,
        ),
        child: Container(),
      ),
    );
  }
}

class DottedLineCurvePainter extends CustomPainter {
  final DottedLineDirection direction;
  final Color color;
  final double strokeWidth;
  final double dashWidth;
  final double dashSpace;
  final double curveRadius;

  DottedLineCurvePainter({
    required this.direction,
    required this.color,
    required this.strokeWidth,
    required this.dashWidth,
    required this.dashSpace,
    required this.curveRadius,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final linePaint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth;

    if (direction == DottedLineDirection.horizontal) {
      _drawHorizontalLine(canvas, size, paint, linePaint);
    } else {
      _drawVerticalLine(canvas, size, paint, linePaint);
    }
  }

  void _drawHorizontalLine(Canvas canvas, Size size, Paint paint, Paint linePaint) {
    // Gambar setengah lingkaran kiri
    canvas.drawArc(
      Rect.fromCircle(center: Offset(0, size.height / 2), radius: curveRadius),
      1.5 * 3.14, // 270 degrees
      3.14, // 180 degrees
      false,
      paint,
    );

    // Gambar setengah lingkaran kanan
    canvas.drawArc(
      Rect.fromCircle(center: Offset(size.width, size.height / 2), radius: curveRadius),
      0.5 * 3.14, // 90 degrees
      3.14, // 180 degrees
      false,
      paint,
    );

    // Garis putus-putus horizontal
    double startX = curveRadius + 2;
    final y = size.height / 2;

    while (startX < size.width - curveRadius - 2) {
      double endX = startX + dashWidth;
      if (endX > size.width - curveRadius - 2) {
        endX = size.width - curveRadius - 2;
      }
      
      canvas.drawLine(
        Offset(startX, y),
        Offset(endX, y),
        linePaint,
      );
      startX += dashWidth + dashSpace;
    }
  }

  void _drawVerticalLine(Canvas canvas, Size size, Paint paint, Paint linePaint) {
    final centerX = size.width / 2;
    
    // Gambar setengah lingkaran atas
    canvas.drawArc(
      Rect.fromCircle(center: Offset(centerX, 0), radius: curveRadius),
      0, // 0 degrees (mulai dari kanan)
      3.14159, // 180 degrees (setengah lingkaran)
      false,
      paint,
    );

    // Gambar setengah lingkaran bawah
    canvas.drawArc(
      Rect.fromCircle(center: Offset(centerX, size.height), radius: curveRadius),
      3.14159, // 180 degrees (mulai dari kiri)
      3.14159, // 180 degrees (setengah lingkaran)
      false,
      paint,
    );

    // Garis putus-putus vertikal
    double startY = curveRadius + 2;
    final maxY = size.height - curveRadius - 2;

    // Debug: pastikan ada ruang untuk garis
    if (maxY > startY) {
      while (startY < maxY) {
        double endY = startY + dashWidth;
        if (endY > maxY) {
          endY = maxY;
        }
        
        canvas.drawLine(
          Offset(centerX, startY),
          Offset(centerX, endY),
          linePaint,
        );
        startY += dashWidth + dashSpace;
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}