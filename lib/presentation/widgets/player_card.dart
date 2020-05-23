import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/constants/budget_constants.dart';
import '../../domain/entities/player.dart';
import '../feature/core/game_bloc.dart';
import '../feature/player_detail/player_details_page.dart';
import 'player_progress.dart';

class PlayerCard extends StatelessWidget {
  final Player currentPlayer;
  final int pointsToWin;

  const PlayerCard({
    Key key,
    @required this.currentPlayer,
    @required this.pointsToWin,
  }) : super(key: key);

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
    final TextStyle style = Theme.of(context).accentTextTheme.bodyText1.copyWith(
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
                  pointsToWin: pointsToWin,
                ),
              ),
            );
          },
          borderRadius: BorderRadius.circular(16.0),
          splashColor: Theme.of(context).accentColor,
          child: GridTile(
            header: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                children: <Widget>[
                  // Just a placeholder widget so that we get the desired 1:3:1 flex behaviour
                  Expanded(child: SizedBox()),
                  Expanded(
                    flex: 3,
                    child: Hero(
                      tag: '$HERO_TAG_CARD_TITLE+${currentPlayer.name}',
                      child: Text(
                        '${currentPlayer.name} ',
                        style: style,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Expanded(
                    // ImageButton has material padding in-built, instead we use
                    // a gestureDetector to achive the same result but without the
                    // material badding from ImageButton
                    child: GestureDetector(
                      onTap: () =>
                          _addDeletePlayerEvent(context, currentPlayer),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Container(
                          width: 30,
                          height: 30,
                          child: Icon(
                            Icons.clear,
                            color: Colors.grey,
                            size: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
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

  _addDeletePlayerEvent(
    BuildContext parentContext,
    Player currentPlayer,
  ) {
    return showDialog<void>(
      context: parentContext,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: const Text('Delete Player'),
          content: const Text('Do you really want to delete this player?'),
          actions: <Widget>[
            CupertinoDialogAction(
              isDefaultAction: true,
              child: const Text('Yes'),
              onPressed: () {
                BlocProvider.of<GameBloc>(parentContext)
                  ..add(GameEvent.deletePlayer(
                    playerToDelete: currentPlayer,
                  ));
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
}
