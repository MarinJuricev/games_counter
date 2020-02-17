import 'dart:math' as math;

import 'package:flutter/material.dart';

class GradientArcPainter extends CustomPainter {
  const GradientArcPainter({
    @required this.progress,
    @required this.startColor,
    @required this.endColor,
    @required this.width,
    @required this.startClockWise,
  })  : assert(progress != null),
        assert(startColor != null),
        assert(endColor != null),
        assert(width != null),
        assert(startClockWise != null),
        super();

  final double progress;
  final Color startColor;
  final Color endColor;
  final double width;
  final bool startClockWise;

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTWH(0.0, 0.0, size.width, size.height);
    final gradient = SweepGradient(
      startAngle: 3 * math.pi / 2,
      endAngle: 7 * math.pi / 2,
      tileMode: TileMode.repeated,
      colors: [startColor, endColor],
    );

    final paint = Paint()
      ..shader = gradient.createShader(rect)
      ..strokeCap = StrokeCap.butt // StrokeCap.round is not recommended.
      ..style = PaintingStyle.stroke
      ..strokeWidth = width;
    final center = Offset(size.width / 2, size.height / 2);
    final radius = math.min(size.width / 2, size.height / 2) - (width / 2);
    final startAngle = -math.pi / 2;
    final sweepAngle = sweepDependingOnClocWise(startClockWise, progress);
    canvas.drawArc(
        Rect.fromCircle(
          center: center,
          radius: radius,
        ),
        startAngle,
        sweepAngle,
        false,
        paint);

        // canvas.drawShadow(Path(), Colors.grey, 4.0, false);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

double sweepDependingOnClocWise(bool startClockWise, double progress) {
  if (startClockWise)
    return 2 * math.pi * progress;
  else
    return -2 * math.pi * progress;
}
