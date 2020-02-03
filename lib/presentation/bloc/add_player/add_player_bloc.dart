import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:game_counter/domain/entities/game.dart';
import 'package:meta/meta.dart';

import '../../../core/error/failure.dart';
import '../../../core/util/input_converter.dart';
import '../../../domain/entities/player.dart';
import '../../../domain/usecases/create_player.dart';
import '../game/game_bloc.dart';

part 'add_player_event.dart';
part 'add_player_state.dart';

class AddPlayerBloc extends Bloc<AddPlayerEvent, AddPlayerState> {
  final CreatePlayer createPlayer;
  final InputConverter inputConverter;
  final GameBloc gameBloc;

  StreamSubscription gameBlocSubscription;

  AddPlayerBloc({
    @required this.createPlayer,
    @required this.inputConverter,
    @required this.gameBloc,
  }) {
    gameBlocSubscription = gameBloc.listen((state) {
      if (state is GameInitialState) {
        add(AddPlayerGameNotCreatedEvent());
      } else if (state is GameCreatedState) {
        add(AddPlayerGameCreatedEvent(game: state.game));
      }
    });
  }

  @override
  AddPlayerState get initialState => AddPlayerInitialState();

  @override
  Stream<AddPlayerState> mapEventToState(
    AddPlayerEvent event,
  ) async* {
    if (event is PlayerCreatedEvent) {
      final pointsEither = inputConverter.stringToUnsignedInteger(event.points);

      final bonusPointsEither =
          inputConverter.stringToUnsignedInteger(event.bonusPoints);

      final playerName = event.playerName;

      //TODO Actually handle errors when creating the object in local / remote storage,
      //TODO for now just run the validation
      if (pointsEither.isLeft() ||
          bonusPointsEither.isLeft() ||
          playerName.isEmpty) {
        yield AddPlayerErrorState();
      }

      final useCaseEither = await createPlayer(
        Params(
            playerName: playerName,
            points: pointsEither.getOrElse(() => 0),
            bonusPoints: bonusPointsEither.getOrElse(() => 0)),
      );

      yield* _mapEitherErrorOrAddPlayerCreationFinished(useCaseEither);
    } else if (event is InitiatePlayerCreationEvent) {
      yield AddPlayerCreationStartedState();
    } else if (event is AddPlayerGameNotCreatedEvent) {
      yield AddPlayerGameNotCreatedState();
    } else if (event is AddPlayerGameCreatedEvent) {
      yield AddPlayerGameCreatedState(game: event.game);
    }
  }

  @override
  Future<void> close() {
    gameBlocSubscription.cancel();
    return super.close();
  }
}

Stream<AddPlayerState> _mapEitherErrorOrAddPlayerCreationFinished(
    Either<Failure, Player> useCaseEither) async* {
  yield useCaseEither.fold(
    (failure) => AddPlayerErrorState(),
    (player) => AddPlayerCreationFinishedState(player: player),
  );
}
