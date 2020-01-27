import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:game_counter/core/util/input_converter.dart';
import '../../../../core/error/failure.dart';
import '../../../../domain/usecases/create_game.dart';
import 'package:meta/meta.dart';

import '../../../../domain/entities/game.dart';

part 'game_event.dart';
part 'game_state.dart';

//TODO Actually implement empty name, non zero and negative players and points logic !
const String VALIDATION_ERROR = 'Validation Error';

class GameBloc extends Bloc<GameEvent, GameState> {
  final CreateGame createGame;
  final InputConverter inputConverter;

  GameBloc({@required this.createGame, @required this.inputConverter});

  @override
  GameState get initialState => GameInitialState();

  @override
  Stream<GameState> mapEventToState(
    GameEvent event,
  ) async* {
    if (event is CreateGameEvent) {
      final numberEither =
          inputConverter.stringToUnsignedInteger(event.numberOfPlayers);

      final pointsEither =
          inputConverter.stringToUnsignedInteger(event.pointsToWin);

      yield* _mapValidationErrorStates(
          numberEither, pointsEither, event.gameTitle);

      final useCaseEither = await createGame(
        Params(
            gameTitle: event.gameTitle,
            numberOfPlayers: numberEither.getOrElse(null),
            winningPoints: pointsEither.getOrElse(null)),
      );

      yield* _mapEitherErrorOrGameCreated(useCaseEither);
    }
  }
}

Stream<GameState> _mapEitherErrorOrGameCreated(
    Either<Failure, Game> useCaseEither) async* {
  yield useCaseEither.fold((failure) => ErrorState(message: VALIDATION_ERROR),
      (game) => GameCreatedState(game: game));
}

Stream<GameState> _mapValidationErrorStates(
  Either<Failure, int> numberEither,
  Either<Failure, int> pointsEither,
  String gameTitle,
) async* {
  // if (numberEither.isLeft()) {
  //     yield numberEither.leftMap<Failure>((failure) => ErrorState(message: failure.errorMessage));
  //   }
  // yield useCaseEither.fold(
  //     (failure) => ErrorState(message: failure.errorMessage),
  //     (game) => GameCreatedState(game: game));
  // }
}
