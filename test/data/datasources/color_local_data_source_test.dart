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
  LocalAppColors testLocalAppColor;

  Hive.init('testPath');
  Hive.registerAdapter<LocalAppColors>(LocalAppColorsAdapter());

  setUp(() {
    mockLocalPersistenceProvider = MockLocalPersistenceProvider();
    dataSource = ColorLocalDataSourceImpl(
        localPersistenceProvider: mockLocalPersistenceProvider);

    testAppColor = AppColors(
      backGroundColor: '0xff58C6B2',
      accentColor: '0xff34AB95',
      errorColor: '0xff00FFF0',
      primaryColor: '0xff249681',
    );

    testLocalAppColor = LocalAppColors(
      backGroundColor: '0xff58C6B2',
      accentColor: '0xff34AB95',
      errorColor: '0xff00FFF0',
      primaryColor: '0xff249681',
    );
  });

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
        'should throw [CacheException] when there isnt any data present inside local persistence',
        () async {
          when(mockLocalPersistenceProvider.getFromPersistence(
                  boxToGetDataFrom: APP_THEME_BOX))
              .thenAnswer((_) async => null);

          expect(() => dataSource.getAppColors(),
              throwsA(TypeMatcher<CacheException>()));
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
