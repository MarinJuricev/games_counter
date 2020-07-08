import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:game_counter/core/usecase/base_usecase.dart';
import 'package:game_counter/domain/repositories/onboarding_repository.dart';
import 'package:game_counter/domain/usecases/should_skip_onboarding.dart';
import 'package:mockito/mockito.dart';

class MockOnboardingRepository extends Mock implements OnboardingRepository {}

void main() {
  MockOnboardingRepository mockOnboardingRepository;
  ShouldSkipOnboarding shouldSkipOnboarding;

  setUp(
    () {
      mockOnboardingRepository = MockOnboardingRepository();
      shouldSkipOnboarding =
          ShouldSkipOnboarding(repository: mockOnboardingRepository);
    },
  );

  test(
    'should trigger onboarding repository getOnboardingStatus',
    () async {
      when(mockOnboardingRepository.getOnboardingStatus()).thenAnswer((_) async => Right(true));

      final actualResult = await shouldSkipOnboarding(NoParams());
      final expectedResult = Right(true);

      verify(mockOnboardingRepository.getOnboardingStatus()).called(1);
      expect(actualResult, expectedResult);
    },
  );
}
