import 'package:flutter/material.dart';
import 'package:game_counter/presentation/pages/player_details_page.dart';

import '../../domain/entities/player.dart';
import 'gradient_arc_painter.dart';

class PlayerCard extends StatelessWidget {
  const PlayerCard({
    Key key,
    @required this.currentPlayer,
  }) : super(key: key);

  final Player currentPlayer;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 16.0,
        horizontal: 8.0,
      ),
      child: Card(
        elevation: 8.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        color: Colors.white,
        child: InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) {
              return PlayerDetailsPage(
                player: currentPlayer,
              );
            }));
          },
          borderRadius: BorderRadius.circular(16.0),
          splashColor: Theme.of(context).accentColor,
          child: GridTile(
            header: Center(
              heightFactor: 2,
              child: Hero(
                tag: 'playerNameHeroTag',
                child: Text(
                  currentPlayer.name,
                  style: Theme.of(context).accentTextTheme.title.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                      ),
                ),
              ),
            ),
            child: buildPlayerInfoDependingOnPoints(currentPlayer),
          ),
        ),
      ),
    );
  }
}

Widget buildPlayerInfoDependingOnPoints(Player currentPlayer) {
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
            ),
          ),
        ),
        Center(
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
                  currentPlayer.bonusPoints / currentPlayer.sumOfAllPoints,
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
              progress: currentPlayer.points / currentPlayer.sumOfAllPoints,
              startColor: Colors.purple.shade200,
              endColor: Colors.purple.shade600,
              width: 4.0,
              startClockWise: true,
            )),
          ),
        ),
        Center(
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
      ],
    );
  }
}
