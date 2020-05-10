import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_counter/presentation/bloc/game/game_bloc.dart';

import '../../domain/entities/player.dart';
import 'out_lined_button.dart';
import 'player_progress.dart';
import 'point_indicator.dart';

class GameOver extends StatelessWidget {
  final Player winner;

  const GameOver({Key key, this.winner}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.all(24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: Theme.of(context).textTheme.bodyText1.color,
          boxShadow: [
            BoxShadow(
                blurRadius: 8, color: Colors.black26, offset: Offset(0, 2)),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                'Game Winner: ${winner.name}',
                style: Theme.of(context).accentTextTheme.bodyText1.copyWith(
                      fontSize: 24,
                      fontWeight: FontWeight.normal,
                    ),
              ),
              SizedBox(height: 32.0),
              PlayerProgress(currentPlayer: winner),
              SizedBox(height: 32.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  PointIndicator(
                      pointColor: Colors.purple, pointText: 'Main Points'),
                  PointIndicator(
                      pointColor: Colors.orange, pointText: 'Bonus Points')
                ],
              ),
              SizedBox(height: 32.0),
              OutLinedButton(
                  onPressedEvent: () => _resetGame(context),
                  title: 'New Game',
                  backgroundColor: Theme.of(context).accentColor,
                  width: 64),
            ],
          ),
        ),
      ),
    );
  }
}

_resetGame(BuildContext context) {
  BlocProvider.of<GameBloc>(context)..add(GameEvent.resetGame());
}
