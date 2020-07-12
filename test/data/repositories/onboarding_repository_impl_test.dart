import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:game_counter/core/constants/budget_constants.dart';
import 'package:game_counter/core/error/failure.dart';
import 'package:game_counter/data/datasources/onboarding_local_data_source.dart';
import 'package:game_counter/data/repositories/onboarding_repository_impl.dart';
import 'package:game_counter/domain/repositories/onboarding_repository.dart';
import 'package:mockito/mockito.dart';

class MockOnboardlingLocalDataSource extends Mock
    implements OnboardingLocalDataSource {}

void main() {
  MockOnboardlingLocalDataSource mockOnboardlingLocalDataSource;
  OnboardingRepository onboardingRepository;

  setUp(
    () {
      mockOnboardlingLocalDataSource = MockOnboardlingLocalDataSource();
      onboardingRepository = OnboardingRepositoryImpl(
          onboardingLocalDataSource: mockOnboardlingLocalDataSource);
    },
  );

  group(
    'getOnboardingStatus',
    () {
      test(
        'should return result from OnboardingLocalDataSource',
        () async {
          when(mockOnboardlingLocalDataSource.getOnboardingStatus())
              .thenAnswer((_) async => true);

          final actualResult = await onboardingRepository.getOnboardingStatus();
          final expectedResult = Right(true);

          expect(actualResult, expectedResult);
        },
      );

      test(
        'should return result from OnboardingLocalDataSource',
        () async {
          when(mockOnboardlingLocalDataSource.getOnboardingStatus())
              .thenAnswer((_) async => false);

          final actualResult = await onboardingRepository.getOnboardingStatus();
          final expectedResult = Left(CacheFailure(ERROR_RETREVING_LOCAL_DATA));

          expect(actualResult, expectedResult);
        },
      );
    },
  );

  group(
    'setOnboardingStatus',
    () {
      test(
        'should return result from OnboardingLocalDataSource',
        () async {
          when(mockOnboardlingLocalDataSource.setOnboardingStatus(true))
              .thenAnswer((_) async => null);

          await onboardingRepository.setOnboardingStatus(true);

          verify(mockOnboardlingLocalDataSource.setOnboardingStatus(true))
              .called(1);
        },
      );
    },
  );
}
