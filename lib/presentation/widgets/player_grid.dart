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
    return OrientationBuilder(
      builder: (context, orientation) {
        return GridView.builder(
          itemCount: widget.currentGame.players.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: (orientation == Orientation.portrait) ? 2 : 3),
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 16.0,
                horizontal: 8.0,
              ),
              child: Card(
                elevation: 4.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                color: Colors.white,
                child: GridTile(
                  header: Center(
                    heightFactor: 2,
                    child: Text(
                      widget.currentGame.players[index].name,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  child: Text(
                    widget.currentGame.players[index].points.toString(),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
