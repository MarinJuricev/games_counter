import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:game_counter/core/error/failure.dart';
import 'package:game_counter/core/usecase/base_usecase.dart';
import 'package:game_counter/domain/repositories/onboarding_repository.dart';

class SetOnBoardingStatus
    implements BaseUseCase<void, SetOnboardingStatusParams> {
  final OnboardingRepository repository;

  SetOnBoardingStatus({@required this.repository});

  @override
  Future<Either<Failure, void>> call(SetOnboardingStatusParams params) {
    return repository.setOnboardingStatus(params.onboardingStatus);
  }
}

class SetOnboardingStatusParams extends Equatable {
  final bool onboardingStatus;

  SetOnboardingStatusParams({@required this.onboardingStatus});

  @override
  List<Object> get props => [onboardingStatus];
}
