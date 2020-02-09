part of 'game_bloc.dart';

abstract class GameEvent extends Equatable {
  const GameEvent();
}

class CreatedGameEvent extends GameEvent {
  final String gameTitle;
  final String numberOfPlayers;
  final String pointsToWin;

  CreatedGameEvent({
    @required this.gameTitle,
    @required this.numberOfPlayers,
    @required this.pointsToWin,
  });

  @override
  List<Object> get props => [gameTitle, numberOfPlayers, pointsToWin];
}

class GameUpdatedEvent extends GameEvent {
  final Game newGame;

  GameUpdatedEvent({
    @required this.newGame,
  });

  @override
  List<Object> get props => [newGame];
}
