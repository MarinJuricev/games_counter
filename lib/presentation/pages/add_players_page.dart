import 'package:flutter/material.dart';

import '../widgets/game_title.dart';

class AddPlayersPage extends StatelessWidget {
  static const ROUTE_NAME = '/add-players';
  const AddPlayersPage({Key key}) : super(key: key);

  Widget _buildAddPlayers() {
    return Text('Test');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          GameTitle(gameTitle: 'Game title'),
          Expanded(
            child: Center(
              child: _buildAddPlayers(),
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
