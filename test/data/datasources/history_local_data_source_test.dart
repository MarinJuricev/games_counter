import 'package:flutter_test/flutter_test.dart';
import 'package:game_counter/core/error/exceptions.dart';
import 'package:game_counter/data/datasources/history_local_data_source.dart';
import 'package:game_counter/data/datasources/local_persistence_provider.dart';
import 'package:mockito/mockito.dart';
import 'package:matcher/matcher.dart';

import '../../test_data/test_data.dart';

class MockLocalPersistenceProvider extends Mock
    implements LocalPersistenceProvider {}

void main() {
  HistoryLocalDataSource dataSource;
  MockLocalPersistenceProvider mockLocalPersistenceProvider;
  final String query = 'query';

  setUp(
    () {
      mockLocalPersistenceProvider = MockLocalPersistenceProvider();
      dataSource = HistoryLocalDataSourceImpl(
          localPersistenceProvider: mockLocalPersistenceProvider);
    },
  );

  group(
    'saveGame',
    () {
      test(
        'should return Future<void> when the index inside the box is greater than 0',
        () async {
          when(mockLocalPersistenceProvider.saveIntoPersistence(
                  boxToSaveInto: HISTORY_BOX, valueToSave: testLocalGame))
              .thenAnswer((_) async => 1);
          await dataSource.saveGame(testLocalGame);

          verify(mockLocalPersistenceProvider.saveIntoPersistence(
              boxToSaveInto: HISTORY_BOX, valueToSave: testLocalGame));
        },
      );

      test(
        'should throw [CacheException] when the index is lower then 0',
        () async {
          when(mockLocalPersistenceProvider.saveIntoPersistence(
                  boxToSaveInto: HISTORY_BOX, valueToSave: testLocalGame))
              .thenAnswer((_) async => -1);

          expect(() => dataSource.saveGame(testLocalGame),
              throwsA(TypeMatcher<CacheException>()));

          verify(mockLocalPersistenceProvider.saveIntoPersistence(
              boxToSaveInto: HISTORY_BOX, valueToSave: testLocalGame));
        },
      );
    },
  );

  group(
    'getMatchesByQuery',
    () {
      test(
        'should return filtered games when the localPersitenceProvider result isnt null',
        () async {
          final listOfGames = [
            testLocalGame,
            testLocalGame2,
            testLocalGame,
          ];
          final query = 'Tr';

          when(mockLocalPersistenceProvider.getAllFromPersistence(
                  boxToGetDataFrom: HISTORY_BOX))
              .thenAnswer((_) async => listOfGames);

          final actualResult = await dataSource.getMatchesByQuery(query);
          final expectedResult = [testGame, testGame];

          verify(mockLocalPersistenceProvider.getAllFromPersistence(
              boxToGetDataFrom: HISTORY_BOX));

          expect(expectedResult, actualResult);
        },
      );

      test(
        'should return filtered games when the localPersitenceProvider result isnt null with different query',
        () async {
          final listOfGames = [
            testLocalGame,
            testLocalGame2,
            testLocalGame,
          ];
          final query = TEST_GAME_NAME_2;

          when(mockLocalPersistenceProvider.getAllFromPersistence(
                  boxToGetDataFrom: HISTORY_BOX))
              .thenAnswer((_) async => listOfGames);

          final actualResult = await dataSource.getMatchesByQuery(query);
          final expectedResult = [testGame2];

          verify(mockLocalPersistenceProvider.getAllFromPersistence(
              boxToGetDataFrom: HISTORY_BOX));

          expect(expectedResult, actualResult);
        },
      );

      test(
        'should return filtered games when the localPersitenceProvider result isnt null with different query and lower case',
        () async {
          final listOfGames = [
            testLocalGame,
            testLocalGame2,
            testLocalGame,
          ];
          final query = TEST_GAME_NAME_2.toLowerCase();

          when(mockLocalPersistenceProvider.getAllFromPersistence(
                  boxToGetDataFrom: HISTORY_BOX))
              .thenAnswer((_) async => listOfGames);

          final actualResult = await dataSource.getMatchesByQuery(query);
          final expectedResult = [testGame2];

          verify(mockLocalPersistenceProvider.getAllFromPersistence(
              boxToGetDataFrom: HISTORY_BOX));

          expect(expectedResult, actualResult);
        },
      );

      test(
        'should return empty games list when the localPersitenceProvider result but query doesnt match',
        () async {
          final listOfGames = [
            testLocalGame,
            testLocalGame2,
            testLocalGame,
          ];
          final query = 'Znj';

          when(mockLocalPersistenceProvider.getAllFromPersistence(
                  boxToGetDataFrom: HISTORY_BOX))
              .thenAnswer((_) async => listOfGames);

          final actualResult = await dataSource.getMatchesByQuery(query);
          final expectedResult = [];

          verify(mockLocalPersistenceProvider.getAllFromPersistence(
              boxToGetDataFrom: HISTORY_BOX));

          expect(expectedResult, actualResult);
        },
      );

      test(
        'should throw [CacheException] when localPersistenceProvider result is null',
        () async {
          when(mockLocalPersistenceProvider.getAllFromPersistence(
                  boxToGetDataFrom: HISTORY_BOX))
              .thenAnswer((_) async => null);

          expect(() => dataSource.getMatchesByQuery('Query'),
              throwsA(TypeMatcher<CacheException>()));

          verify(mockLocalPersistenceProvider.getAllFromPersistence(
              boxToGetDataFrom: HISTORY_BOX));
        },
      );
    },
  );

  group(
    'saveQuery',
    () {
      test(
        'should return Future<void> when the index inside the box is greater than 0',
        () async {
          when(mockLocalPersistenceProvider.saveIntoPersistence(
                  boxToSaveInto: HISTORY_QUERY_BOX, valueToSave: query))
              .thenAnswer((_) async => 1);
          await dataSource.saveQuery(query);

          verify(mockLocalPersistenceProvider.saveIntoPersistence(
              boxToSaveInto: HISTORY_QUERY_BOX, valueToSave: query));
        },
      );

      test(
        'should throw [CacheException] when the index is lower then 0',
        () async {
          when(mockLocalPersistenceProvider.saveIntoPersistence(
                  boxToSaveInto: HISTORY_QUERY_BOX, valueToSave: query))
              .thenAnswer((_) async => -1);

          expect(() => dataSource.saveQuery(query),
              throwsA(TypeMatcher<CacheException>()));

          verify(mockLocalPersistenceProvider.saveIntoPersistence(
              boxToSaveInto: HISTORY_QUERY_BOX, valueToSave: query));
        },
      );
    },
  );
}
