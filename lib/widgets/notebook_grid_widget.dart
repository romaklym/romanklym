import 'package:flutter/material.dart';

class NotebookGridPainter extends CustomPainter {
  final Color lineColor;
  final double gridSpacing;

  NotebookGridPainter({
    required this.lineColor,
    required this.gridSpacing,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // Fill the background with black
    final backgroundPaint = Paint()..color = const Color(0xFFFFF5DC);
    canvas.drawRect(Offset.zero & size, backgroundPaint);

    // Draw grid lines
    final gridPaint = Paint()
      ..color = lineColor
      ..strokeWidth = 0.5;

    // Draw horizontal lines
    for (double y = 0; y <= size.height; y += gridSpacing) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), gridPaint);
    }

    // Draw vertical lines
    for (double x = 0; x <= size.width; x += gridSpacing) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), gridPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
