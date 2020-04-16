part of 'game_bloc.dart';

abstract class GameEvent with _$GameEvent {
  factory GameEvent.gameCreated(
          String gameTitle, String numberOfPlayers, String pointsToWin) =
      _OnGameCreated;

  const GameEvent();

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

class ResetGameEvent extends GameEvent {}

class DeletePlayerGameEvent extends GameEvent {
  final Player playerToDelete;

  DeletePlayerGameEvent({@required this.playerToDelete});

  @override
  List<Object> get props => [playerToDelete];
}

class EndGameSoonerEvent extends GameEvent {
  final Game currentGame;

  EndGameSoonerEvent({@required this.currentGame});

  @override
  List<Object> get props => [currentGame];
}
