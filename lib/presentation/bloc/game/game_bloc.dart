import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../core/error/failure.dart';
import '../../../core/extensions/functional.dart';
import '../../../core/util/input_converter.dart';
import '../../../domain/entities/game.dart';
import '../../../domain/entities/player.dart';
import '../../../domain/repositories/game_repository.dart';
import '../../../domain/usecases/create_game.dart' as createGameUseCase;
import '../../../domain/usecases/create_player.dart';
import '../../../domain/usecases/delete_player.dart' as deletePlayerUseCase;
import '../../../domain/usecases/end_game_sooner.dart' as endGameSoonerUseCase;

part 'game_event.dart';
part 'game_state.dart';

const String VALIDATION_ERROR = 'Validation Error';

class GameBloc extends Bloc<GameEvent, GameState> {
  final createGameUseCase.CreateGame createGame;
  final deletePlayerUseCase.DeletePlayer deletePlayer;
  final endGameSoonerUseCase.EndGameSooner endGameSooner;
  final CreatePlayer createPlayer;
  final InputConverter inputConverter;
  final GameRepository gameRepository;

  GameBloc({
    @required this.createGame,
    @required this.createPlayer,
    @required this.deletePlayer,
    @required this.endGameSooner,
    @required this.inputConverter,
    @required this.gameRepository,
  });

  @override
  GameState get initialState => GameInitialState();

  @override
  Stream<GameState> mapEventToState(
    GameEvent event,
  ) async* {
    if (event is CreatedGameEvent) {
      final numberResult = inputConverter
          .stringToUnsignedInteger(event.numberOfPlayers)
          .unwrapResult();

      final pointsResult = inputConverter
          .stringToUnsignedInteger(event.pointsToWin)
          .unwrapResult();

      if (numberResult is Failure ||
          pointsResult is Failure ||
          event.gameTitle.isEmpty) {
        yield GameErrorState(errorMessage: VALIDATION_ERROR);
      }

      if (numberResult is int && pointsResult is int) {
        final useCaseEither = await createGame(
          createGameUseCase.Params(
              gameTitle: event.gameTitle,
              numberOfPlayers: numberResult,
              winningPoints: pointsResult),
        );

        yield* _mapEitherErrorOrGameCreated(useCaseEither);
      }
    } else if (event is GameUpdatedEvent) {
      final updatedGame = event.newGame;

      if (updatedGame.winner == null) {
        yield GameUpdatedState(game: event.newGame);
      } else {
        Player winner = updatedGame.players.firstWhere(
            (itemToCheck) => itemToCheck.name == updatedGame.winner);

        //TODO add a usecase for this.. it'll need to store this game and the winner into local persistence
        yield GameOverState(player: winner);
      }
    } else if (event is PlayerCreatedEvent) {
      final playerName = event.playerName;

      final pointsEitherResult =
          inputConverter.stringToUnsignedInteger(event.points).unwrapResult();

      final bonusPointsEitherResult = inputConverter
          .stringToUnsignedInteger(event.bonusPoints)
          .unwrapResult();

      yield* _validatePointsEitherResults(
        pointsEitherResult,
        bonusPointsEitherResult,
      );

      final gameEither = await gameRepository.getGame();
      final gameRepoResult = gameEither.unwrapResult();

      if (gameRepoResult is Failure)
        yield GameErrorState(errorMessage: gameRepoResult.message);
      else if (gameRepoResult is Game) {
        final createPlayerUseCase = await createPlayer(
          Params(
              playerName: playerName,
              points: pointsEitherResult,
              bonusPoints: bonusPointsEitherResult,
              currentGame: gameRepoResult),
        );
        final createPlayerResult = createPlayerUseCase.unwrapResult();

        if (createPlayerResult is Failure)
          yield GameErrorState(errorMessage: createPlayerResult.message);
        else if (createPlayerResult is Game) {
          yield GameUpdatedState(game: createPlayerResult);
        }
      }
    } else if (event is ResetGameEvent) {
      yield GameInitialState();
    } else if (event is DeletePlayerGameEvent) {
      final playerToDelete = event.playerToDelete;

      final gameEither = await gameRepository.getGame();
      final gameRepoResult = gameEither.unwrapResult();

      if (gameRepoResult is Failure)
        yield GameErrorState(errorMessage: gameRepoResult.message);
      else if (gameRepoResult is Game) {
        final useCaseResult = await deletePlayer(
          deletePlayerUseCase.Params(
              currentGame: gameRepoResult, playerToDelete: playerToDelete),
        );
        final deletePlayerResult = useCaseResult.unwrapResult();

        if (deletePlayerResult is Failure)
          yield GameErrorState(errorMessage: deletePlayerResult.message);
        else if (deletePlayerResult is Game) {
          yield GameUpdatedState(game: deletePlayerResult);
        }
      }
    } else if (event is EndGameSoonerEvent) {
      final currentGame = event.currentGame;
      final useCaseResult = await endGameSooner(
        endGameSoonerUseCase.Params(currentGame: currentGame),
      );

      final endGameSoonerResult = useCaseResult.unwrapResult();
      if (endGameSoonerResult is Failure)
          yield GameErrorState(errorMessage: endGameSoonerResult.message);
        else if (endGameSoonerResult is Player) {
          yield GameOverState(player: endGameSoonerResult);
        }
    }
  }
}

Stream<GameState> _validatePointsEitherResults(
    pointsEitherResult, bonusPointsEitherResult) async* {
  if (pointsEitherResult is Failure) {
    yield GameErrorState(errorMessage: pointsEitherResult.message);
  }

  if (bonusPointsEitherResult is Failure) {
    yield GameErrorState(errorMessage: pointsEitherResult.errorMessage);
  }
}

Stream<GameState> _mapEitherErrorOrGameCreated(
    Either<Failure, Game> useCaseEither) async* {
  yield useCaseEither.fold(
    (failure) => GameErrorState(errorMessage: VALIDATION_ERROR),
    (game) => GameCreatedState(game: game),
  );
}
