import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/game/bloc/game_bloc.dart';
import '../widgets/create_game.dart';
import '../widgets/game_title.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget _buildCreateGame() {
    return BlocBuilder<GameBloc, GameState>(
      builder: (BuildContext context, GameState state) {
        if (state is GameInitialState) {
          return CreateGame();
        } else if (state is GameCreatedState){
          return Center(
            child: Text('Igra kreirana so hype, much wow'),
          );
        }else if (state is ErrorState){
          return Center(
            child: Text('Erorr tebra, much wow'),
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
          Expanded(
            child: _buildCreateGame(),
          ),
        ],
      ),
    );
  }
}

