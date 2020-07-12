import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

import '../../core/constants/budget_constants.dart';
import '../../core/error/failure.dart';
import '../../domain/repositories/onboarding_repository.dart';
import '../datasources/onboarding_local_data_source.dart';

class OnboardingRepositoryImpl implements OnboardingRepository {
  final OnboardingLocalDataSource onboardingLocalDataSource;

  OnboardingRepositoryImpl({@required this.onboardingLocalDataSource});

  @override
  Future<Either<Failure, bool>> getOnboardingStatus() async {
    final localResult = await onboardingLocalDataSource.getOnboardingStatus();

    if(localResult){
      return Right(localResult);
    }
      return Left(CacheFailure(ERROR_RETREVING_LOCAL_DATA));
  }

  @override
  Future<Either<Failure, void>> setOnboardingStatus(bool onBoardingStatus) async {
    final localResult = await onboardingLocalDataSource.setOnboardingStatus(onBoardingStatus);
    return Right(localResult);
  }
}
