import 'package:flutter_test/flutter_test.dart';
import 'package:game_counter/core/error/exceptions.dart';
import 'package:game_counter/data/datasources/history_local_data_source.dart';
import 'package:game_counter/data/datasources/local_persistence_provider.dart';
import 'package:game_counter/data/models/local_game.dart';
import 'package:mockito/mockito.dart';
import 'package:matcher/matcher.dart';

class MockLocalPersistenceProvider extends Mock
    implements LocalPersistenceProvider {}

void main() {
  HistoryLocalDataSource dataSource;
  MockLocalPersistenceProvider mockLocalPersistenceProvider;

  LocalGame testLocalGame;
  final gameName = 'Treseta';
  final pointsToWin = 41;
  final numberOfPlayers = 2;

  setUp(
    () {
      mockLocalPersistenceProvider = MockLocalPersistenceProvider();
      dataSource = HistoryLocalDataSourceImpl(
          localPersistenceProvider: mockLocalPersistenceProvider);

      testLocalGame = LocalGame(
        name: gameName,
        pointsToWin: pointsToWin,
        numberOfPlayers: numberOfPlayers,
        players: [],
      );
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
}
