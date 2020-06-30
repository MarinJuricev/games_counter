part of 'onboarding_bloc.dart';

@freezed
abstract class OnboardingEvent with _$OnboardingEvent {
  factory OnboardingEvent.finished() = _OnOnboardingFinished;
}
