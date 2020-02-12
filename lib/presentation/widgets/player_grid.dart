import 'dart:math';

import 'package:flutter/material.dart';
import 'package:game_counter/domain/entities/game.dart';
import 'package:game_counter/presentation/widgets/gradient_arc_painter.dart';

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
                child: InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(16.0),
                  splashColor: Theme.of(context).accentColor,
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
                    child: Stack(
                      children: <Widget>[
                        Center(
                          child: Container(
                            height: 75,
                            width: 75,
                            child: CustomPaint(
                                painter: GradientArcPainter(
                              progress: 0.99,
                              startColor: Colors.orange,
                              endColor: Colors.white,
                              width: 4.0,
                            )),
                          ),
                        ),
                        Center(
                          child: Container(
                            height: 75,
                            width: 75,
                            child: CustomPaint(
                                painter: GradientArcPainter(
                              progress: 0.6,
                              startColor: Colors.purple,
                              endColor: Colors.purple,
                              width: 4.0,
                            )),
                          ),
                        ),
                        Center(
                          child: Text(
                            widget.currentGame.players[index].points.toString(),
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
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  String randomString(int length) {
    var rand = new Random();
    var codeUnits = new List.generate(length, (index) {
      return rand.nextInt(33) + 89;
    });
    return new String.fromCharCodes(codeUnits);
  }
}
