import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:game_counter/core/error/failure.dart';
import 'package:game_counter/domain/entities/game.dart';
import 'package:game_counter/domain/entities/player.dart';
import 'package:game_counter/domain/repositories/game_repository.dart';
import 'package:game_counter/domain/usecases/create_player.dart';
import 'package:mockito/mockito.dart';

class MockGameRepository extends Mock implements GameRepository {}

void main() {
  CreatePlayer createPlayer;
  MockGameRepository mockGameRepository;

  final playerName = 'validPlayerName';
  final playerPoints = 0;
  final playerBonusPoints = 0;
  final gameName = 'Treseta';
  final pointsToWinParsed = 41;
  final numberOfPlayersParsed = 4;
  final testGame = Game(
    name: gameName,
    pointsToWin: pointsToWinParsed,
    numberOfPlayers: numberOfPlayersParsed,
    players: [],
  );
  final newPlayer = Player(
        name: playerName,
        points: playerPoints,
        bonusPoints: playerBonusPoints,
      );

  setUp(
    () {
      mockGameRepository = MockGameRepository();
      createPlayer = CreatePlayer(repository: mockGameRepository);
    },
  );

  group('createPlayer', () {
    test('should add a new player to the already existing game', () async {
      final actualResult = await createPlayer(Params(
        playerName: playerName,
        points: playerPoints,
        bonusPoints: playerBonusPoints,
        currentGame: testGame,
      ));

      final expectedGame = testGame;
      expectedGame.players.add(newPlayer);

      final expectedResult = Right(expectedGame);

      expect(actualResult, expectedResult);
    });

    test(
      'should return a [PlayerAlreadyExistsFailure] if a player with the same name already exists',
      () async {
        final gameWithAddedPlayer = testGame;
        gameWithAddedPlayer.players.add(newPlayer);

        final actualResult = await createPlayer(Params(
          playerName: playerName,
          points: playerPoints,
          bonusPoints: playerBonusPoints,
          currentGame: testGame,
        ));
        final expectedResult = Left(PlayerAlreadyExistsFailure());

        expect(actualResult, expectedResult);
      },
    );
  });
}
