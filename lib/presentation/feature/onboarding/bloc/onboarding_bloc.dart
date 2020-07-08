import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:game_counter/domain/usecases/should_skip_onboarding.dart';
import 'package:meta/meta.dart';
import 'package:flutter/foundation.dart';

part 'onboarding_bloc.freezed.dart';
part 'onboarding_event.dart';
part 'onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  final ShouldSkipOnboarding shouldSkipOnboarding;

  OnboardingBloc({@required this.shouldSkipOnboarding})
      : super(OnboardingState.initialState());

  @override
  Stream<OnboardingState> mapEventToState(
    OnboardingEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
