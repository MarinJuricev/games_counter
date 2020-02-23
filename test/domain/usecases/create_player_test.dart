import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:game_counter/core/constants/budget_constants.dart';
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
  final playerPointsHigherThanAllowed = 42;
  final playerBonusPoints = 0;
  final playerBonusPointsHigherThanAllowed = 42;
  final gameName = 'Treseta';
  final pointsToWinParsed = 41;
  final numberOfPlayersParsed = 2;
  Game testGame;
  Player newPlayer;

  setUp(
    () {
      mockGameRepository = MockGameRepository();
      createPlayer = CreatePlayer(repository: mockGameRepository);

      testGame = Game(
        name: gameName,
        pointsToWin: pointsToWinParsed,
        numberOfPlayers: numberOfPlayersParsed,
        players: [],
      );
      newPlayer = Player(
        name: playerName,
        points: playerPoints,
        bonusPoints: playerBonusPoints,
      );
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
        final expectedResult = Left(PlayerAlreadyExistsFailure(PLAYER_ALREADY_EXISTS));

        expect(actualResult, expectedResult);
      },
    );

    test(
      'should return a [PointsToHighFailure] if a the new player starting points are higher than the game\'s pointsToWin',
      () async {
        final actualResult = await createPlayer(Params(
          playerName: playerName,
          points: playerPointsHigherThanAllowed,
          bonusPoints: playerBonusPoints,
          currentGame: testGame,
        ));
        final expectedResult = Left(PointsToHighFailure(POINTS_TO_HIGH));

        expect(actualResult, expectedResult);
      },
    );

    test(
      'should return a [PointsToHighFailure] if a the new player starting bonusPoints are higher than the game\'s pointsToWin',
      () async {
        final actualResult = await createPlayer(Params(
          playerName: playerName,
          points: playerPoints,
          bonusPoints: playerBonusPointsHigherThanAllowed,
          currentGame: testGame,
        ));
        final expectedResult = Left(PointsToHighFailure(POINTS_TO_HIGH));

        expect(actualResult, expectedResult);
      },
    );

    test(
      'should return a [PointsToHighFailure] if a the new player sum of starting bonusPoints  and starting points are higher than the game\'s pointsToWin',
      () async {
        final actualResult = await createPlayer(Params(
          playerName: playerName,
          points: 25,
          bonusPoints: 25,
          currentGame: testGame,
        ));
        final expectedResult = Left(PointsToHighFailure(POINTS_TO_HIGH));

        expect(actualResult, expectedResult);
      },
    );

    test(
      'should return a [PointsToHighFailure] if a the new player sum of starting bonusPoints  and starting points are higher than the game\'s pointsToWin',
      () async {
        final actualResult = await createPlayer(Params(
          playerName: playerName,
          points: 25,
          bonusPoints: 25,
          currentGame: testGame,
        ));
        final expectedResult = Left(PointsToHighFailure(POINTS_TO_HIGH));

        expect(actualResult, expectedResult);
      },
    );

    test(
      'should return a [CantAddMorePlayersFailure] if the newPlayer exceeds the numberOfPLayers inisde Game entity',
      () async {
        final gameWithAddedPlayer = testGame;
        gameWithAddedPlayer.players.add(newPlayer);
        gameWithAddedPlayer.players.add(newPlayer);

        final actualResult = await createPlayer(Params(
          playerName: 'newPlayerName',
          points: 0,
          bonusPoints: 0,
          currentGame: testGame,
        ));
        final expectedResult = Left(CantAddMorePlayersFailure(CANT_ADD_MORE_PLAYERS));

        expect(actualResult, expectedResult);
      },
    );
  });
}
