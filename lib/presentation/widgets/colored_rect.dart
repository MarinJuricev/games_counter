import 'package:flutter/material.dart';

class ColoredRect extends CustomPainter {
  final Color _rectColor;
  ColoredRect(this._rectColor);

  @override
  void paint(Canvas canvas, Size size) {
    final offset = Offset(size.width / 2, size.height / 2);

    canvas.drawRect(
      Rect.fromCircle(center: offset, radius: 8.0),
      Paint()..color = _rectColor,
    );
  }

  @override
  bool shouldRepaint(ColoredRect oldDelegate) {
    return false;
  }
}
