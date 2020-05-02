import 'package:flutter_test/flutter_test.dart';
import 'package:game_counter/domain/usecases/reset_player.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';
import 'package:game_counter/domain/repositories/game_repository.dart';
import 'package:game_counter/domain/entities/game.dart';
import 'package:game_counter/domain/entities/player.dart';

class MockGameRepository extends Mock implements GameRepository {}

void main() {
  MockGameRepository mockGameRepository;
  ResetPlayer resetPlayer;

  final playerName = 'validPlayerName';
  final playerPoints = 0;
  final playerBonusPoints = 0;
  final gameName = 'Treseta';
  final pointsToWin = 41;
  final numberOfPlayers = 2;
  Game testGame;
  Player testPlayer;

  setUp(
    () {
      mockGameRepository = MockGameRepository();
      resetPlayer = ResetPlayer(repository: mockGameRepository);

      testPlayer = Player(
        name: playerName,
        points: playerPoints,
        bonusPoints: playerBonusPoints,
      );

      testGame = Game(
        name: gameName,
        pointsToWin: pointsToWin,
        numberOfPlayers: numberOfPlayers,
        players: [testPlayer],
      );
    },
  );

  group(
    'resetPlayer',
    () {
      test(
        'should update mainPoints and bonusPoints with 0',
        () async {
          final actualResult = await resetPlayer(
            ResetPlayerParams(
              currentGame: testGame,
              currentPlayer: testPlayer,
            ),
          );

          final actualPlayer = Player(
            name: playerName,
            points: 0,
            bonusPoints: 0,
          );

          final expectedGame = Game(
            name: gameName,
            pointsToWin: pointsToWin,
            numberOfPlayers: numberOfPlayers,
            players: [actualPlayer],
          );
          final expectedResult = Right(expectedGame);

          verify(mockGameRepository.saveGame(expectedGame)).called(1);
          expect(actualResult, expectedResult);
        },
      );
    },
  );
}
