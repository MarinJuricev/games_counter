import 'package:flutter/material.dart';

import '../../core/constants/budget_constants.dart';
import '../../domain/entities/player.dart';
import '../pages/player_details_page.dart';
import 'player_progress.dart';

class PlayerCard extends StatelessWidget {
  const PlayerCard({
    Key key,
    @required this.currentPlayer,
  }) : super(key: key);

  final Player currentPlayer;

  Widget _flightShuttleBuilder(
    BuildContext flightContext,
    Animation<double> animation,
    HeroFlightDirection flightDirection,
    BuildContext fromHeroContext,
    BuildContext toHeroContext,
  ) {
    return DefaultTextStyle(
      style: DefaultTextStyle.of(toHeroContext).style,
      child: toHeroContext.widget,
    );
  }

  @override
  Widget build(BuildContext context) {
    final TextStyle style = Theme.of(context).accentTextTheme.title.copyWith(
          fontSize: 20,
          fontWeight: FontWeight.normal,
        );

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
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => PlayerDetailsPage(
                  currentPlayer: currentPlayer,
                ),
              ),
            );
          },
          borderRadius: BorderRadius.circular(16.0),
          splashColor: Theme.of(context).accentColor,
          child: GridTile(
            header: Center(
              heightFactor: 2,
              child: Hero(
                tag: '$HERO_TAG_CARD_TITLE+${currentPlayer.name}',
                child: Text(
                  '${currentPlayer.name} ',
                  style: style,
                ),
              ),
            ),
            child: Hero(
                flightShuttleBuilder: _flightShuttleBuilder,
                tag: '$HERO_TAG_CARD_POINTS+${currentPlayer.name}',
                child: PlayerProgress(currentPlayer: currentPlayer)),
          ),
        ),
      ),
    );
  }
}
