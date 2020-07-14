import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:game_counter/core/constants/budget_constants.dart';
import 'package:game_counter/core/error/failure.dart';
import 'package:game_counter/core/usecase/base_usecase.dart';
import 'package:game_counter/domain/usecases/set_onboarding_status.dart';
import 'package:game_counter/domain/usecases/should_skip_onboarding.dart';
import 'package:game_counter/presentation/feature/onboarding/bloc/onboarding_bloc.dart';
import 'package:mockito/mockito.dart';

class MockShouldSkipOnboarding extends Mock implements ShouldSkipOnboarding {}

class MockSetOnBoardingStatus extends Mock implements SetOnBoardingStatus {}

void main() {
  MockShouldSkipOnboarding mockShouldSkipOnboarding;
  MockSetOnBoardingStatus mockSetOnBoardingStatus;

  setUp(
    () {
      mockShouldSkipOnboarding = MockShouldSkipOnboarding();
      mockSetOnBoardingStatus = MockSetOnBoardingStatus();
    },
  );

  group(
    'OnboardingEvent.started',
    () {
      blocTest(
        'should emit OnboardingState.startOnboardingState when shouldSkipOnboarding returns Left',
        build: () async {
          when(mockShouldSkipOnboarding(NoParams())).thenAnswer(
              (_) async => Left(CacheFailure(ERROR_RETREVING_LOCAL_DATA)));

          return OnboardingBloc(
            shouldSkipOnboarding: mockShouldSkipOnboarding,
            setOnBoardingStatus: mockSetOnBoardingStatus,
          );
        },
        act: (OnboardingBloc onBoardingBloc) async =>
            onBoardingBloc.add(OnboardingEvent.started()),
        expect: [OnboardingState.startOnboardingState()],
      );

      blocTest(
        'should emit OnboardingState.skipOnboardingState when shouldSkipOnboarding returns Right',
        build: () async {
          when(mockShouldSkipOnboarding(NoParams()))
              .thenAnswer((_) async => Right(true));

          return OnboardingBloc(
            shouldSkipOnboarding: mockShouldSkipOnboarding,
            setOnBoardingStatus: mockSetOnBoardingStatus,
          );
        },
        act: (OnboardingBloc onBoardingBloc) async =>
            onBoardingBloc.add(OnboardingEvent.started()),
        expect: [OnboardingState.skipOnboardingState()],
      );
    },
  );

  group(
    'OnboardingEvent.finished',
    () {
      blocTest(
        'should emit OnboardingState.skipOnboardingState and trigger setOnboardingStatus UseCase',
        build: () async {
          when(mockSetOnBoardingStatus(
                  SetOnboardingStatusParams(onboardingStatus: true)))
              .thenAnswer((_) async => Right(Future.value(null)));

          return OnboardingBloc(
            shouldSkipOnboarding: mockShouldSkipOnboarding,
            setOnBoardingStatus: mockSetOnBoardingStatus,
          );
        },
        act: (OnboardingBloc onBoardingBloc) async =>
            onBoardingBloc.add(OnboardingEvent.finished()),
        verify: (_) async => {
          verify(mockSetOnBoardingStatus(
                  SetOnboardingStatusParams(onboardingStatus: true)))
              .called(1)
        },
        expect: [OnboardingState.skipOnboardingState()],
      );
    },
  );
}
