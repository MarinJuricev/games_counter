import 'package:flutter_test/flutter_test.dart';
import 'package:game_counter/core/error/exceptions.dart';
import 'package:game_counter/data/datasources/color_local_data_source.dart';
import 'package:game_counter/data/models/local_app_colors.dart';
import 'package:game_counter/domain/entities/app_colors.dart';
import 'package:hive/hive.dart';
import 'package:mockito/mockito.dart';
import 'package:matcher/matcher.dart';

class MockBox extends Mock implements Box<dynamic> {}

void main() {
  ColorLocalDataSourceImpl dataSource;
  MockBox mockBox;

  AppColors testAppColor;
  LocalAppColors testLocalAppColor;

  Hive.init('testPath');
  Hive.registerAdapter<LocalAppColors>(LocalAppColorsAdapter());

  setUp(() {
    mockBox = MockBox();
    dataSource = ColorLocalDataSourceImpl(hiveBox: mockBox);

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
    'colorLocalDataSource',
    () {
      test(
        'should call box.add with the re-mapped appColor value when cachAppColors is called',
        () async {
          when(mockBox.add(testLocalAppColor)).thenAnswer((_) async => 1);
          await dataSource.cacheAppColors(testLocalAppColor);

          verify(mockBox.add(testLocalAppColor));
        },
      );

      test(
        'should throw [CacheException] when the index is lower then 0',
        () async {
          when(mockBox.add(testLocalAppColor)).thenAnswer((_) async => -1);

          expect(() => dataSource.cacheAppColors(testLocalAppColor),
              throwsA(TypeMatcher<CacheException>()));

          verify(mockBox.add(testLocalAppColor));
        },
      );

      test(
        'should get the latest LocalAppColors instance inside local persistence',
        () async {
          when(mockBox.get(APP_THEME))
              .thenAnswer((_) async => testLocalAppColor);

          final actualResult = await dataSource.getAppColors();
          final expectedResult = testAppColor;

          verify(mockBox.get(APP_THEME));
          assert(expectedResult == actualResult);
        },
      );

      test(
        'should throw [CacheException] when there isnt any data present inside local persistence',
        () async {
          when(mockBox.get(APP_THEME)).thenAnswer((_) async => null);

          expect(() => dataSource.getAppColors(),
              throwsA(TypeMatcher<CacheException>()));
          verify(mockBox.get(APP_THEME));
        },
      );
    },
  );
}
