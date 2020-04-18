import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_counter/presentation/bloc/game/game_bloc.dart';

import '../../domain/entities/game.dart';
import 'no_players.dart';
import 'out_lined_button.dart';
import 'player_card.dart';

class PlayerGrid extends StatelessWidget {
  final Game currentGame;

  PlayerGrid({Key key, @required this.currentGame}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (_, orientation) {
        if (currentGame.players.isEmpty) {
          return NoPlayers();
        } else {
          return Column(
            children: <Widget>[
              Expanded(
                child: GridView.builder(
                  itemCount: currentGame.players.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount:
                          (orientation == Orientation.portrait) ? 2 : 3),
                  itemBuilder: (BuildContext context, int index) {
                    return PlayerCard(
                      currentPlayer: currentGame.players[index],
                      pointsToWin: currentGame.pointsToWin,
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: OutLinedButton(
                  onPressedEvent: () => _addEndGameSoonerEvent(
                    context,
                    currentGame,
                  ),
                  title: 'End Game',
                  backgroundColor: Colors.white,
                ),
              )
            ],
          );
        }
      },
    );
  }
}

_addEndGameSoonerEvent(
  BuildContext parentContext,
  Game currentGame,
) {
  return showDialog<void>(
    context: parentContext,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return CupertinoAlertDialog(
        title: const Text('End Game'),
        content: const Text('Do you really want to end the game sooner?'),
        actions: <Widget>[
          CupertinoDialogAction(
            isDefaultAction: true,
            child: const Text('Yes'),
            onPressed: () {
              BlocProvider.of<GameBloc>(parentContext)
                ..add(GameEvent.endGameSooner(currentGame: currentGame));
              Navigator.of(context).pop();
            },
          ),
          CupertinoDialogAction(
            child: const Text('No'),
            onPressed: () => Navigator.of(context).pop(),
          )
        ],
      );
    },
  );
}
