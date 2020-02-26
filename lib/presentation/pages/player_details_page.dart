import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/player_detail/player_detail_bloc.dart';

import '../../di.dart' as di;
import '../../core/constants/budget_constants.dart';
import '../../domain/entities/player.dart';
import '../widgets/out_lined_button.dart';
import '../widgets/player_progress.dart';
import '../widgets/point_indicator.dart';
import '../widgets/point_picker.dart';

class PlayerDetailsPage extends StatelessWidget {
  final Player currentPlayer;

  const PlayerDetailsPage({
    Key key,
    this.currentPlayer,
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
    return BlocProvider(
      create: (_) => di.sl<PlayerDetailBloc>(),
      child: Scaffold(
        body: BlocBuilder<PlayerDetailBloc, PlayerDetailState>(
          builder: (context, state) {
            return _buildDetailPage(state, context);
          },
        ),
      ),
    );
  }

  Widget _buildDetailPage(PlayerDetailState state, BuildContext context) {
    final TextStyle style = Theme.of(context).accentTextTheme.title.copyWith(
          fontSize: 20,
          fontWeight: FontWeight.normal,
        );

    int newMainPoints = 0;
    int newBonusPoints = 0;

    if (state is PlayerDetailInitialState) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(24),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: Theme.of(context).textTheme.title.color,
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 8,
                        color: Colors.black26,
                        offset: Offset(0, 2))
                  ]),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SizedBox(height: 16.0),
                  Hero(
                    tag: '$HERO_TAG_CARD_TITLE+${currentPlayer.name}',
                    child: Text(
                      '${currentPlayer.name} ',
                      style: style,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Hero(
                    tag: '$HERO_TAG_CARD_POINTS+${currentPlayer.name}',
                    flightShuttleBuilder: _flightShuttleBuilder,
                    child: PlayerProgress(currentPlayer: currentPlayer),
                  ),
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
                  SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      PointPicker(
                        currentPlayer: currentPlayer,
                        color: Colors.purple,
                        callback: (pickerMainPoints) =>
                            newMainPoints = pickerMainPoints,
                      ),
                      PointPicker(
                          currentPlayer: currentPlayer,
                          color: Colors.orange,
                          callback: (pickerBonusPoints) =>
                              newBonusPoints = pickerBonusPoints),
                    ],
                  ),
                  SizedBox(height: 24.0)
                ],
              ),
            ),
            SizedBox(height: 16.0),
            OutLinedButton(
                onPressedEvent: () => _addSaveClickedEvent(
                    context, newMainPoints, newBonusPoints, currentPlayer),
                title: 'Save',
                width: 64),
            SizedBox(height: 16.0),
            OutLinedButton(
                onPressedEvent: () => _popCurrentPage(context),
                title: 'Cancel',
                width: 64),
            SizedBox(height: 16.0),
            OutLinedButton(onPressedEvent: () {}, title: 'Reset', width: 64),
          ],
        ),
      );
    }
  }

  void _popCurrentPage(BuildContext context) {
    Navigator.of(context).pop();
  }

  void _addSaveClickedEvent(
    BuildContext context,
    int newMainPoints,
    int newBonusPoints,
    Player currentPlayer,
  ) {
    BlocProvider.of<PlayerDetailBloc>(context).add(PlayerDetailSaveClickedEvent(
      newMainPoints: newMainPoints,
      newBonusPoints: newBonusPoints,
      currentPlayer: currentPlayer,
    ));
  }
}
