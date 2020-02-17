import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_counter/presentation/bloc/add_player/add_player_bloc.dart';

class CreatePlayer extends StatefulWidget {
  CreatePlayer({Key key}) : super(key: key);

  @override
  _CreatePlayerState createState() => _CreatePlayerState();
}

class _CreatePlayerState extends State<CreatePlayer> {
  String playerName;
  String points;
  String bonusPoints;

  final _createPlayerFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    //TODO this type of form is used in multiple screens, extract into separate widget and re-use
    return SingleChildScrollView(
      child: Form(
        key: _createPlayerFormKey,
        child: Center(
          child: Container(
            margin: EdgeInsets.all(24),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              color: Theme.of(context).accentColor,
              boxShadow: [
                BoxShadow(
                    blurRadius: 8, color: Colors.black26, offset: Offset(0, 2)),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 32),
                  child: TextFormField(
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Player name can\'t be empty';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      playerName = value;
                    },
                    decoration: InputDecoration(
                      labelText: 'Player name',
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
                      if (value.isEmpty || num.tryParse(value) == null) {
                        return 'The value can\'t be empty, and must be a number!';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      points = value;
                    },
                    decoration: InputDecoration(
                      errorMaxLines: 2,
                      errorStyle: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                      ),
                      labelText: 'Starting points',
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
                      if (value.isEmpty || num.tryParse(value) == null) {
                        return 'The value can\'t be empty, and must be a number!';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      bonusPoints = value;
                    },
                    decoration: InputDecoration(
                      errorMaxLines: 2,
                      errorStyle: TextStyle(
                          fontSize: 12.0, fontWeight: FontWeight.bold),
                      labelText: 'Starting bonus points',
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
                        'CREATE PLAYER',
                        style: TextStyle(fontSize: 12.0),
                      ),
                      textColor: Colors.white,
                      onPressed: addPlayerCreatedEvent,
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
      ),
    );
  }

  void addPlayerCreatedEvent() {
    if (_createPlayerFormKey.currentState.validate()) {
      BlocProvider.of<AddPlayerBloc>(context).add(
        PlayerCreatedEvent(
          playerName: playerName,
          points: points,
          bonusPoints: bonusPoints,
        ),
      );
    }
  }
}
