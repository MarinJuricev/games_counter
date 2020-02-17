import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:game_counter/core/error/exceptions.dart';
import 'package:game_counter/core/error/failure.dart';
import 'package:game_counter/core/localization/budget_localization.dart';
import 'package:game_counter/data/datasources/game_local_data_source.dart';
import 'package:game_counter/data/repositories/game_repository_impl.dart';
import 'package:game_counter/domain/entities/game.dart';
import 'package:mockito/mockito.dart';

class MockLocalDataSource extends Mock implements GameLocalDataSource {}

void main() {
  GameRepositoryImpl repository;
  MockLocalDataSource mockLocalDataSource;

  final testGame = Game(
    name: 'gameName',
    pointsToWin: 41,
    numberOfPlayers: 4,
    bonusPoints: 0,
    players: [],
    winner: 'noWinner',
  );

  setUp(
    () {
      mockLocalDataSource = MockLocalDataSource();

      repository = GameRepositoryImpl(
        gameLocalDataSource: mockLocalDataSource,
      );
    },
  );

  group('saveGame', () {
    test(
        'should call localDataSource cache game with the exact same game object',
        () async {
      when(mockLocalDataSource.cacheGame(testGame))
          .thenAnswer((_) async => Future<void>.value());

      final actualResult = await repository.saveGame(testGame);
      final expectedResult = Right(null);

      verify(mockLocalDataSource.cacheGame(testGame));
      expect(actualResult, expectedResult);
    });

    test(
        'should return [CacheFailure] when there was a [CacheException] saving the object in local persistence',
        () async {
      when(mockLocalDataSource.cacheGame(testGame)).thenThrow(CacheException());

      final actualResult = await repository.saveGame(testGame);
      final expectedResult = Left(CacheFailure(ERROR_RETREVING_LOCAL_DATA));

      verify(mockLocalDataSource.cacheGame(testGame));
      expect(actualResult, expectedResult);
    });
  });

  group('getGame', () {
    test(
        'should call localDataSource and return that data if there is cache data present',
        () async {
      when(mockLocalDataSource.getGame())
          .thenAnswer((_) async => testGame);

      final actualResult = await repository.getGame();
      final expectedResult = Right(testGame);

      verify(mockLocalDataSource.getGame());
      expect(actualResult, expectedResult);
    });

    test(
        'should return [CacheFailure] when there was a [CacheException] when getting the data in local persistence',
        () async {
      when(mockLocalDataSource.getGame())
          .thenThrow(CacheException());

      final actualResult = await repository.getGame();
      final expectedResult = Left(CacheFailure(ERROR_RETREVING_LOCAL_DATA));

      verify(mockLocalDataSource.getGame());
      expect(actualResult, expectedResult);
    });
  });
}
