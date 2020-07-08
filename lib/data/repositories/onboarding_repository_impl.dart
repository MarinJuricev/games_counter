import 'package:dartz/dartz.dart';
import 'package:game_counter/core/error/failure.dart';
import 'package:game_counter/domain/repositories/onboarding_repository.dart';

class OnboardingRepositoryImpl implements OnboardingRepository {
  final OnboardingLocalDataSource onboardingLocalDataSource;

  @override
  Future<Either<Failure, bool>> getOnboardingStatus() {
    // TODO: implement getOnboardingStatus
    throw UnimplementedError();
  }

}