import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../core/error/failure.dart';
import '../../../core/extensions/functional.dart';
import '../../../core/util/input_converter.dart';
import '../../../domain/entities/game.dart';
import '../../../domain/repositories/game_repository.dart';
import '../../../domain/usecases/create_player.dart';
import '../game/game_bloc.dart';

part 'add_player_event.dart';
part 'add_player_state.dart';

class AddPlayerBloc extends Bloc<AddPlayerEvent, AddPlayerState> {
  final CreatePlayer createPlayer;
  final InputConverter inputConverter;
  final GameBloc gameBloc;
  final GameRepository gameRepository;

  StreamSubscription gameBlocSubscription;

  AddPlayerBloc({
    @required this.createPlayer,
    @required this.inputConverter,
    @required this.gameBloc,
    @required this.gameRepository,
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
    if (event is PlayerCreated) {
      final playerName = event.playerName;

      final pointsEitherResult =
          inputConverter.stringToUnsignedInteger(event.points).unwrapResult();

      final bonusPointsEitherResult = inputConverter
          .stringToUnsignedInteger(event.bonusPoints)
          .unwrapResult();

      yield* _validateEitherResults(
        pointsEitherResult,
        bonusPointsEitherResult,
      );

      final gameEither = await gameRepository.getGame();
      final gameRepoResult = gameEither.unwrapResult();

      if (gameRepoResult is Failure)
        yield AddPlayerErrorState(errorMessage: gameRepoResult.message);
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
          yield AddPlayerErrorState(errorMessage: createPlayerResult.message);
        else if (createPlayerResult is Game) {
          gameBloc.add(GameUpdatedEvent(newGame: createPlayerResult));
          yield AddPlayerCreationFinishedState(game: createPlayerResult);
        }
      }
    } else if (event is InitiatePlayerCreationEvent) {
      yield AddPlayerCreationStartedState();
    } else if (event is AddPlayerGameNotCreatedEvent) {
      yield AddPlayerGameNotCreatedState();
    } else if (event is AddPlayerGameCreatedEvent) {
      yield AddPlayerGameCreatedState(game: event.game);
    }
  }

  Stream<AddPlayerState> _validateEitherResults(
      pointsEitherResult, bonusPointsEitherResult) async* {
    if (pointsEitherResult is Failure) {
      yield AddPlayerErrorState(errorMessage: pointsEitherResult.message);
    }

    if (bonusPointsEitherResult is Failure) {
      yield AddPlayerErrorState(errorMessage: pointsEitherResult.errorMessage);
    }
  }

  @override
  Future<void> close() {
    gameBlocSubscription.cancel();
    return super.close();
  }
}
