part of 'game_bloc.dart';

abstract class GameEvent extends Equatable {
  const GameEvent();

  @override
  List<Object> get props => [];
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

class PlayerCreationStartedEvent extends GameEvent {}

class PlayerCreatedEvent extends GameEvent {
  final String playerName;
  final String points;
  final String bonusPoints;

  PlayerCreatedEvent({
    @required this.playerName,
    @required this.points,
    @required this.bonusPoints,
  });

  @override
  List<Object> get props => [playerName, points, bonusPoints];
}
