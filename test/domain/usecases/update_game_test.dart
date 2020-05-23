import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:game_counter/domain/entities/game.dart';
import 'package:game_counter/domain/entities/player.dart';
import 'package:game_counter/domain/repositories/game_repository.dart';
import 'package:game_counter/domain/usecases/update_game.dart';
import 'package:mockito/mockito.dart';

import '../../test_data/test_data.dart';

class MockGameRepository extends Mock implements GameRepository {}

void main() {
  MockGameRepository mockGameRepository;
  UpdateGame updateGame;

  final playerPoints = 0;
  final newPlayerBonusPointsThatExceed = 45;
  final newPlayerPoints = 14;
  final newPlayerPointsThatExceed = 45;
  final newPlayerBonusPoints = 3;

  Game gameToTest;

  setUp(
    () {
      mockGameRepository = MockGameRepository();
      updateGame = UpdateGame(repository: mockGameRepository);

      gameToTest = Game(
        name: TEST_GAME_NAME_1,
        createdAt: TEST_CREATED_AT_1,
        numberOfPlayers: TEST_NUMBER_OF_PLAYERS_PARSED_1,
        pointsToWin: TEST_POINTS_TO_WIN_PARSED_1,
        winner: TEST_PLAYER_1_NAME,
        players: [testPlayer1, testPlayer2],
      );
    },
  );

  test(
    'should update mainPoints and bonusPoints with the new values',
    () async {
      final actualResult = await updateGame(
        UpdateGameParams(
            currentGame: gameToTest,
            currentPlayer: testPlayer1,
            newPoints: newPlayerPoints,
            newBonusPoints: newPlayerBonusPoints),
      );

      final actualPlayer = Player(
        name: TEST_PLAYER_1_NAME,
        points: newPlayerPoints,
        bonusPoints: newPlayerBonusPoints,
      );

      final expectedGame = Game(
        name: TEST_GAME_NAME_1,
        createdAt: TEST_CREATED_AT_1,
        numberOfPlayers: TEST_NUMBER_OF_PLAYERS_PARSED_1,
        pointsToWin: TEST_POINTS_TO_WIN_PARSED_1,
        winner: TEST_PLAYER_1_NAME,
        players: [actualPlayer, testPlayer2],
      );
      final expectedResult = Right(expectedGame);

      verify(mockGameRepository.saveGame(expectedGame)).called(1);
      expect(actualResult, expectedResult);
    },
  );

  test(
    'should update mainPoints and bonus points and set the winner field if the sum exceed\'s games pointsToWin ( when mainPoints exceed )',
    () async {
      final actualResult = await updateGame(
        UpdateGameParams(
            currentGame: gameToTest,
            currentPlayer: testPlayer1,
            newPoints: newPlayerPointsThatExceed,
            newBonusPoints: newPlayerBonusPoints),
      );

      final actualPlayer = Player(
        name: TEST_PLAYER_1_NAME,
        points: newPlayerPointsThatExceed,
        bonusPoints: newPlayerBonusPoints,
      );

      final expectedGame = Game(
        name: TEST_GAME_NAME_1,
        createdAt: TEST_CREATED_AT_1,
        numberOfPlayers: TEST_NUMBER_OF_PLAYERS_PARSED_1,
        pointsToWin: TEST_POINTS_TO_WIN_PARSED_1,
        winner: TEST_PLAYER_1_NAME,
        players: [actualPlayer, testPlayer2],
      );

      final expectedResult = Right(expectedGame);

      verify(mockGameRepository.saveGame(expectedGame)).called(1);
      expect(actualResult, expectedResult);
    },
  );

  test(
    'should update mainPoints and bonus points and set the winner field if the sum exceed\'s games pointsToWin ( when bonusPoints exceed )',
    () async {
      final actualResult = await updateGame(
        UpdateGameParams(
            currentGame: gameToTest,
            currentPlayer: testPlayer1,
            newPoints: playerPoints,
            newBonusPoints: newPlayerBonusPointsThatExceed),
      );

      final actualPlayer = Player(
        name: TEST_PLAYER_1_NAME,
        points: playerPoints,
        bonusPoints: newPlayerBonusPointsThatExceed,
      );

      final expectedGame = Game(
          name: TEST_GAME_NAME_1,
          createdAt: TEST_CREATED_AT_1,
          numberOfPlayers: TEST_NUMBER_OF_PLAYERS_PARSED_1,
          pointsToWin: TEST_POINTS_TO_WIN_PARSED_1,
          winner: TEST_PLAYER_1_NAME,
          players: [actualPlayer, testPlayer2]);

      final expectedResult = Right(expectedGame);

      verify(mockGameRepository.saveGame(expectedGame)).called(1);
      expect(actualResult, expectedResult);
    },
  );
}
