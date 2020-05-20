import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:game_counter/core/constants/budget_constants.dart';
import 'package:game_counter/domain/entities/game.dart';
import 'package:game_counter/domain/repositories/game_repository.dart';
import 'package:game_counter/domain/service/time_provider.dart';
import 'package:game_counter/domain/usecases/create_game.dart';
import 'package:mockito/mockito.dart';

import '../../test_data/test_data.dart';

class MockGameRepository extends Mock implements GameRepository {}

class MockTimeProvider extends Mock implements TimeProvider {}

void main() {
  CreateGame createGame;
  MockGameRepository mockGameRepository;
  MockTimeProvider mockTimeProvider;
  Game gameWithoutAWinner = testGame.copyWith(winner: '', players: []);

  setUp(
    () {
      mockGameRepository = MockGameRepository();
      mockTimeProvider = MockTimeProvider();
      createGame = CreateGame(
        repository: mockGameRepository,
        timeProvider: mockTimeProvider,
      );
    },
  );

  test(
    'should return a valid game instance with valid parametars',
    () async {
      when(mockGameRepository.getGame())
          .thenAnswer((_) async => Right(gameWithoutAWinner));

      when(mockTimeProvider.provideCurrentTime(GAME_TIME_FORMAT))
          .thenReturn(TEST_CREATED_AT_1);

      final actualResult = await createGame(
        CreateGameParams(
          gameTitle: TEST_GAME_NAME_1,
          numberOfPlayers: TEST_NUMBER_OF_PLAYERS_PARSED_1,
          winningPoints: TEST_POINTS_TO_WIN_PARSED_1,
        ),
      );

      verify(mockGameRepository.saveGame(gameWithoutAWinner));

      final expectedResult = Right(gameWithoutAWinner);

      expect(actualResult, expectedResult);
    },
  );
}
