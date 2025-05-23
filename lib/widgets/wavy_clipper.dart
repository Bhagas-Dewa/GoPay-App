import 'dart:ui';
import 'package:flutter/material.dart';

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    path.lineTo(0, 0);
    final startHeight = size.height * 0.4;
    path.lineTo(0, startHeight);

    path.cubicTo(
      size.width * 0.30,
      startHeight + size.height * 0.03,
      size.width * 0.25,
      size.height * 0.80,
      size.width * 0.5,
      size.height * 0.95,
    );

    path.cubicTo(
      size.width * 0.75,
      size.height * 0.80,
      size.width * 0.70,
      startHeight + size.height * 0.03,
      size.width,
      startHeight,
    );

    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class WavePainter extends CustomPainter {
  final double dottedLineOffset;
  final double dividerOffset;
  final bool drawShadow;

  WavePainter({
    this.dottedLineOffset = 8,
    this.dividerOffset = 0,
    this.drawShadow = true,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final startHeight = size.height * 0.4;

    if (drawShadow) {
      final shadowPath = Path();
      shadowPath.moveTo(0, startHeight);

      shadowPath.cubicTo(
        size.width * 0.30,
        startHeight + size.height * 0.03,
        size.width * 0.25,
        size.height * 0.80,
        size.width * 0.5,
        size.height * 0.90,
      );

      shadowPath.cubicTo(
        size.width * 0.75,
        size.height * 0.80,
        size.width * 0.70,
        startHeight + size.height * 0.03,
        size.width,
        startHeight,
      );

      final shadowPaint = Paint()
        ..color = Colors.black.withOpacity(0.3)
        ..maskFilter = MaskFilter.blur(BlurStyle.normal, 5)
        ..strokeWidth = 1.0
        ..style = PaintingStyle.stroke;

      canvas.drawPath(shadowPath, shadowPaint);
    }

    final solidPaint = Paint()
      ..color = Colors.white
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke;


    final solidPath = Path();
    solidPath.moveTo(0, startHeight);
    solidPath.cubicTo(
      size.width * 0.30,
      startHeight + size.height * 0.03,
      size.width * 0.25,
      size.height * 0.80,
      size.width * 0.5,
      size.height * 0.95,
    );
    solidPath.cubicTo(
      size.width * 0.75,
      size.height * 0.80,
      size.width * 0.70,
      startHeight + size.height * 0.03,
      size.width,
      startHeight,
    );
    canvas.drawPath(solidPath, solidPaint);



    final dottedPaint = Paint()
      ..color = Color(0XFFE2E5EA)
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke;

    final offset = dottedLineOffset;
    final dottedPath = Path();
    dottedPath.moveTo(0, startHeight + offset);
    dottedPath.cubicTo(
      size.width * 0.30,
      startHeight + size.height * 0.03 + offset,
      size.width * 0.25,
      size.height * 0.80 + offset,
      size.width * 0.5,
      size.height * 1 + offset,
    );
    dottedPath.cubicTo(
      size.width * 0.75,
      size.height * 0.80 + offset,
      size.width * 0.70,
      startHeight + size.height * 0.03 + offset,
      size.width,
      startHeight + offset,
    );

    final dashWidth = 4.0;
    final dashSpace = 3.0;

    double distance = 0.0;
    final PathMetrics metrics = dottedPath.computeMetrics();
    for (final metric in metrics) {
      while (distance < metric.length) {
        final extractPath = metric.extractPath(distance, distance + dashWidth);
        canvas.drawPath(extractPath, dottedPaint);
        distance += dashWidth + dashSpace;
      }
    }

    // final dividerPaint = Paint()
    //   ..color = Color(0XFFE2E5EA)
    //   ..strokeWidth = 1
    //   ..style = PaintingStyle.stroke;

    // double dividerY = size.height * 1 + offset + dividerOffset;

    // canvas.drawLine(
    //   Offset(0, dividerY),
    //   Offset(size.width, dividerY),
    //   dividerPaint,
    // );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    if (oldDelegate is WavePainter) {
      return dottedLineOffset != oldDelegate.dottedLineOffset ||
          dividerOffset != oldDelegate.dividerOffset ||
          drawShadow != oldDelegate.drawShadow;
    }
    return true;
  }
}
