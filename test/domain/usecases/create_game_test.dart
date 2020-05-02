import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:game_counter/domain/entities/game.dart';
import 'package:game_counter/domain/repositories/game_repository.dart';
import 'package:game_counter/domain/usecases/create_game.dart';
import 'package:mockito/mockito.dart';

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
      final validGameName = 'validGameName';
      final validPointsToWin = 0;
      final validNumberOfPlayers = 4;

      final testGame = Game(
        name: validGameName,
        numberOfPlayers: validNumberOfPlayers,
        pointsToWin: validPointsToWin,
        players: [],
      );

      test(
        'should return a valid game instance with valid parametars',
        () async {
          when(mockGameRepository.getGame())
              .thenAnswer((_) async => Right(testGame));

          final actualResult = await createGame(
            CreateGameParams(
              gameTitle: validGameName,
              numberOfPlayers: validNumberOfPlayers,
              winningPoints: validPointsToWin,
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
