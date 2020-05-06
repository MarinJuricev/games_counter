import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:game_counter/core/constants/budget_constants.dart';
import 'package:game_counter/core/error/exceptions.dart';
import 'package:game_counter/core/error/failure.dart';
import 'package:game_counter/data/datasources/history_local_data_source.dart';
import 'package:game_counter/data/models/local_game.dart';
import 'package:game_counter/data/repositories/history_repository_impl.dart';
import 'package:game_counter/domain/entities/game.dart';
import 'package:mockito/mockito.dart';

class MockHistoryLocalDataSource extends Mock
    implements HistoryLocalDataSource {}

void main() {
  MockHistoryLocalDataSource mockHistoryLocalDataSource;
  HistoryRepositoryImpl repository;

  Game testGame;
  LocalGame testLocalGame;
  final gameName = 'Treseta';
  final pointsToWin = 41;
  final numberOfPlayers = 2;

  setUp(
    () {
      mockHistoryLocalDataSource = MockHistoryLocalDataSource();
      repository = HistoryRepositoryImpl(
          historyLocalDataSource: mockHistoryLocalDataSource);

      testGame = Game(
        name: gameName,
        pointsToWin: pointsToWin,
        numberOfPlayers: numberOfPlayers,
        players: [],
      );

      testLocalGame = LocalGame(
        name: gameName,
        pointsToWin: pointsToWin,
        numberOfPlayers: numberOfPlayers,
        players: [],
      );
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
}
