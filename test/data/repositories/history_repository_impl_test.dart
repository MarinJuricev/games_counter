import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:game_counter/core/constants/budget_constants.dart';
import 'package:game_counter/core/error/exceptions.dart';
import 'package:game_counter/core/error/failure.dart';
import 'package:game_counter/data/datasources/history_local_data_source.dart';
import 'package:game_counter/data/repositories/history_repository_impl.dart';
import 'package:game_counter/domain/entities/game.dart';
import 'package:mockito/mockito.dart';

import '../../test_data/test_data.dart';

class MockHistoryLocalDataSource extends Mock
    implements HistoryLocalDataSource {}

void main() {
  MockHistoryLocalDataSource mockHistoryLocalDataSource;
  HistoryRepositoryImpl repository;

  final query = 'Tr';

  setUp(
    () {
      mockHistoryLocalDataSource = MockHistoryLocalDataSource();
      repository = HistoryRepositoryImpl(
          historyLocalDataSource: mockHistoryLocalDataSource);
    },
  );

  group(
    'saveGameIntoHistory',
    () {
      test(
        'should return  Right<void> when local persistence returns a success',
        () async {
          when(mockHistoryLocalDataSource.saveGame(testLocalGame))
              .thenAnswer((_) async => Future<void>.value());

          final actualResult = await repository.saveGameIntoHistory(testGame);
          final expectedResult = Right(null);

          expect(expectedResult, actualResult);
        },
      );

      test(
        'should return Left<CacheFailure> when local persistence throws [CacheException]',
        () async {
          when(mockHistoryLocalDataSource.saveGame(any))
              .thenThrow(CacheException());

          final actualResult = await repository.saveGameIntoHistory(testGame);
          final expectedResult = Left(CacheFailure(ERROR_RETREVING_LOCAL_DATA));

          expect(expectedResult, actualResult);
        },
      );
    },
  );

  group(
    'getMatchesByQuery',
    () {
      test(
        'should return Right<List<Game> when local persistence returns a success',
        () async {
          final localResult = [testGame, testGame];

          when(mockHistoryLocalDataSource.getMatchesByQuery(query))
              .thenAnswer((_) async => Future.value(localResult));

          final actualResult = await repository.getMatchesByQuery(query);
          final expectedResult = Right(localResult);

          expect(expectedResult, actualResult);

          verify(mockHistoryLocalDataSource.getMatchesByQuery(query));
        },
      );

      test(
        'should return Right empty game list when local persistence returns a empty list',
        () async {
          final List<Game> localResult = [];

          when(mockHistoryLocalDataSource.getMatchesByQuery(query))
              .thenAnswer((_) async => Future.value(localResult));

          final actualResult = await repository.getMatchesByQuery(query);
          final expectedResult = Right(localResult);

          expect(expectedResult, actualResult);

          verify(mockHistoryLocalDataSource.getMatchesByQuery(query));
        },
      );

      test(
        'should return Left<CacheFailure> when local persistence throws [CacheException]',
        () async {
          when(mockHistoryLocalDataSource.getMatchesByQuery(query))
              .thenThrow(CacheException());

          final actualResult = await repository.getMatchesByQuery(query);
          final expectedResult = Left(CacheFailure(ERROR_RETREVING_LOCAL_DATA));

          expect(expectedResult, actualResult);
        },
      );
    },
  );

  group(
    'saveQuery',
    () {
      test(
        'should return Right<void> when local persistence returns a success',
        () async {
          when(mockHistoryLocalDataSource.saveQuery(query))
              .thenAnswer((_) async => Future<void>.value());

          final actualResult = await repository.saveQuery(query);
          final expectedResult = Right(null);

          expect(expectedResult, actualResult);
        },
      );

      test(
        'should return Left<CacheFailure> when local persistence throws [CacheException]',
        () async {
          when(mockHistoryLocalDataSource.saveQuery(query))
              .thenThrow(CacheException());

          final actualResult = await repository.saveQuery(query);
          final expectedResult = Left(CacheFailure(ERROR_RETREVING_LOCAL_DATA));

          expect(expectedResult, actualResult);
        },
      );
    },
  );
}
