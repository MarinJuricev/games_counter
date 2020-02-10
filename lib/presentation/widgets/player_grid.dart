import 'package:flutter/material.dart';
import 'package:game_counter/domain/entities/game.dart';

class PlayerGrid extends StatefulWidget {
  final Game currentGame;

  PlayerGrid({Key key, @required this.currentGame}) : super(key: key);

  @override
  _PlayerGridState createState() => _PlayerGridState();
}

class _PlayerGridState extends State<PlayerGrid> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
          'Masovin igraci, ima ih ${widget.currentGame.players.length}'),
    );
  }
}
