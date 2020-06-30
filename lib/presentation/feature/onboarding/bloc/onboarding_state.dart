part of 'onboarding_bloc.dart';

@freezed
abstract class OnboardingState with _$OnboardingState {
  factory OnboardingState.initialState() = _OnOnboardingInitialState;
  factory OnboardingState.skipState() = _OnOnboardingSkipState;
  factory OnboardingState.startState() = _OnOnboardingStartState;
}