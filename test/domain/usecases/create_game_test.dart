import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:game_counter/domain/repositories/game_repository.dart';
import 'package:game_counter/domain/usecases/create_game.dart';
import 'package:mockito/mockito.dart';

import '../../test_data/test_data.dart';

class MockGameRepository extends Mock implements GameRepository {}

void main() {
  CreateGame createGame;
  MockGameRepository mockGameRepository;

  setUp(
    () {
      mockGameRepository = MockGameRepository();
      createGame = CreateGame(repository: mockGameRepository);
    },
  );

  group(
    'createGame',
    () {

      test(
        'should return a valid game instance with valid parametars',
        () async {
          when(mockGameRepository.getGame())
              .thenAnswer((_) async => Right(testGame));

          final actualResult = await createGame(
            CreateGameParams(
              gameTitle: TEST_GAME_NAME_1,
              numberOfPlayers: TEST_NUMBER_OF_PLAYERS_PARSED_1,
              winningPoints: TEST_POINTS_TO_WIN_PARSED_1,
            ),
          );

          verify(mockGameRepository.saveGame(testGame));

          final expectedResult = Right(testGame);

          expect(actualResult, expectedResult);
        },
      );
    },
  );
}
