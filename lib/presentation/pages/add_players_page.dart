import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../di.dart' as di;
import '../bloc/add_player/add_player_bloc.dart';
import '../widgets/game_not_created.dart';
import '../widgets/game_title.dart';

class AddPlayersPage extends StatelessWidget {
  static const ROUTE_NAME = '/add-players';
  const AddPlayersPage({Key key}) : super(key: key);

  Widget _buildAddPlayersDependingOnGameCreationState() {
    return BlocBuilder<AddPlayerBloc, AddPlayerState>(
      builder: (context, state) {
        if (state is AddPlayerInitialState) {
          return CircularProgressIndicator();
        } else if (state is AddPlayerGameNotCreatedState) {
          return GameNotCreated();
        } else {
          return Center(
            child: Text('Nesta drugo ${state.toString}'),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          GameTitle(gameTitle: 'Game title'),
          BlocProvider(
            create: (context) => di.sl<AddPlayerBloc>(),
            child: Expanded(
              child: _buildAddPlayersDependingOnGameCreationState(),
            ),
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
