import 'package:flutter/material.dart';

import '../../domain/entities/player.dart';
import '../widgets/player_progress.dart';
import '../widgets/points_indicator.dart';

class PlayerDetailsPage extends StatelessWidget {
  final Player currentPlayer;

  const PlayerDetailsPage({Key key, this.currentPlayer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: EdgeInsets.all(24),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              color: Theme.of(context).textTheme.title.color,
              boxShadow: [
                BoxShadow(
                    blurRadius: 8, color: Colors.black26, offset: Offset(0, 2))
              ]),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(height: 16.0),
              Hero(
                tag: 'playerNameHeroTag',
                child: Text(
                  currentPlayer.name,
                  style: Theme.of(context).accentTextTheme.title.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                      ),
                ),
              ),
              SizedBox(height: 16.0),
              PlayerProgress(currentPlayer: currentPlayer),
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
              SizedBox(height: 24.0),
            ],
          ),
        ),
      ),
    );
  }
}


