import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:game_counter/core/constants/budget_constants.dart';
import 'package:game_counter/core/error/failure.dart';
import 'package:game_counter/domain/entities/game.dart';
import 'package:game_counter/domain/entities/player.dart';
import 'package:game_counter/domain/repositories/game_repository.dart';
import 'package:game_counter/domain/usecases/delete_player.dart';
import 'package:mockito/mockito.dart';

import '../../test_data/test_data.dart';

class MockGameRepository extends Mock implements GameRepository {}

void main() {
  MockGameRepository mockGameRepository;
  DeletePlayer deletePlayer;

  setUp(() {
    mockGameRepository = MockGameRepository();
    deletePlayer = DeletePlayer(repository: mockGameRepository);
  });

  group(
    'deletePlayer',
    () {
      test(
        'should return a updated game object that doesn\t contain the provided player object',
        () async {
          when(mockGameRepository.getGame())
              .thenAnswer((_) async => Right(testGame));

          final actualResult = await deletePlayer(
              DeletePlayerParams(playerToDelete: testPlayer1));

          final expectedGame = Game(
            name: TEST_GAME_NAME_1,
            bonusPoints: TEST_BONUS_POINTS_PARSED_1,
            createdAt: TEST_CREATED_AT_1,
            numberOfPlayers: TEST_NUMBER_OF_PLAYERS_PARSED_1,
            pointsToWin: TEST_POINTS_TO_WIN_PARSED_1,
            winner: TEST_PLAYER_1_NAME,
            players: [testPlayer2],
          );

          final expectedResult = Right(expectedGame);

          verify(mockGameRepository.saveGame(expectedGame)).called(1);
          expect(actualResult, expectedResult);
        },
      );

      test(
        'should return [NotImplementedFailure] when the playerToRemove isn\t present in the game object',
        () async {
          final nonExistentPlayer =
              Player(name: 'player123', points: 0, bonusPoints: 0);

          when(mockGameRepository.getGame())
              .thenAnswer((_) async => Right(testGame));

          final actualResult = await deletePlayer(
              DeletePlayerParams(playerToDelete: nonExistentPlayer));
          final expectedResult = Left(NotImplementedFailure());

          expect(actualResult, expectedResult);
        },
      );

      test(
        'should return [CacheFailure] when the repository doesnt return a game object',
        () async {
          when(mockGameRepository.getGame())
              .thenAnswer((_) async => Right(null));

          final actualResult = await deletePlayer(
              DeletePlayerParams(playerToDelete: testPlayer2));
          final expectedResult = Left(CacheFailure(ERROR_RETREVING_LOCAL_DATA));

          expect(actualResult, expectedResult);
        },
      );
    },
  );
}
