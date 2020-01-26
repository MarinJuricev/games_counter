import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_counter/presentation/bloc/game/bloc/game_bloc.dart';

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

class CreateGame extends StatefulWidget {
  const CreateGame({
    Key key,
  }) : super(key: key);

  @override
  _CreateGameState createState() => _CreateGameState();
}

class _CreateGameState extends State<CreateGame> {
  void addCreateGameEvent() {
    BlocProvider.of<GameBloc>(context).add(CreateGameEvent(
        gameTitle: 'Treseta', numberOfPlayers: 4, pointsToWin: 41));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
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
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 32),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Game Title',
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
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 32),
              child: TextFormField(
                decoration: InputDecoration(
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
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 32),
              child: TextFormField(
                decoration: InputDecoration(
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 32.0, vertical: 8.0),
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
    );
  }
}
