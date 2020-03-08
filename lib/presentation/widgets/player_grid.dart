import 'package:flutter/material.dart';

import '../../domain/entities/game.dart';
import 'player_card.dart';

class PlayerGrid extends StatelessWidget {
  final Game currentGame;

  PlayerGrid({Key key, @required this.currentGame}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        return GridView.builder(
          itemCount: currentGame.players.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: (orientation == Orientation.portrait) ? 2 : 3),
          itemBuilder: (BuildContext context, int index) {
            return PlayerCard(
              currentPlayer: currentGame.players[index],
              pointsToWin: currentGame.pointsToWin,
            );
          },
        );
      },
    );
  }
}
