import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:game_counter/core/usecase/base_usecase.dart';
import 'package:game_counter/domain/usecases/set_onboarding_status.dart';
import 'package:game_counter/domain/usecases/should_skip_onboarding.dart';
import 'package:meta/meta.dart';
import 'package:flutter/foundation.dart';

part 'onboarding_bloc.freezed.dart';
part 'onboarding_event.dart';
part 'onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  final ShouldSkipOnboarding shouldSkipOnboarding;
  final SetOnBoardingStatus setOnBoardingStatus;

  OnboardingBloc({
    @required this.shouldSkipOnboarding,
    @required this.setOnBoardingStatus,
  }) : super(OnboardingState.initialState());

  @override
  Stream<OnboardingState> mapEventToState(
    OnboardingEvent event,
  ) async* {
    yield* event.when(
      started: () => _handleOnboardingStarted(),
      finished: () => _handleOnboardingFinished(),
    );
  }

  Stream<OnboardingState> _handleOnboardingStarted() async* {
    final shouldSkip = await shouldSkipOnboarding(NoParams());

    yield shouldSkip.fold(
      (error) => OnboardingState.startOnboardingState(),
      (value) => OnboardingState.skipOnboardingState(),
    );
  }

  Stream<OnboardingState> _handleOnboardingFinished() async* {
    await setOnBoardingStatus(
        SetOnboardingStatusParams(onboardingStatus: true));
    yield OnboardingState.skipOnboardingState();
  }
}
