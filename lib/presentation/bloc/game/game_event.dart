part of 'game_bloc.dart';

abstract class GameEvent extends Equatable {
  const GameEvent();
}

class CreateGameEvent extends GameEvent {
  final String gameTitle;
  final String numberOfPlayers;
  final String pointsToWin;

  CreateGameEvent({
    @required this.gameTitle,
    @required this.numberOfPlayers,
    @required this.pointsToWin,
  });

  @override
  List<Object> get props => [gameTitle, numberOfPlayers, pointsToWin];
}

class AddPlayerGameEvent extends GameEvent {
  final Game currentGame;

  final Player newPlayer;

  AddPlayerGameEvent({
    @required this.currentGame,
    @required this.newPlayer,
  });

  @override
  List<Object> get props => [currentGame, newPlayer];
}
