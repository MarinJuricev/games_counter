import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/game/game_bloc.dart';

class CreateGame extends StatefulWidget {
  const CreateGame({
    Key key,
  }) : super(key: key);

  @override
  _CreateGameState createState() => _CreateGameState();
}

class _CreateGameState extends State<CreateGame> {
  String gameTitle;
  String numberOfPlayers;
  String winningPoints;

  final _gameFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _gameFormKey,
      child: Center(
        child: Container(
          margin: EdgeInsets.all(24),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              color: Theme.of(context).accentColor,
              boxShadow: [
                BoxShadow(
                    blurRadius: 8, color: Colors.black26, offset: Offset(0, 2))
              ]),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 32),
                child: TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Game title can\'t be empty';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    gameTitle = value;
                  },
                  decoration: InputDecoration(
                    labelText: 'Game Title',
                    errorStyle: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                    ),
                    labelStyle: TextStyle(color: Colors.white),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Theme.of(context).scaffoldBackgroundColor),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                  keyboardType: TextInputType.text,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 32),
                child: TextFormField(
                  validator: (value) {
                    if (value.isEmpty ||
                        num.parse(value).isNegative ||
                        value == '0') {
                      return 'The value can\'t be empty, and must be a positive number!';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    numberOfPlayers = value;
                  },
                  decoration: InputDecoration(
                    errorMaxLines: 2,
                    errorStyle: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                    ),
                    labelText: 'Number of Players',
                    labelStyle: TextStyle(color: Colors.white),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Theme.of(context).scaffoldBackgroundColor),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 32),
                child: TextFormField(
                  validator: (value) {
                    if (value.isEmpty ||
                        num.parse(value).isNegative ||
                        value == '0') {
                      return 'The value can\'t be empty, and must be a positive number!';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    winningPoints = value;
                  },
                  decoration: InputDecoration(
                    errorMaxLines: 2,
                    errorStyle:
                        TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold),
                    labelText: 'Winning Points',
                    labelStyle: TextStyle(color: Colors.white),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Theme.of(context).scaffoldBackgroundColor),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              Align(
                alignment: FractionalOffset.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 32.0, vertical: 8.0),
                  child: FlatButton(
                    padding:
                        EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
                    child: Text(
                      'CREATE GAME',
                      style: TextStyle(fontSize: 12.0),
                    ),
                    textColor: Colors.white,
                    onPressed: addCreateGameEvent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.white),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void addCreateGameEvent() {
    if (_gameFormKey.currentState.validate()) {
      BlocProvider.of<GameBloc>(context).add(CreatedGameEvent(
          gameTitle: gameTitle,
          numberOfPlayers: numberOfPlayers,
          pointsToWin: winningPoints));
    }
  }
}
