import 'package:flutter/material.dart';

import '../bloc/game/game_bloc.dart';
import 'out_lined_button.dart';

class CreatePlayer extends StatefulWidget {
  final GameBloc gameBloc;

  CreatePlayer({Key key, this.gameBloc}) : super(key: key);

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
    return Center(
      child: SingleChildScrollView(
        child: Form(
          key: _createPlayerFormKey,
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
                const SizedBox(height: 24),
                Icon(Icons.people, color: Colors.white, size: 48),
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
                const SizedBox(height: 24),
                Icon(Icons.gamepad, color: Colors.white, size: 48),
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
                const SizedBox(height: 24),
                Icon(Icons.gamepad, color: Colors.white, size: 48),
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
                const SizedBox(height: 24),
                Align(
                  alignment: FractionalOffset.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32.0, vertical: 8.0),
                    child: OutLinedButton(
                      onPressedEvent: () => _addPlayerCreatedEvent(),
                      title: 'Create Player',
                      backgroundColor: Colors.white,
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

  void _addPlayerCreatedEvent() {
    if (_createPlayerFormKey.currentState.validate()) {
      widget.gameBloc.add(
        PlayerCreatedEvent(
          playerName: playerName,
          points: points,
          bonusPoints: bonusPoints,
        ),
      );

      Navigator.of(context).pop();
    }
  }
}
