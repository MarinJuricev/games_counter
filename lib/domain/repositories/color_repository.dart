import 'package:dartz/dartz.dart';

import '../../core/error/failure.dart';
import '../entities/app_colors.dart';

abstract class ColorRepository {
  Future<Either<Failure, AppColors>> getColor();
  Future<Either<Failure, void>> updateAppColors(AppColors appColors);
  Future<Either<Failure, AppColors>> resetAppColors();
}
