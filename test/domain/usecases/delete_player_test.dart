import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:game_counter/core/constants/budget_constants.dart';
import 'package:game_counter/core/error/failure.dart';
import 'package:game_counter/domain/entities/game.dart';
import 'package:game_counter/domain/entities/player.dart';
import 'package:game_counter/domain/repositories/game_repository.dart';
import 'package:game_counter/domain/usecases/delete_player.dart';
import 'package:mockito/mockito.dart';

class MockGameRepository extends Mock implements GameRepository {}

void main() {
  MockGameRepository mockGameRepository;
  DeletePlayer deletePlayer;

  final playerName = 'validPlayerName';
  final playerPoints = 0;
  final playerBonusPoints = 0;
  final gameName = 'Treseta';
  final pointsToWin = 41;
  final numberOfPlayers = 2;
  Game testGame;
  Player testPlayer;
  Player testPlayer2;

  setUp(
    () {
      mockGameRepository = MockGameRepository();

      deletePlayer = DeletePlayer(repository: mockGameRepository);

      testPlayer = Player(
        name: playerName,
        points: playerPoints,
        bonusPoints: playerBonusPoints,
      );

      testPlayer2 = Player(
        name: 'RandomName',
        points: 12,
        bonusPoints: 12,
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
    'deletePlayer',
    () {
      test(
        'should return a updated game object that doesn\t contain the provided player object',
        () async {
          when(mockGameRepository.getGame())
              .thenAnswer((_) async => Right(testGame));

          final actualResult = await deletePlayer(
              DeletePlayerParams(playerToDelete: testPlayer));

          final expectedGame = Game(
            name: gameName,
            pointsToWin: pointsToWin,
            numberOfPlayers: numberOfPlayers,
            players: [],
          );

          final expectedResult = Right(expectedGame);

          verify(mockGameRepository.saveGame(expectedGame)).called(1);
          expect(actualResult, expectedResult);
        },
      );

      test(
        'should return [NotImplementedFailure] when the playerToRemove isn\t present in the game object',
        () async {
          when(mockGameRepository.getGame())
              .thenAnswer((_) async => Right(testGame));

          final actualResult = await deletePlayer(
              DeletePlayerParams(playerToDelete: testPlayer2));
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
