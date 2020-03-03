import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/constants/budget_constants.dart';
import '../../di.dart' as di;
import '../../domain/entities/player.dart';
import '../bloc/player_detail/player_detail_bloc.dart';
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

    if (state is PlayerDetailInitialState) {
      return _detailView(
        context: context,
        mainPoints: 0,
        bonusPoints: 0,
        player: currentPlayer,
        style: style,
      );
    } else if (state is PlayerDetailUpdatedState) {
      int updatedMainPoints = state.player.points;
      int updatedBonusPoints = state.player.bonusPoints;
      Player updatedPlayer = state.player;

      return _detailView(
          context: context,
          mainPoints: updatedMainPoints,
          bonusPoints: updatedBonusPoints,
          player: updatedPlayer,
          style: style);
    }
  }

  Widget _detailView({
    BuildContext context,
    TextStyle style,
    int mainPoints,
    int bonusPoints,
    Player player,
  }) {
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
                  tag: '$HERO_TAG_CARD_TITLE+${player.name}',
                  child: Text(
                    '${player.name} ',
                    style: style,
                  ),
                ),
                SizedBox(height: 16.0),
                Hero(
                  tag: '$HERO_TAG_CARD_POINTS+${player.name}',
                  flightShuttleBuilder: _flightShuttleBuilder,
                  child: PlayerProgress(currentPlayer: player),
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
                      currentPlayer: player,
                      color: Colors.purple,
                      callback: (pickerMainPoints) =>
                          mainPoints = pickerMainPoints,
                    ),
                    PointPicker(
                        currentPlayer: player,
                        color: Colors.orange,
                        callback: (pickerBonusPoints) =>
                            bonusPoints = pickerBonusPoints),
                  ],
                ),
                SizedBox(height: 24.0)
              ],
            ),
          ),
          SizedBox(height: 16.0),
          OutLinedButton(
              onPressedEvent: () => _addSaveClickedEvent(
                  context, mainPoints, bonusPoints, player),
              title: 'Save',
              width: 64),
          SizedBox(height: 16.0),
          OutLinedButton(
              onPressedEvent: () => Navigator.of(context).pop(),
              title: 'Cancel',
              width: 64),
          SizedBox(height: 16.0),
          OutLinedButton(onPressedEvent: () {}, title: 'Reset', width: 64),
        ],
      ),
    );
  }

  void _addSaveClickedEvent(
    BuildContext context,
    int updatedMainPoints,
    int updatedBonusPoints,
    Player updatedPlayer,
  ) {
    BlocProvider.of<PlayerDetailBloc>(context).add(PlayerDetailSaveClickedEvent(
      newMainPoints: updatedMainPoints,
      newBonusPoints: updatedBonusPoints,
      currentPlayer: updatedPlayer,
    ));
  }
}
