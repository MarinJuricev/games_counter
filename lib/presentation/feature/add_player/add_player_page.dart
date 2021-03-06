import 'package:flutter/material.dart';

import '../../widgets/create_player.dart';
import '../core/game_bloc.dart';


class AddPlayerPage extends StatelessWidget {
  final GameBloc gameBloc;

  const AddPlayerPage({Key key, this.gameBloc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Player')),
      backgroundColor: Theme.of(context).primaryColor,
      body: CreatePlayer(gameBloc: gameBloc),
    );
  }
}
