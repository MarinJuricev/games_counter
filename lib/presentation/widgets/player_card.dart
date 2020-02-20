import 'package:flutter/material.dart';

import '../../domain/entities/player.dart';
import '../pages/player_details_page.dart';
import 'player_progress.dart';

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
                currentPlayer: currentPlayer,
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
            child: PlayerProgress(currentPlayer: currentPlayer),
          ),
        ),
      ),
    );
  }
}
