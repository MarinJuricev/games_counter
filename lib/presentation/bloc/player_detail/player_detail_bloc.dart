import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../core/constants/budget_constants.dart';
import '../../../core/error/failure.dart';
import '../../../core/extensions/functional.dart';
import '../../../domain/entities/game.dart';
import '../../../domain/entities/player.dart';
import '../../../domain/repositories/game_repository.dart';
import '../../../domain/usecases/reset_player.dart' as resetPlayerUseCase;
import '../../../domain/usecases/update_game.dart';
import '../game/game_bloc.dart';

part 'player_detail_event.dart';
part 'player_detail_state.dart';

class PlayerDetailBloc extends Bloc<PlayerDetailEvent, PlayerDetailState> {
  final GameRepository gameRepository;
  final GameBloc gameBloc;
  final UpdateGame updateGame;
  final resetPlayerUseCase.ResetPlayer resetPlayer;

  PlayerDetailBloc({
    @required this.gameRepository,
    @required this.gameBloc,
    @required this.updateGame,
    @required this.resetPlayer,
  });

  @override
  PlayerDetailState get initialState => PlayerDetailInitialState();

  @override
  Stream<PlayerDetailState> mapEventToState(
    PlayerDetailEvent event,
  ) async* {
    if (event is PlayerDetailSaveClickedEvent) {
      final newPoints = event.newMainPoints;
      final newBonusPoints = event.newBonusPoints;
      final currentPlayer = event.currentPlayer;

      final gameEither = await gameRepository.getGame();
      final gameRepoResult = gameEither.unwrapResult();

      if (gameRepoResult is Failure)
        yield PlayerDetailErrorState(errorMessage: gameRepoResult.message);
      else if (gameRepoResult is Game) {
        final updateGameEither = await updateGame(Params(
          currentGame: gameRepoResult,
          currentPlayer: currentPlayer,
          newPoints: newPoints,
          newBonusPoints: newBonusPoints,
        ));

        final updateGameResult = updateGameEither.unwrapResult();

        if (updateGameResult is Failure) {
          yield PlayerDetailErrorState(errorMessage: UPDATE_GAME_ERROR);
        } else if (updateGameResult is Game) {
          final updatedPlayer = updateGameResult.players.firstWhere(
              (updatedPlayer) => updatedPlayer.name == currentPlayer.name);
          yield PlayerDetailUpdatedState(player: updatedPlayer);

          gameBloc.add(GameEvent.gameUpdated(newGame: updateGameResult));
        }
      }
    } else if (event is PlayerDetailResetClickedEvent) {
      final playerToReset = event.currentPlayer;

      final gameEither = await gameRepository.getGame();
      final gameRepoResult = gameEither.unwrapResult();

      if (gameRepoResult is Failure)
        yield PlayerDetailErrorState(errorMessage: gameRepoResult.message);
      else if (gameRepoResult is Game) {
        final resetPlayerEither = await resetPlayer(resetPlayerUseCase.Params(
          currentGame: gameRepoResult,
          currentPlayer: playerToReset,
        ));

        final resetPlayerResult = resetPlayerEither.unwrapResult();
        if (resetPlayerResult is Failure) {
          yield PlayerDetailErrorState(errorMessage: UPDATE_GAME_ERROR);
        } else if (resetPlayerResult is Game) {
          final updatedPlayer = resetPlayerResult.players.firstWhere(
              (updatedPlayer) => updatedPlayer.name == playerToReset.name);
          yield PlayerDetailUpdatedState(player: updatedPlayer);

          gameBloc.add(GameEvent.gameUpdated(newGame: resetPlayerResult));
        }
      }
    }
  }
}
