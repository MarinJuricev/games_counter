import 'package:flutter/material.dart';

import '../widgets/bottom_nav.dart';
import '../widgets/game_title.dart';

class AddPlayersPage extends StatelessWidget {
  static const ROUTE_NAME = '/add-players';
  const AddPlayersPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          GameTitle(gameTitle: 'Game title'),
          Expanded(
            child: Center(
              child: Text('Add Players'),
            ),
          ),
        ],
      ),
    );
  }
}