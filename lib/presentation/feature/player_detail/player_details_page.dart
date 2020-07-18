import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants/budget_constants.dart';
import '../../../di.dart' as di;
import '../../../domain/entities/player.dart';
import '../../widgets/out_lined_button.dart';
import '../../widgets/player_progress.dart';
import '../../widgets/point_indicator.dart';
import '../../widgets/point_picker.dart';
import 'bloc/player_detail_bloc.dart';

class PlayerDetailsPage extends StatefulWidget {
  final Player currentPlayer;
  final int pointsToWin;

  const PlayerDetailsPage({
    Key key,
    this.currentPlayer,
    this.pointsToWin,
  }) : super(key: key);

  @override
  _PlayerDetailsPageState createState() => _PlayerDetailsPageState();
}

class _PlayerDetailsPageState extends State<PlayerDetailsPage> {
  bool _shouldDeduct = false;

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
        body: SingleChildScrollView(
          child: BlocBuilder<PlayerDetailBloc, PlayerDetailState>(
            builder: (context, state) {
              return _buildDetailPage(state, context);
            },
          ),
        ),
      ),
    );
  }

  Widget _buildDetailPage(PlayerDetailState state, BuildContext context) {
    final TextStyle style =
        Theme.of(context).accentTextTheme.bodyText1.copyWith(
              fontSize: 20,
              fontWeight: FontWeight.normal,
            );

    return state.maybeWhen(
      orElse: () => Container(),
      initialState: () => _detailView(
        context: context,
        mainPoints: 0,
        bonusPoints: 0,
        player: widget.currentPlayer,
        pointsToWin: widget.pointsToWin,
        style: style,
      ),
      updatedState: (player) => _detailView(
          context: context,
          mainPoints: player.points,
          bonusPoints: player.bonusPoints,
          pointsToWin: widget.pointsToWin,
          player: player,
          style: style),
    );
  }

  Widget _detailView({
    BuildContext context,
    TextStyle style,
    int mainPoints,
    int bonusPoints,
    Player player,
    int pointsToWin,
  }) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(24),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: Theme.of(context).textTheme.bodyText1.color,
                boxShadow: [
                  BoxShadow(
                      blurRadius: 8,
                      color: Colors.black26,
                      offset: Offset(0, 2))
                ]),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const SizedBox(height: 16.0),
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
                const SizedBox(height: 32.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    PointIndicator(
                        pointColor: Colors.purple, pointText: 'Main Points'),
                    PointIndicator(
                        pointColor: Colors.orange, pointText: 'Bonus Points')
                  ],
                ),
                const SizedBox(height: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    PointPicker(
                      currentPlayer: player,
                      color: Colors.purple,
                      pointsToWin: pointsToWin,
                      callback: (pickerMainPoints) =>
                          mainPoints = pickerMainPoints,
                      shouldInvertValues: _shouldDeduct,
                    ),
                    PointPicker(
                      currentPlayer: player,
                      color: Colors.orange,
                      pointsToWin: pointsToWin,
                      callback: (pickerBonusPoints) =>
                          bonusPoints = pickerBonusPoints,
                      shouldInvertValues: _shouldDeduct,
                    ),
                  ],
                ),
                const SizedBox(height: 16.0),
                SwitchListTile.adaptive(
                  value: _shouldDeduct,
                  onChanged: (bool newValue) {
                    setState(() {
                      _shouldDeduct = newValue;
                    });
                  },
                  contentPadding: EdgeInsets.symmetric(horizontal: 24.0),
                  title: Text(
                    'Deduct Points',
                    style: TextStyle(color: Theme.of(context).accentColor),
                  ),
                  subtitle: Text(
                    'Inverts the picker values.',
                    style: TextStyle(
                        fontSize: 12,
                        color: Theme.of(context).scaffoldBackgroundColor),
                  ),
                ),
                const SizedBox(height: 16.0),
              ],
            ),
          ),
          SizedBox(height: 16.0),
          OutLinedButton(
              onPressedEvent: () => _addSaveClickedEvent(
                  context, mainPoints, bonusPoints, player),
              title: 'Save',
              backgroundColor: Colors.white,
              width: 64),
          SizedBox(height: 16.0),
          OutLinedButton(
              onPressedEvent: () => Navigator.of(context).pop(),
              title: 'Cancel',
              backgroundColor: Colors.white,
              width: 64),
          SizedBox(height: 16.0),
          OutLinedButton(
            onPressedEvent: () => _resetPlayerPoints(context, player),
            title: 'Reset',
            backgroundColor: Colors.white,
            width: 64,
          ),
        ],
      ),
    );
  }

  void _resetPlayerPoints(
    BuildContext context,
    Player updatedPlayer,
  ) {
    BlocProvider.of<PlayerDetailBloc>(context)
        .add(PlayerDetailEvent.resetClicked(currentPlayer: updatedPlayer));

    Navigator.of(context).pop();
  }

  void _addSaveClickedEvent(
    BuildContext context,
    int updatedMainPoints,
    int updatedBonusPoints,
    Player updatedPlayer,
  ) {
    BlocProvider.of<PlayerDetailBloc>(context)
        .add(PlayerDetailEvent.saveClicked(
      newMainPoints: updatedMainPoints,
      newBonusPoints: updatedBonusPoints,
      currentPlayer: updatedPlayer,
    ));

    Navigator.of(context).pop();
  }
}
