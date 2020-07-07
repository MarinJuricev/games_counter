import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';

import '../../../core/constants/budget_constants.dart';
import '../../../core/error/failure.dart';
import '../../../core/extensions/extensions.dart';
import '../../../core/util/input_converter.dart';
import '../../../domain/entities/game.dart';
import '../../../domain/entities/player.dart';
import '../../../domain/usecases/create_game.dart';
import '../../../domain/usecases/create_player.dart';
import '../../../domain/usecases/delete_player.dart';
import '../../../domain/usecases/end_game_sooner.dart';
import '../../../domain/usecases/save_game_into_history.dart';

part 'game_bloc.freezed.dart';
part 'game_event.dart';
part 'game_state.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  final CreateGame createGame;
  final DeletePlayer deletePlayer;
  final EndGameSooner endGameSooner;
  final CreatePlayer createPlayer;
  final InputConverter inputConverter;
  final SaveGameIntoHistory saveGameIntoHistory;

  GameBloc({
    @required this.createGame,
    @required this.createPlayer,
    @required this.deletePlayer,
    @required this.endGameSooner,
    @required this.inputConverter,
    @required this.saveGameIntoHistory,
  }): super(GameState.initialState());

  @override
  Stream<GameState> mapEventToState(
    GameEvent event,
  ) async* {
    yield* event.map(
      gameCreated: (params) => _handleGameCreatedEvent(
          params.numberOfPlayers, params.pointsToWin, params.gameTitle),
      gameUpdated: (params) => _handleGameUpdatedEvent(params.newGame),
      playerCreationStarted: (params) => _handlePlayerCreationStartedEvent(
          params.playername, params.points, params.bonusPoints),
      resetGame: (_) => _handleResetGameEvent(),
      deletePlayer: (params) => _handleDeletePlayerEvent(params.playerToDelete),
      endGameSooner: (params) => _handleEndGameSoonerEvent(params.currentGame),
      playerCreated: (params) => _handlePlayerCreatedEvent(
          params.playerName, params.points, params.bonusPoints),
    );
  }

  Stream<GameState> _handleGameCreatedEvent(
      String numberOfPlayers, String pointsToWin, String gameTitle) async* {
    final numberResult =
        inputConverter.stringToUnsignedInteger(numberOfPlayers).unwrapResult();

    final pointsResult =
        inputConverter.stringToUnsignedInteger(pointsToWin).unwrapResult();

    if (numberResult is Failure ||
        pointsResult is Failure ||
        gameTitle.isEmpty) {
      yield GameState.errorState(errorMessage: VALIDATION_ERROR);
    }

    if (numberResult is int && pointsResult is int) {
      final useCaseEither = await createGame(
        CreateGameParams(
            gameTitle: gameTitle,
            numberOfPlayers: numberResult,
            winningPoints: pointsResult),
      );

      yield* _mapEitherErrorOrGameCreated(useCaseEither);
    }
  }

  Stream<GameState> _handleGameUpdatedEvent(Game newGame) async* {
    final updatedGame = newGame;

    if (updatedGame.winner == null || updatedGame.winner.isEmpty) {
      yield GameState.updatedState(game: newGame);
    } else {
      Player winner = updatedGame.players
          .firstWhere((itemToCheck) => itemToCheck.name == updatedGame.winner);

      await saveGameIntoHistory(
          SaveGameIntoHistoryParams(gameToSave: updatedGame));

      yield GameState.overState(player: winner);
    }
  }

  Stream<GameState> _handlePlayerCreationStartedEvent(
      String playerName, String points, String bonusPoints) async* {
    final pointsEitherResult =
        inputConverter.stringToUnsignedInteger(points).unwrapResult();

    final bonusPointsEitherResult =
        inputConverter.stringToUnsignedInteger(bonusPoints).unwrapResult();

    yield* _validatePointsEitherResults(
      pointsEitherResult,
      bonusPointsEitherResult,
    );

    final createPlayerUseCase = await createPlayer(
      CreatePlayerParams(
          playerName: playerName,
          points: pointsEitherResult,
          bonusPoints: bonusPointsEitherResult),
    );
    final createPlayerResult = createPlayerUseCase.unwrapResult();

    if (createPlayerResult is Failure)
      yield GameState.errorState(errorMessage: createPlayerResult.message);
    else if (createPlayerResult is Game) {
      yield GameState.updatedState(game: createPlayerResult);
    }
  }

  Stream<GameState> _handleResetGameEvent() async* {
    yield GameState.initialState();
  }

  Stream<GameState> _handleDeletePlayerEvent(Player playerToDelete) async* {
    final useCaseResult =
        await deletePlayer(DeletePlayerParams(playerToDelete: playerToDelete));
    final deletePlayerResult = useCaseResult.unwrapResult();

    if (deletePlayerResult is Failure)
      yield GameState.errorState(errorMessage: deletePlayerResult.message);
    else if (deletePlayerResult is Game) {
      yield GameState.updatedState(game: deletePlayerResult);
    }
  }

  Stream<GameState> _handleEndGameSoonerEvent(Game currentGame) async* {
    final useCaseResult = await endGameSooner(EndGameSoonerParams());

    final endGameSoonerResult = useCaseResult.unwrapResult();
    if (endGameSoonerResult is Failure)
      yield GameState.errorState(errorMessage: endGameSoonerResult.message);
    else if (endGameSoonerResult is Player) {
      await saveGameIntoHistory(
          SaveGameIntoHistoryParams(gameToSave: currentGame));

      yield GameState.overState(player: endGameSoonerResult);
    }
  }

  Stream<GameState> _handlePlayerCreatedEvent(
      String playerName, String points, String bonusPoints) async* {
    final pointsEitherResult =
        inputConverter.stringToUnsignedInteger(points).unwrapResult();

    final bonusPointsEitherResult =
        inputConverter.stringToUnsignedInteger(bonusPoints).unwrapResult();

    yield* _validatePointsEitherResults(
      pointsEitherResult,
      bonusPointsEitherResult,
    );

    final createPlayerUseCase = await createPlayer(
      CreatePlayerParams(
        playerName: playerName,
        points: pointsEitherResult,
        bonusPoints: bonusPointsEitherResult,
      ),
    );
    final createPlayerResult = createPlayerUseCase.unwrapResult();

    if (createPlayerResult is Failure)
      yield GameState.errorState(errorMessage: createPlayerResult.message);
    else if (createPlayerResult is Game) {
      yield GameState.updatedState(game: createPlayerResult);
    }
  }

  Stream<GameState> _validatePointsEitherResults(
      pointsEitherResult, bonusPointsEitherResult) async* {
    if (pointsEitherResult is Failure) {
      yield GameState.errorState(errorMessage: pointsEitherResult.message);
    }

    if (bonusPointsEitherResult is Failure) {
      yield GameState.errorState(errorMessage: pointsEitherResult.errorMessage);
    }
  }

  Stream<GameState> _mapEitherErrorOrGameCreated(
      Either<Failure, Game> useCaseEither) async* {
    yield useCaseEither.fold(
      (failure) => GameState.errorState(errorMessage: VALIDATION_ERROR),
      (game) => GameState.updatedState(game: game),
    );
  }
}
