import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/add_player/add_player_bloc.dart';
import '../widgets/game_not_created.dart';

import '../bloc/game/game_bloc.dart';
import '../widgets/game_title.dart';

class AddPlayersPage extends StatelessWidget {
  static const ROUTE_NAME = '/add-players';
  const AddPlayersPage({Key key}) : super(key: key);

  Widget _buildAddPlayersDependingOnGameCreationState() {
    return BlocBuilder<GameBloc, GameState>(
        builder: (context, state) {
      if (state is GameInitialState) {
        return GameNotCreated();
      } else if (state is GameCreatedState) {
        BlocBuilder<AddPlayerBloc, AddPlayerState>(builder: (context, state) {
          return Center(
            child: Text('Some Text ?'),
          );
        });

        //   BlocBuilder<AddPlayerBloc, AddPlayerState>(
        // builder: (BuildContext context, AddPlayerState state) {
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          GameTitle(gameTitle: 'Game title'),
          Expanded(
            child: _buildAddPlayersDependingOnGameCreationState(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {},
        child: Icon(
          Icons.add,
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
      ),
    );
  }
}
