import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:game_counter/core/constants/budget_constants.dart';
import 'package:game_counter/core/error/failure.dart';
import 'package:game_counter/domain/entities/game.dart';
import 'package:game_counter/domain/repositories/history_repository.dart';
import 'package:game_counter/domain/usecases/get_games_from_query.dart';
import 'package:mockito/mockito.dart';

class MockHistoryRepository extends Mock implements HistoryRepository {}

void main() {
  MockHistoryRepository mockHistoryRepository;
  GetGamesFromQuery getGamesFromQuery;
  String query = "newQuery";
  List<Game> testGamesResult;
  Game testGame = Game(
    name: 'Treseta',
    pointsToWin: 41,
    numberOfPlayers: 4,
    players: [],
  );

  setUp(
    () {
      mockHistoryRepository = MockHistoryRepository();
      getGamesFromQuery =
          GetGamesFromQuery(historyRepository: mockHistoryRepository);

      testGamesResult = [];
    },
  );

  test(
    'should return a Right<List<Game>> when history repository returns a empty List<Game>',
    () async {
      when(mockHistoryRepository.getMatchesByQuery(query))
          .thenAnswer((_) async => Right(testGamesResult));

      final actualResult =
          await getGamesFromQuery(GetGamesFromQueryParams(query: query));

      List<Game> expectedList = [];
      final expectedResult = Right(testGamesResult);

      expect(expectedResult, actualResult);
      verify(mockHistoryRepository.getMatchesByQuery(query));
    },
  );

  test(
    'should return a Right<List<Game>> when history repository returns a List<Game>',
    () async {
      testGamesResult.add(testGame);

      when(mockHistoryRepository.getMatchesByQuery(query))
          .thenAnswer((_) async => Right(testGamesResult));

      final actualResult =
          await getGamesFromQuery(GetGamesFromQueryParams(query: query));

      final expectedResult = Right(testGamesResult);

      expect(expectedResult, actualResult);
      verify(mockHistoryRepository.getMatchesByQuery(query));
    },
  );

  test(
    'should return a Left<CacheFailure> when history repository returns a Failure',
    () async {
      testGamesResult.add(testGame);

      when(mockHistoryRepository.getMatchesByQuery(query)).thenAnswer(
          (_) async => Left(CacheFailure(ERROR_RETREVING_LOCAL_DATA)));

      final actualResult =
          await getGamesFromQuery(GetGamesFromQueryParams(query: query));

      final expectedResult = Left(CacheFailure(ERROR_RETREVING_LOCAL_DATA));

      expect(expectedResult, actualResult);
      verify(mockHistoryRepository.getMatchesByQuery(query));
    },
  );
}
