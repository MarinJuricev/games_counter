import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:game_counter/core/constants/budget_constants.dart';
import 'package:game_counter/core/error/failure.dart';
import 'package:game_counter/domain/entities/player.dart';
import 'package:game_counter/domain/repositories/game_repository.dart';
import 'package:game_counter/domain/usecases/update_game.dart';
import 'package:game_counter/presentation/bloc/game/game_bloc.dart';
import 'package:game_counter/presentation/bloc/player_detail/player_detail_bloc.dart';
import 'package:mockito/mockito.dart';

class MockGameRepository extends Mock implements GameRepository {}

class MockGameBloc extends MockBloc<GameEvent, GameState> implements GameBloc {}

class MockUpdateGame extends Mock implements UpdateGame {}

void main() {
  MockGameRepository mockGameRepository;
  MockGameBloc mockGameBloc;
  MockUpdateGame mockUpdateGame;

  int newMainPoints = 15;
  int newBonusPoints = 10;
  Player currentPlayer = Player(name: 'Test', points: 0, bonusPoints: 0);

  setUp(
    () {
      mockGameRepository = MockGameRepository();
      mockGameBloc = MockGameBloc();
    },
  );

  void _setupRepositoryFailureCase() {
    when(mockGameRepository.getGame()).thenAnswer(
        (_) async => Left(CacheFailure(ERROR_RETREVING_LOCAL_DATA)));
  }

  blocTest(
    'initialState should be [PlayerDetailInitialState]',
    build: () => PlayerDetailBloc(
      gameRepository: mockGameRepository,
      gameBloc: mockGameBloc,
      updateGame: mockUpdateGame,
    ),
    expect: [PlayerDetailInitialState()],
  );

  blocTest(
    'should emit [PlayerDetailErrorState] when game repository returns a failure',
    build: () {
      _setupRepositoryFailureCase();

      return PlayerDetailBloc(
        gameRepository: mockGameRepository,
        gameBloc: mockGameBloc,
        updateGame: mockUpdateGame,
      );
    },
    act: (playerDetailBloc) =>
        playerDetailBloc.add(PlayerDetailSaveClickedEvent(
      currentPlayer: currentPlayer,
      newMainPoints: newMainPoints,
      newBonusPoints: newBonusPoints,
    )),
    expect: [
      PlayerDetailInitialState(),
      PlayerDetailErrorState(errorMessage: ERROR_RETREVING_LOCAL_DATA)
    ],
  );
}
