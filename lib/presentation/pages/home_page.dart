import 'package:flutter/material.dart';

import '../widgets/game_title.dart';

class HomePage extends StatefulWidget {
  static const ROUTE_NAME = '/';
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          GameTitle(gameTitle: 'Game title'),
          Expanded(
            child: Center(
              child: Text('Home'),
            ),
          ),
        ],
      ),
    );
  }
}
