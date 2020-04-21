import 'dart:ui';

import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../../core/error/failure.dart';
import '../../domain/repositories/color_repository.dart';
import '../datasources/color_local_data_source.dart';

class ColorRepositoryImpl implements ColorRepository {
  final ColorLocalDataSource colorLocalDataSource;

  ColorRepositoryImpl({@required this.colorLocalDataSource});
  //TODO maybe a remote also to set the theme for valentines day, st patric day?

  @override
  Future<Either<Failure, Color>> getColor() {
    return null;
  }

  @override
  Future<Either<Failure, void>> updateAccentColor(Color updatedAccentColor) {
    return null;
  }

  @override
  Future<Either<Failure, void>> updateBackGroundColor(
      Color updatedBackgroundColor) {
    return null;
  }

  @override
  Future<Either<Failure, void>> updateErrorColor(Color updatedErrorColor) {
    return null;
  }

  @override
  Future<Either<Failure, void>> updatePrimaryColor(Color updatedPrimaryColor) {
    return null;
  }
}
