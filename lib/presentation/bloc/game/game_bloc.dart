import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:game_counter/domain/entities/player.dart';
import 'package:meta/meta.dart';

import '../../../core/error/failure.dart';
import '../../../core/extensions/functional.dart';
import '../../../core/util/input_converter.dart';
import '../../../domain/entities/game.dart';
import '../../../domain/repositories/game_repository.dart';
import '../../../domain/usecases/create_game.dart' as createGameUseCase;
import '../../../domain/usecases/create_player.dart';

part 'game_event.dart';
part 'game_state.dart';

const String VALIDATION_ERROR = 'Validation Error';

class GameBloc extends Bloc<GameEvent, GameState> {
  final createGameUseCase.CreateGame createGame;
  final CreatePlayer createPlayer;
  final InputConverter inputConverter;
  final GameRepository gameRepository;

  GameBloc({
    @required this.createGame,
    @required this.createPlayer,
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
      final numberEither =
          inputConverter.stringToUnsignedInteger(event.numberOfPlayers);

      final pointsEither =
          inputConverter.stringToUnsignedInteger(event.pointsToWin);

      //TODO Actually handle errors when creating the object in local / remote storage,
      //TODO for now just run the validation
      if (numberEither.isLeft() ||
          pointsEither.isLeft() ||
          event.gameTitle.isEmpty) {
        yield GameErrorState(errorMessage: VALIDATION_ERROR);
      }

      // TODO: use the unwrapEither extension
      final useCaseEither = await createGame(
        createGameUseCase.Params(
            gameTitle: event.gameTitle,
            numberOfPlayers: numberEither.getOrElse(() => 0),
            winningPoints: pointsEither.getOrElse(() => 0)),
      );

      yield* _mapEitherErrorOrGameCreated(useCaseEither);
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
    } else if (event is PlayerCreationStartedEvent) {
      yield GamePlayerCreationState();
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
