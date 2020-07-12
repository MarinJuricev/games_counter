import 'package:dartz/dartz.dart';
import 'package:game_counter/core/error/failure.dart';

abstract class OnboardingRepository{
  Future<Either<Failure, bool>> getOnboardingStatus();
  Future<Either<Failure, void>> setOnboardingStatus(bool onBoardingStatus);
}