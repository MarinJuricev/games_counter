import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:game_counter/domain/repositories/onboarding_repository.dart';
import 'package:game_counter/domain/usecases/set_onboarding_status.dart';
import 'package:mockito/mockito.dart';

class MockOnboardingRepository extends Mock implements OnboardingRepository {}

void main() {
  MockOnboardingRepository mockOnboardingRepository;
  SetOnBoardingStatus setOnBoardingStatus;

  setUp(
    () {
      mockOnboardingRepository = MockOnboardingRepository();
      setOnBoardingStatus =
          SetOnBoardingStatus(repository: mockOnboardingRepository);
    },
  );

  test(
    'should trigger onboarding repository setOnboardingStatus',
    () async {
      final onboardingParam = SetOnboardingStatusParams(onboardingStatus: true);
      final onboardingStatus = true;

      when(mockOnboardingRepository.setOnboardingStatus(onboardingStatus))
          .thenAnswer((_) async => Right(null));

      await setOnBoardingStatus(onboardingParam);

      verify(mockOnboardingRepository.setOnboardingStatus(onboardingStatus))
          .called(1);
    },
  );
}
