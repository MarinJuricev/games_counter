import 'package:flutter/material.dart';

import '../../domain/entities/player.dart';
import 'gradient_arc_painter.dart';

class PlayerProgress extends StatelessWidget {
  final Player currentPlayer;

  const PlayerProgress({
    Key key,
    this.currentPlayer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (currentPlayer.points == 0 && currentPlayer.bonusPoints == 0) {
      return Stack(
        children: <Widget>[
          Center(
            child: Container(
              height: 75,
              width: 75,
              child: CustomPaint(
                painter: GradientArcPainter(
                  progress: 1.00,
                  startColor: Colors.grey.withAlpha(100),
                  endColor: Colors.grey.withAlpha(100),
                  width: 4.0,
                  startClockWise: false,
                ),
                child: Center(
                  child: Text(
                    currentPlayer.points.toString(),
                    style: TextStyle(
                      color: Colors.grey.shade700,
                      fontSize: 32,
                      shadows: [
                        Shadow(
                          blurRadius: 5.0,
                          color: Colors.grey,
                          offset: Offset(0.0, 2.5),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    } else {
      return Stack(
        children: <Widget>[
          Center(
            child: Container(
              height: 75,
              width: 75,
              child: CustomPaint(
                  painter: GradientArcPainter(
                progress:
                    currentPlayer.bonusPoints / currentPlayer.sumOfAllPoints(),
                startColor: Colors.orange,
                endColor: Colors.white,
                width: 4.0,
                startClockWise: false,
              )),
            ),
          ),
          Center(
            child: Container(
              height: 75,
              width: 75,
              child: CustomPaint(
                painter: GradientArcPainter(
                  progress: currentPlayer.points / currentPlayer.sumOfAllPoints(),
                  startColor: Colors.purple.shade200,
                  endColor: Colors.purple.shade600,
                  width: 4.0,
                  startClockWise: true,
                ),
                child: Center(
                  child: Text(
                    currentPlayer.sumOfAllPoints.toString(),
                    style: TextStyle(
                      color: Colors.grey.shade700,
                      fontSize: 32,
                      shadows: [
                        Shadow(
                          blurRadius: 5.0,
                          color: Colors.grey,
                          offset: Offset(0.0, 2.5),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    }
  }
}
