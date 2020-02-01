import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../core/error/failure.dart';
import '../../../core/util/input_converter.dart';
import '../../../domain/entities/player.dart';
import '../../../domain/usecases/create_player.dart';

part 'add_player_event.dart';
part 'add_player_state.dart';

class AddPlayerBloc extends Bloc<AddPlayerEvent, AddPlayerState> {
  final CreatePlayer createPlayer;
  final InputConverter inputConverter;

  AddPlayerBloc({
    this.createPlayer,
    this.inputConverter,
  });

  @override
  AddPlayerState get initialState => InitialState();

  @override
  Stream<AddPlayerState> mapEventToState(
    AddPlayerEvent event,
  ) async* {
    if (event is CreatePlayerEvent) {
      final pointsEither = inputConverter.stringToUnsignedInteger(event.points);

      final bonusPointsEither =
          inputConverter.stringToUnsignedInteger(event.bonusPoints);

      final playerName = event.playerName;

      //TODO Actually handle errors when creating the object in local / remote storage,
      //TODO for now just run the validation
      if (pointsEither.isLeft() ||
          bonusPointsEither.isLeft() ||
          playerName.isEmpty) {
        yield ErrorState();
      }

      final useCaseEither = await createPlayer(
        Params(
            playerName: playerName,
            points: pointsEither.getOrElse(() => 0),
            bonusPoints: bonusPointsEither.getOrElse(() => 0)),
      );

      yield* _mapEitherErrorOrAddPlayerCreationFinished(useCaseEither);
    } else if (event is InitiatePlayerCreationEvent) {
      yield PlayerCreationStartedState();
    }
  }
}

Stream<AddPlayerState> _mapEitherErrorOrAddPlayerCreationFinished(
    Either<Failure, Player> useCaseEither) async* {
  yield useCaseEither.fold(
    (failure) => ErrorState(),
    (player) => CreationFinishedState(player: player),
  );
}
