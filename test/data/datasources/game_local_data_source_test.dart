import 'package:flutter_test/flutter_test.dart';
import 'package:game_counter/core/error/exceptions.dart';
import 'package:game_counter/data/datasources/game_local_data_source.dart';
import 'package:game_counter/data/datasources/local_persistence_provider.dart';
import 'package:game_counter/data/models/local_game.dart';
import 'package:matcher/matcher.dart';
import 'package:mockito/mockito.dart';

import '../../test_data/test_data.dart';

class MockLocalPersistenceProvider extends Mock
    implements LocalPersistenceProvider {}

void main() {
  GameLocalDataSource gameLocalDataSource;
  MockLocalPersistenceProvider mockLocalPersistenceProvider;

  setUp(
    () {
      mockLocalPersistenceProvider = MockLocalPersistenceProvider();
      gameLocalDataSource = GameLocalDataSourceImpl(
          localPersistenceProvider: mockLocalPersistenceProvider);

    },
  );

  group(
    'getGame',
    () {
      test(
          'should return testLocalGame when localPersistenceProvider.getFromPersistence result isnt null',
          () async {
        when(mockLocalPersistenceProvider.getFromKeyValuePair(
                boxToGetDataFrom: CURRENT_GAME_BOX))
            .thenAnswer((_) async => testLocalGame);

        final actualResult = await gameLocalDataSource.getGame();
        final expectedResult = testGame;

        verify(mockLocalPersistenceProvider.getFromKeyValuePair(
            boxToGetDataFrom: CURRENT_GAME_BOX));
        expect(expectedResult, actualResult);
      });

      test(
        'should throw [CacheException] when localPersistenceProvider.getFromPersistence result is null',
        () async {
          when(mockLocalPersistenceProvider.getFromKeyValuePair(
                  boxToGetDataFrom: CURRENT_GAME_BOX))
              .thenAnswer((_) async => null);

          final call = gameLocalDataSource.getGame;
          expect(() => call(), throwsA(TypeMatcher<CacheException>()));
        },
      );
    },
  );

  group(
    'cacheGame',
    () {
      test(
        'should return Future<void> when localPersistenceProvider.saveKeyValuePair is finished',
        () async {
          when(mockLocalPersistenceProvider.saveKeyValuePair(
            valueToSave: testGame.toLocal(),
            boxToSaveInto: CURRENT_GAME_BOX,
          )).thenAnswer((_) async => null);

          //TODO add a mapper that will be user to map from DOMAIN -> DATA models so
          // that we can control the flow in tests, EX:
          // mapper.map(from, to, function) ??
          // so that we can use that inside a test
          // when(mapper.map(from, to, function)).thenReturn/thenAnswer and correctly
          // test this.∏
        },
      );
    },
  );
}
