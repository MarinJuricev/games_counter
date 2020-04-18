part of 'game_bloc.dart';
// part 'game_event.freezed.dart';

@freezed
abstract class GameEvent with _$GameEvent {
  factory GameEvent.gameCreated({
    String gameTitle,
    String numberOfPlayers,
    String pointsToWin,
  }) = _OnGameCreated;
  factory GameEvent.gameUpdated({Game newGame}) = _OnGameUpdated;
  factory GameEvent.playerCreationStarted({
    String playername,
    String points,
    String bonusPoints,
  }) = _OnPlayerCreationStarted;
  factory GameEvent.playerCreated({
    String playerName,
    String points,
    String bonusPoints,
  }) = _OnPlayerCreatedEvent;
  factory GameEvent.resetGame() = _OnGameReset;
  factory GameEvent.deletePlayer({Player playerToDelete}) = _OnDeletePlayer;
  factory GameEvent.endGameSooner({Game currentGame}) = _OnEndGameSooner;
}
