import 'package:animations/animations.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/create_game.dart';
import '../../widgets/error.dart';
import '../../widgets/game_over.dart';
import '../../widgets/game_title.dart';
import '../../widgets/player_grid.dart';
import '../add_player/add_player_page.dart';
import '../core/game_bloc.dart';

const double _fabDimension = 56.0;

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GameBloc, GameState>(
      listenWhen: (previousState, currentState) {
        return currentState.maybeMap(
          orElse: () => false,
          errorState: (_) => true,
        );
      },
      listener: (builderContext, state) {
        return state.maybeWhen(
          orElse: () => null,
          errorState: (String errorMessage) => {
             Flushbar(
              message: errorMessage,
              icon: Icon(
                Icons.error,
                size: 28.0,
                color: Colors.red,
              ),
              duration: Duration(seconds: 3),
              leftBarIndicatorColor: Colors.red,
            )..show(builderContext)
          },
        );
      },
      buildWhen: (previousState, currentState) {
        return currentState.maybeMap(
          orElse: () => true,
          errorState: (_) => false,
        );
      },
      builder: (builderContext, state) {
        return Scaffold(
          body: Column(
            children: <Widget>[
              GameTitle(),
              Expanded(
                child: _buildCreateGame(state),
              ),
            ],
          ),
          floatingActionButton: _buildAddPlayerFab(builderContext, state),
        );
      },
    );
  }

  Widget _buildCreateGame(GameState state) {
    return state.when(
      initialState: () => CreateGame(),
      updatedState: (updatedGame) => PlayerGrid(
        currentGame: updatedGame,
      ),
      errorState: (errorMessage) => ErrorContainer(
        erorrMessage: errorMessage,
      ),
      overState: (winner) => GameOver(winner: winner),
    );
  }

  Widget _buildAddPlayerFab(BuildContext builderContext, GameState state) {
    return state.when(
      initialState: () => Container(),
      updatedState: (_) => _renderAddPlayerFab(builderContext),
      errorState: (_) => _renderAddPlayerFab(builderContext),
      overState: (_) => Container(),
    );
  }

  Widget _renderAddPlayerFab(BuildContext builderContext) {
    return OpenContainer(
      openBuilder: (BuildContext context, VoidCallback _) {
        return AddPlayerPage(
            gameBloc: BlocProvider.of<GameBloc>(builderContext));
      },
      closedElevation: 6.0,
      closedShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(_fabDimension / 2),
        ),
      ),
      closedColor: Theme.of(context).colorScheme.secondary,
      closedBuilder: (BuildContext context, VoidCallback openContainer) {
        return Container(
          color: Colors.white,
          child: SizedBox(
            height: _fabDimension,
            width: _fabDimension,
            child: Center(
              child: Icon(
                Icons.add,
                color: Theme.of(builderContext).scaffoldBackgroundColor,
              ),
            ),
          ),
        );
      },
    );
  }
}
