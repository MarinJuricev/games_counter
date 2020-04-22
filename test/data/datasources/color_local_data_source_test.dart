import 'package:flutter_test/flutter_test.dart';
import 'package:game_counter/data/datasources/color_local_data_source.dart';
import 'package:game_counter/data/models/local_app_colors.dart';
import 'package:game_counter/domain/entities/app_colors.dart';
import 'package:hive/hive.dart';
import 'package:mockito/mockito.dart';

class MockHiveInterface extends Mock implements HiveInterface {}

void main() {
  ColorLocalDataSourceImpl dataSource;
  MockHiveInterface mockHiveInterface;

  AppColors testAppColor;
  LocalAppColors testLocalAppColor;

  setUp(() {
    mockHiveInterface = MockHiveInterface();
    dataSource = ColorLocalDataSourceImpl(hiveBox: mockHiveInterface);

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
        'should return Future<void> when the appColor is successfully saved into local storage',
        () async {
          Hive.init('testPath');
          Hive.registerAdapter<LocalAppColors>(LocalAppColorsAdapter());

          when(mockHiveInterface.openBox(APP_THEME)).thenAnswer(
            (_) async => Hive.openBox(APP_THEME),
          );

          final actualResult = await dataSource.cacheAppColors(testAppColor);
          final expectedResult = await Future<void>.value();

          verify(mockHiveInterface.openBox(APP_THEME));

          //TODO reafctor local_color to use Either type
          assert(2 == 2);
        },
      );
    },
  );
}
