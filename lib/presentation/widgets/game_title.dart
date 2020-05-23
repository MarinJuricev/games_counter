

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../feature/core/game_bloc.dart';

class GameTitle extends StatelessWidget {
  const GameTitle({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GameBloc, GameState>(
      builder: (_, state) {
        if (state is GameUpdatedState) {
          return _buildGameTitle(state.game.name, context);
        } else {
          return Container(); // Just render a empty container in other states...
        }
      },
    );
  }

  Widget _buildGameTitle(String gameTitle, BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 124),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Expanded(
            child: Divider(
              color: Colors.white,
              thickness: 2,
            ),
          ),
          Expanded(
            flex: 0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                gameTitle,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            child: Divider(
              color: Colors.white,
              thickness: 2,
            ),
          ),
        ],
      ),
    );
  }
}
