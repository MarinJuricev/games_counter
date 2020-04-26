import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:game_counter/core/error/exceptions.dart';
import 'package:game_counter/data/datasources/color_local_data_source.dart';
import 'package:game_counter/data/datasources/local_persistence_provider.dart';
import 'package:game_counter/data/models/local_app_colors.dart';
import 'package:game_counter/domain/entities/app_colors.dart';
import 'package:hive/hive.dart';
import 'package:mockito/mockito.dart';
import 'package:matcher/matcher.dart';

class MockLocalPersistenceProvider extends Mock
    implements LocalPersistenceProvider {}

void main() {
  ColorLocalDataSourceImpl dataSource;
  MockLocalPersistenceProvider mockLocalPersistenceProvider;

  AppColors testAppColor;
  AppColors defaultAppColors;
  LocalAppColors testLocalAppColor;

  Hive.init('testPath');
  Hive.registerAdapter<LocalAppColors>(LocalAppColorsAdapter());

  setUp(
    () {
      mockLocalPersistenceProvider = MockLocalPersistenceProvider();
      dataSource = ColorLocalDataSourceImpl(
          localPersistenceProvider: mockLocalPersistenceProvider);

      testAppColor = AppColors(
        backGroundColor: 'ff58C6B2',
        accentColor: 'ff34AB95',
        errorColor: 'ff00FFF0',
        primaryColor: 'ff249681',
      );

      testLocalAppColor = LocalAppColors(
        backGroundColor: 'ff58C6B2',
        accentColor: 'ff34AB95',
        errorColor: 'ff00FFF0',
        primaryColor: 'ff249681',
      );

      defaultAppColors = AppColors(
        backGroundColor: 'ff58C6B2',
        accentColor: 'ff34AB95',
        errorColor: 'ff00FFF0',
        primaryColor: 'ff249681',
      );
    },
  );

  group(
    'getAppColors',
    () {
      test(
        'should return localAppColors when localPersistenceProvider.getFromPersistence result isnt null',
        () async {
          when(mockLocalPersistenceProvider.getFromPersistence(
                  boxToGetDataFrom: APP_THEME_BOX))
              .thenAnswer((_) async => testLocalAppColor);

          final actualResult = await dataSource.getAppColors();
          final expectedResult = testAppColor;

          verify(mockLocalPersistenceProvider.getFromPersistence(
              boxToGetDataFrom: APP_THEME_BOX));
          assert(expectedResult == actualResult);
        },
      );

      test(
        'should return defaultAppColors when there isnt any data in local persistence',
        () async {
          when(mockLocalPersistenceProvider.getFromPersistence(
                  boxToGetDataFrom: APP_THEME_BOX))
              .thenAnswer((_) async => null);

          final actualResult = await dataSource.getAppColors();
          final expectedResult = defaultAppColors;

          expect(expectedResult, actualResult);
          verify(mockLocalPersistenceProvider.getFromPersistence(
              boxToGetDataFrom: APP_THEME_BOX));
        },
      );
    },
  );

  group(
    'cacheAppColors',
    () {
      test(
        'should return Future<void> when the index inside the box is greater than 0',
        () async {
          when(mockLocalPersistenceProvider.saveIntoPersistence(
                  boxToSaveInto: APP_THEME_BOX, valueToSave: testLocalAppColor))
              .thenAnswer((_) async => 1);
          await dataSource.cacheAppColors(testLocalAppColor);

          verify(mockLocalPersistenceProvider.saveIntoPersistence(
              boxToSaveInto: APP_THEME_BOX, valueToSave: testLocalAppColor));
        },
      );

      test(
        'should throw [CacheException] when the index is lower then 0',
        () async {
          when(mockLocalPersistenceProvider.saveIntoPersistence(
                  boxToSaveInto: APP_THEME_BOX, valueToSave: testLocalAppColor))
              .thenAnswer((_) async => -1);

          expect(() => dataSource.cacheAppColors(testLocalAppColor),
              throwsA(TypeMatcher<CacheException>()));

          verify(mockLocalPersistenceProvider.saveIntoPersistence(
              boxToSaveInto: APP_THEME_BOX, valueToSave: testLocalAppColor));
        },
      );
    },
  );
}
