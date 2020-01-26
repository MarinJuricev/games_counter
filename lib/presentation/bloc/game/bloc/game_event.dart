part of 'game_bloc.dart';

abstract class GameEvent extends Equatable {
  const GameEvent();
}

class CreateGameEvent extends GameEvent {
  final String gameTitle;
  final int numberOfPlayers;
  final int pointsToWin;

  CreateGameEvent({
    @required this.gameTitle,
    @required this.numberOfPlayers,
    @required this.pointsToWin,
  });

  @override
  List<Object> get props => [gameTitle, numberOfPlayers, pointsToWin];
}
