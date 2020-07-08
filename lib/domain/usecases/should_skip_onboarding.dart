import 'package:flutter/foundation.dart';
import 'package:game_counter/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:game_counter/core/usecase/base_usecase.dart';
import 'package:game_counter/domain/repositories/onboarding_repository.dart';

class ShouldSkipOnboarding implements BaseUseCase<bool, NoParams> {
  final OnboardingRepository repository;

  ShouldSkipOnboarding({@required this.repository});

  @override
  Future<Either<Failure, bool>> call(NoParams params) {
    return repository.getOnboardingStatus();
  }
}
