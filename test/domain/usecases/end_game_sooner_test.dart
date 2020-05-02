import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:game_counter/domain/entities/game.dart';
import 'package:game_counter/domain/entities/player.dart';
import 'package:game_counter/domain/repositories/game_repository.dart';
import 'package:game_counter/domain/usecases/end_game_sooner.dart';
import 'package:mockito/mockito.dart';

class MockGameRepository extends Mock implements GameRepository {}

void main() {
  MockGameRepository mockGameRepository;
  EndGameSooner endGameSooner;

  final playerName = 'validPlayerName';
  final playerNameWithMorePoints = 'validPlayerNameWithMorePoints';
  final playerPoints = 0;
  final playerBonusPoints = 0;
  final newPlayerPoints = 14;
  final newPlayerBonusPoints = 3;
  final gameName = 'Treseta';
  final pointsToWin = 41;
  final numberOfPlayers = 2;
  Game testGame;
  Player testPlayer;
  Player testPlayerWithMorePoints;

  setUp(
    () {
      mockGameRepository = MockGameRepository();
      endGameSooner = EndGameSooner(repository: mockGameRepository);

      testPlayer = Player(
        name: playerName,
        points: playerPoints,
        bonusPoints: playerBonusPoints,
      );

      testPlayerWithMorePoints = Player(
        name: playerNameWithMorePoints,
        points: newPlayerPoints,
        bonusPoints: newPlayerBonusPoints,
      );

      testGame = Game(
        name: gameName,
        pointsToWin: pointsToWin,
        numberOfPlayers: numberOfPlayers,
        players: [testPlayer, testPlayerWithMorePoints],
      );
    },
  );

  group(
    'endGameSooner',
    () {
      test(
        'should update winner field in game object with the player with most points',
        () async {
          final actualResult =
              await endGameSooner(EndGameSoonerParams(currentGame: testGame));

          final expectedResult = Right(testPlayerWithMorePoints);

          expect(actualResult, expectedResult);
        },
      );
    },
  );
}
