import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../../core/constants/budget_constants.dart';
import '../../core/error/exceptions.dart';
import '../../core/error/failure.dart';
import '../../domain/entities/app_colors.dart';
import '../../domain/repositories/color_repository.dart';
import '../datasources/color_local_data_source.dart';
import '../models/local_app_colors.dart';

class ColorRepositoryImpl implements ColorRepository {
  //TODO maybe a remote also to set the theme for valentines day, st patric day?
  final ColorLocalDataSource colorLocalDataSource;

  ColorRepositoryImpl({@required this.colorLocalDataSource});

  @override
  Future<Either<Failure, AppColors>> getColor() async {
    try {
      final localResult = await colorLocalDataSource.getAppColors();

      return Right(localResult);
    } on CacheException {
      return Left(CacheFailure(ERROR_RETREVING_LOCAL_DATA));
    }
  }

  @override
  Future<Either<Failure, void>> updateAppColors(AppColors appColors) async {
    try {
      final localResult =
          await colorLocalDataSource.cacheAppColors(appColors.toLocal());

      return Right(localResult);
    } on CacheException {
      return Left(CacheFailure(ERROR_RETREVING_LOCAL_DATA));
    }
  }
}
