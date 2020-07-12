part of 'onboarding_bloc.dart';

@freezed
abstract class OnboardingState with _$OnboardingState {
  factory OnboardingState.initialState() = _OnOnboardingInitialState;
  factory OnboardingState.skipOnboardingState() = _OnOnboardingSkipState;
  factory OnboardingState.startOnboardingState() = _OnOnboardingStartState;
}