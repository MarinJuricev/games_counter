import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../di.dart' as di;
import '../bloc/add_player/add_player_bloc.dart';
import '../widgets/create_player.dart';
import '../widgets/game_not_created.dart';
import '../widgets/game_title.dart';
import '../widgets/player_grid.dart';

class AddPlayersPage extends StatelessWidget {
  const AddPlayersPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => di.sl<AddPlayerBloc>(),
      child: Builder(
        builder: (builderContext) {
          return BlocBuilder<AddPlayerBloc, AddPlayerState>(
            builder: (context, state) {
              return Scaffold(
                body: Column(
                  children: <Widget>[
                    GameTitle(gameTitle: 'Game title'),
                    Expanded(
                      child: _buildAddPlayersDependingOnGameCreationState(
                        state,
                        builderContext,
                      ),
                    ),
                  ],
                ),
                floatingActionButton:
                    _shouldFabBeVisible(builderContext, state),
              );
            },
          );
        },
      ),
    );
  }

  Widget _shouldFabBeVisible(
      BuildContext builderContext, AddPlayerState state) {
    if (state is AddPlayerGameNotCreatedState ||
        state is AddPlayerInitialState ||
        state is AddPlayerCreationStartedState) {
      return null;
    } else {
      return FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () => _addInitiatePlayerCreationEvent(builderContext),
        child: Icon(
          Icons.add,
          color: Theme.of(builderContext).scaffoldBackgroundColor,
        ),
      );
    }
  }

  Widget _buildAddPlayersDependingOnGameCreationState(
      AddPlayerState state, BuildContext context) {
    if (state is AddPlayerInitialState) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else if (state is AddPlayerGameNotCreatedState) {
      return GameNotCreated();
    } else if (state is AddPlayerCreationStartedState) {
      return CreatePlayer();
    } else if (state is AddPlayerErrorState) {
      //TODO actual error handling and addPlayerErrorState really should return a error message...
      return Center(
        child: Text('Tebra nesto si ujeba pogledaj imena igraca'),
      );
    } else if (state is AddPlayerGameCreatedState) {
      return PlayerGrid(currentGame: state.game);
    } else if (state is AddPlayerCreationFinishedState) {
      return PlayerGrid(currentGame: state.game);
    } else {
      return Center(
        child: Text('Nesta drugo ${state.toString}'),
      );
    }
  }

  void _addInitiatePlayerCreationEvent(BuildContext context) {
    BlocProvider.of<AddPlayerBloc>(context).add(InitiatePlayerCreationEvent());
  }
}
