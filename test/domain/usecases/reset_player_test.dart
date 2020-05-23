import 'package:flutter_test/flutter_test.dart';
import 'package:game_counter/domain/usecases/reset_player.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';
import 'package:game_counter/domain/repositories/game_repository.dart';
import 'package:game_counter/domain/entities/game.dart';
import 'package:game_counter/domain/entities/player.dart';

import '../../test_data/test_data.dart';

class MockGameRepository extends Mock implements GameRepository {}

void main() {
  MockGameRepository mockGameRepository;
  ResetPlayer resetPlayer;

  setUp(
    () {
      mockGameRepository = MockGameRepository();
      resetPlayer = ResetPlayer(repository: mockGameRepository);
    },
  );

  test(
    'should update mainPoints and bonusPoints with 0',
    () async {
      final expectedPlayer = Player(
        name: TEST_PLAYER_1_NAME,
        points: 0,
        bonusPoints: 0,
      );

      final expectedGame = Game(
        name: TEST_GAME_NAME_1,
        createdAt: TEST_CREATED_AT_1,
        numberOfPlayers: TEST_NUMBER_OF_PLAYERS_PARSED_1,
        pointsToWin: TEST_POINTS_TO_WIN_PARSED_1,
        winner: TEST_PLAYER_1_NAME,
        players: [expectedPlayer, testPlayer2],
      );

      when(mockGameRepository.saveGame(expectedGame))
          .thenAnswer((_) async => Future.value());

      final actualResult = await resetPlayer(
        ResetPlayerParams(
          currentGame: testGame,
          currentPlayer: testPlayer1,
        ),
      );

      final expectedResult = Right(expectedGame);

      verify(mockGameRepository.saveGame(expectedGame)).called(1);
      expect(actualResult, expectedResult);
    },
  );
}
