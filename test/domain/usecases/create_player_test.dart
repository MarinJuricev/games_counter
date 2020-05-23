import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:game_counter/core/constants/budget_constants.dart';
import 'package:game_counter/core/error/failure.dart';
import 'package:game_counter/domain/entities/game.dart';
import 'package:game_counter/domain/entities/player.dart';
import 'package:game_counter/domain/repositories/game_repository.dart';
import 'package:game_counter/domain/usecases/create_player.dart';
import 'package:mockito/mockito.dart';

import '../../test_data/test_data.dart';

class MockGameRepository extends Mock implements GameRepository {}

void main() {
  CreatePlayer createPlayer;
  MockGameRepository mockGameRepository;

  final playerName = 'validPlayerName';
  final playerPoints = 0;
  final playerPointsHigherThanAllowed = 42;
  final playerBonusPoints = 0;
  final playerBonusPointsHigherThanAllowed = 42;
  Game gameToTest;
  Player newPlayer;

  setUp(
    () {
      mockGameRepository = MockGameRepository();
      createPlayer = CreatePlayer(repository: mockGameRepository);

      newPlayer = Player(
        name: playerName,
        points: playerPoints,
        bonusPoints: playerBonusPoints,
      );

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
    'should add a new player to the already existing game',
    () async {
      when(mockGameRepository.getGame())
          .thenAnswer((_) async => Right(gameToTest));

      final actualResult = await createPlayer(CreatePlayerParams(
          playerName: playerName,
          points: playerPoints,
          bonusPoints: playerBonusPoints));

      final expectedGame = gameToTest;
      expectedGame.players.add(newPlayer);

      final expectedResult = Right(expectedGame);

      expect(actualResult, expectedResult);
    },
  );

  test(
    'should return a [PlayerAlreadyExistsFailure] if a player with the same name already exists',
    () async {
      when(mockGameRepository.getGame())
          .thenAnswer((_) async => Right(gameToTest));

      final gameWithAddedPlayer = gameToTest;
      gameWithAddedPlayer.players.add(newPlayer);

      final actualResult = await createPlayer(CreatePlayerParams(
          playerName: playerName,
          points: playerPoints,
          bonusPoints: playerBonusPoints));
      final expectedResult =
          Left(PlayerAlreadyExistsFailure(PLAYER_ALREADY_EXISTS));

      expect(actualResult, expectedResult);
    },
  );

  test(
    'should return a [PointsToHighFailure] if a the new player starting points are higher than the game\'s pointsToWin',
    () async {
      when(mockGameRepository.getGame())
          .thenAnswer((_) async => Right(gameToTest));

      final actualResult = await createPlayer(CreatePlayerParams(
        playerName: playerName,
        points: playerPointsHigherThanAllowed,
        bonusPoints: playerBonusPoints,
      ));
      final expectedResult = Left(PointsToHighFailure(POINTS_TO_HIGH));

      expect(actualResult, expectedResult);
    },
  );

  test(
    'should return a [PointsToHighFailure] if a the new player starting bonusPoints are higher than the game\'s pointsToWin',
    () async {
      when(mockGameRepository.getGame())
          .thenAnswer((_) async => Right(gameToTest));

      final actualResult = await createPlayer(CreatePlayerParams(
        playerName: playerName,
        points: playerPoints,
        bonusPoints: playerBonusPointsHigherThanAllowed,
      ));
      final expectedResult = Left(PointsToHighFailure(POINTS_TO_HIGH));

      expect(actualResult, expectedResult);
    },
  );

  test(
    'should return a [PointsToHighFailure] if a the new player sum of starting bonusPoints  and starting points are higher than the game\'s pointsToWin',
    () async {
      when(mockGameRepository.getGame())
          .thenAnswer((_) async => Right(gameToTest));

      final actualResult = await createPlayer(CreatePlayerParams(
        playerName: playerName,
        points: 25,
        bonusPoints: 25,
      ));
      final expectedResult = Left(PointsToHighFailure(POINTS_TO_HIGH));

      expect(actualResult, expectedResult);
    },
  );

  test(
    'should return a [PointsToHighFailure] if a the new player sum of starting bonusPoints  and starting points are higher than the game\'s pointsToWin',
    () async {
      when(mockGameRepository.getGame())
          .thenAnswer((_) async => Right(gameToTest));

      final actualResult = await createPlayer(CreatePlayerParams(
        playerName: playerName,
        points: 25,
        bonusPoints: 25,
      ));
      final expectedResult = Left(PointsToHighFailure(POINTS_TO_HIGH));

      expect(actualResult, expectedResult);
    },
  );

  test(
    'should return a [CantAddMorePlayersFailure] if the newPlayer exceeds the numberOfPLayers inisde Game entity',
    () async {
      when(mockGameRepository.getGame())
          .thenAnswer((_) async => Right(gameToTest));

      final gameWithAddedPlayer = gameToTest;
      gameWithAddedPlayer.players.add(newPlayer);
      gameWithAddedPlayer.players.add(newPlayer);

      final actualResult = await createPlayer(
        CreatePlayerParams(
          playerName: 'newPlayerName',
          points: 0,
          bonusPoints: 0,
        ),
      );
      final expectedResult =
          Left(CantAddMorePlayersFailure(CANT_ADD_MORE_PLAYERS));

      expect(actualResult, expectedResult);
    },
  );
}
