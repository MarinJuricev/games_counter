import 'package:flutter/material.dart';
import 'package:game_counter/domain/entities/player.dart';

class PlayerDetailsPage extends StatelessWidget {
  final Player player;

  const PlayerDetailsPage({Key key, this.player}) : super(key: key);

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
          child: Hero(
            tag: 'playerNameHeroTag',
            child: Text(
              player.name,
              style: Theme.of(context).accentTextTheme.title.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
