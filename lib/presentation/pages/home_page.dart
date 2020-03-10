import 'package:animations/animations.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/game/game_bloc.dart';
import '../widgets/create_game.dart';
import '../widgets/error.dart';
import '../widgets/game_over.dart';
import '../widgets/game_title.dart';
import '../widgets/player_grid.dart';
import 'add_player_page.dart';

const double _fabDimension = 56.0;

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget _buildCreateGame(GameState state) {
    if (state is GameInitialState) {
      return CreateGame();
    } else if (state is GameCreatedState) {
      return PlayerGrid(currentGame: state.game);
    } else if (state is GameUpdatedState) {
      return PlayerGrid(currentGame: state.game);
    } else if (state is GameOverState) {
      return GameOver(winner: state.player);
    } else if(state is GameErrorState){
      return ErrorContainer(erorrMessage: state.errorMessage,);
    }
  }

  Widget _buildAddPlayerFab(BuildContext builderContext, GameState state) {
    if (state is! GameInitialState && state is! GameOverState) {
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
    } else
      return null; // returning null won't render the widget
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GameBloc, GameState>(
      listenWhen: (previousState, currentState) {
        return (currentState is GameErrorState);
      },
      listener: (builderContext, state) {
        if (state is GameErrorState) {
          Flushbar(
            message: state.errorMessage,
            icon: Icon(
              Icons.error,
              size: 28.0,
              color: Colors.red,
            ),
            duration: Duration(seconds: 3),
            leftBarIndicatorColor: Colors.red,
          )..show(builderContext);
        }
      },
      buildWhen: (previousState, currentState) {
        return (currentState is !GameErrorState);
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
}
