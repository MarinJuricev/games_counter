import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../core/error/failure.dart';
import '../../../core/util/input_converter.dart';
import '../../../domain/entities/game.dart';
import '../../../domain/entities/player.dart';
import '../../../domain/usecases/create_game.dart';

part 'game_event.dart';
part 'game_state.dart';

const String VALIDATION_ERROR = 'Validation Error';

class GameBloc extends Bloc<GameEvent, GameState> {
  final CreateGame createGame;
  final InputConverter inputConverter;

  GameBloc(
      {@required this.createGame,
      @required this.inputConverter,
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
        yield GameErrorState(message: VALIDATION_ERROR);
      }

      final useCaseEither = await createGame(
        Params(
            gameTitle: event.gameTitle,
            numberOfPlayers: numberEither.getOrElse(() => 0),
            winningPoints: pointsEither.getOrElse(() => 0)),
      );

      yield* _mapEitherErrorOrGameCreated(useCaseEither);
    } else if (event is GameUpdatedEvent) {
      // final newPlayer = event.newPlayer;
      // final currentGame = event.currentGame;

      // final useCaseEither = await addPlayer(
      //   add.Params(currentGame: currentGame, newPlayer: newPlayer),
      // );

      
    }
  }
}

Stream<GameState> _mapEitherErrorOrGameCreated(
    Either<Failure, Game> useCaseEither) async* {
  yield useCaseEither.fold(
    (failure) => GameErrorState(message: VALIDATION_ERROR),
    (game) => GameCreatedState(game: game),
  );
}
