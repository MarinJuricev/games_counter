import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
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

  GameBloc({@required this.createGame});

  @override
  GameState get initialState => GameInitialState();

  @override
  Stream<GameState> mapEventToState(
    GameEvent event,
  ) async* {
    if (event is CreateGameEvent) {
      final useCaseEither = await createGame(
        Params(
          gameTitle: event.gameTitle,
          numberOfPlayers: event.numberOfPlayers,
          winningPoints: event.pointsToWin,
        ),
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
