import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:game_counter/domain/entities/player.dart';
import 'package:meta/meta.dart';

import '../../../../core/constants/budget_constants.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/extensions/extensions.dart';
import '../../../../domain/entities/game.dart';
import '../../../../domain/repositories/game_repository.dart';
import '../../../../domain/usecases/reset_player.dart';
import '../../../../domain/usecases/update_game.dart';
import '../../core/game_bloc.dart';

part 'player_detail_bloc.freezed.dart';
part 'player_detail_event.dart';
part 'player_detail_state.dart';

class PlayerDetailBloc extends Bloc<PlayerDetailEvent, PlayerDetailState> {
  final GameRepository gameRepository;
  final GameBloc gameBloc;
  final UpdateGame updateGame;
  final ResetPlayer resetPlayer;

  PlayerDetailBloc({
    @required this.gameRepository,
    @required this.gameBloc,
    @required this.updateGame,
    @required this.resetPlayer,
  });

  @override
  PlayerDetailState get initialState => PlayerDetailState.initialState();

  @override
  Stream<PlayerDetailState> mapEventToState(
    PlayerDetailEvent event,
  ) async* {
    yield* event.map(
      saveClicked: (params) => _handleOnSaveClickedEvent(
          params.newMainPoints, params.newBonusPoints, params.currentPlayer),
      resetClicked: (params) =>
          _handlePlayerResetClickedEvent(params.currentPlayer),
    );
  }

  Stream<PlayerDetailState> _handleOnSaveClickedEvent(
    int newMainPoints,
    int newBonusPoints,
    Player currentPlayer,
  ) async* {
    final gameEither = await gameRepository.getGame();
    final gameRepoResult = gameEither.unwrapResult();

    if (gameRepoResult is Failure)
      yield PlayerDetailState.errorState(errorMessage: gameRepoResult.message);
    else if (gameRepoResult is Game) {
      final updateGameEither = await updateGame(
        UpdateGameParams(
          currentGame: gameRepoResult,
          currentPlayer: currentPlayer,
          newPoints: newMainPoints,
          newBonusPoints: newBonusPoints,
        ),
      );

      final updateGameResult = updateGameEither.unwrapResult();

      if (updateGameResult is Failure) {
        yield PlayerDetailState.errorState(errorMessage: UPDATE_GAME_ERROR);
      } else if (updateGameResult is Game) {
        final updatedPlayer = updateGameResult.players.firstWhere(
            (updatedPlayer) => updatedPlayer.name == currentPlayer.name);
        yield PlayerDetailState.updatedState(player: updatedPlayer);

        gameBloc.add(GameEvent.gameUpdated(newGame: updateGameResult));
      }
    }
  }

  Stream<PlayerDetailState> _handlePlayerResetClickedEvent(
      Player playerToReset) async* {
    final gameEither = await gameRepository.getGame();
    final gameRepoResult = gameEither.unwrapResult();

    if (gameRepoResult is Failure)
      yield PlayerDetailState.errorState(errorMessage: gameRepoResult.message);
    else if (gameRepoResult is Game) {
      final resetPlayerEither = await resetPlayer(
        ResetPlayerParams(
          currentGame: gameRepoResult,
          currentPlayer: playerToReset,
        ),
      );

      final resetPlayerResult = resetPlayerEither.unwrapResult();
      if (resetPlayerResult is Failure) {
        yield PlayerDetailState.errorState(errorMessage: UPDATE_GAME_ERROR);
      } else if (resetPlayerResult is Game) {
        final updatedPlayer = resetPlayerResult.players.firstWhere(
            (updatedPlayer) => updatedPlayer.name == playerToReset.name);
        yield PlayerDetailState.updatedState(player: updatedPlayer);

        gameBloc.add(GameEvent.gameUpdated(newGame: resetPlayerResult));
      }
    }
  }
}
