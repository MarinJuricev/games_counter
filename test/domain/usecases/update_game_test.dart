import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:game_counter/domain/entities/game.dart';
import 'package:game_counter/domain/entities/player.dart';
import 'package:game_counter/domain/repositories/game_repository.dart';
import 'package:game_counter/domain/usecases/update_game.dart';
import 'package:mockito/mockito.dart';

class MockGameRepository extends Mock implements GameRepository {}

void main() {
  MockGameRepository mockGameRepository;
  UpdateGame updateGame;

  final playerName = 'validPlayerName';
  final playerPoints = 0;
  final playerBonusPoints = 0;
  final newPlayerPoints = 14;
  final newPlayerBonusPoints = 3;
  final gameName = 'Treseta';
  final pointsToWin = 41;
  final numberOfPlayers = 2;
  Game testGame;
  Player testPlayer;

  setUp(
    () {
      mockGameRepository = MockGameRepository();

      updateGame = UpdateGame(repository: mockGameRepository);

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
    'updateGame',
    () {
      test(
        'should update mainPoints and bonus points if the sum doesn\'t exceed games pointsToWin',
        () async {
          final actualResult = await updateGame(
            Params(
                currentGame: testGame,
                currentPlayer: testPlayer,
                newPoints: newPlayerPoints,
                newBonusPoints: newPlayerBonusPoints),
          );

          final actualPlayer = Player(
            name: playerName,
            points: newPlayerPoints,
            bonusPoints: newPlayerBonusPoints,
          );

          final expectedResult = Right(
            Game(
              name: gameName,
              pointsToWin: pointsToWin,
              numberOfPlayers: numberOfPlayers,
              players: [actualPlayer],
            ),
          );

          expect(actualResult, expectedResult);
        },
      );
    },
  );
}
