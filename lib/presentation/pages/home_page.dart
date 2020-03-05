import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/game/game_bloc.dart';
import '../widgets/create_game.dart';
import '../widgets/create_player.dart';
import '../widgets/error.dart';
import '../widgets/game_title.dart';
import '../widgets/player_grid.dart';

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
    } else if (state is GameErrorState) {
      return ErrorContainer(erorrMessage: state.errorMessage);
    } else if (state is GamePlayerCreationState){
      return CreatePlayer();
    }
  }

  Widget _buildAddPlayerFab(BuildContext builderContext, GameState state) {
    if (state is !GameInitialState) {
      return FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () => _addPlayerCreationEvent(builderContext),
        child: Icon(
          Icons.add,
          color: Theme.of(builderContext).scaffoldBackgroundColor,
        ),
      );
    } else
      return null;
  }

  void _addPlayerCreationEvent(BuildContext context) {
    BlocProvider.of<GameBloc>(context).add(PlayerCreationStartedEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GameBloc, GameState>(
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
