import 'package:dartz/dartz.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:game_counter/core/constants/budget_constants.dart';
import 'package:game_counter/core/error/exceptions.dart';
import 'package:game_counter/core/error/failure.dart';
import 'package:game_counter/data/datasources/color_local_data_source.dart';
import 'package:game_counter/data/models/local_app_colors.dart';
import 'package:game_counter/data/repositories/color_repository_impl.dart';
import 'package:game_counter/domain/entities/app_colors.dart';
import 'package:mockito/mockito.dart';

class MockLocalColorDataSource extends Mock implements ColorLocalDataSource {}

void main() {
  MockLocalColorDataSource mockLocalColorDataSource;
  ColorRepositoryImpl repository;

  AppColors testAppColor;
  LocalAppColors testLocalAppColor;

  setUp(
    () {
      mockLocalColorDataSource = MockLocalColorDataSource();

      repository =
          ColorRepositoryImpl(colorLocalDataSource: mockLocalColorDataSource);

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
    },
  );

  group(
    'getColor',
    () {
      test(
        'should return valid Right<AppColor> when there is data present inside local persistence',
        () async {
          when(mockLocalColorDataSource.getAppColors())
              .thenAnswer((_) async => Future.value(testAppColor));

          final actualResult = await repository.getColor();
          final expectedResult = Right(testAppColor);

          verify(mockLocalColorDataSource.getAppColors());
          expect(expectedResult, actualResult);
        },
      );

      test(
        'should return Left<CacheFailure> when local persistence throws [CacheException]',
        () async {
          when(mockLocalColorDataSource.getAppColors())
              .thenThrow(CacheException());

          final actualResult = await repository.getColor();
          final expectedResult = Left(CacheFailure(ERROR_RETREVING_LOCAL_DATA));

          verify(mockLocalColorDataSource.getAppColors());
          expect(expectedResult, actualResult);
        },
      );
    },
  );

  group(
    'updateAppColors',
    () {
      test(
        'should return valid Right<void> when local persistence returns a success',
        () async {
          when(mockLocalColorDataSource.cacheAppColors(testLocalAppColor))
              .thenAnswer((_) async => Future<void>.value());

          final actualResult = await repository.updateAppColors(testAppColor);
          final expectedResult = Right(null);

          expect(expectedResult, actualResult);
        },
      );

      test(
        'should return Left<CacheFailure> when local persistence throws [CacheException]',
        () async {
          when(mockLocalColorDataSource.cacheAppColors(any))
              .thenThrow(CacheException());

          final actualResult = await repository.updateAppColors(testAppColor);
          final expectedResult = Left(CacheFailure(ERROR_RETREVING_LOCAL_DATA));

          expect(expectedResult, actualResult);
        },
      );
    },
  );
}
