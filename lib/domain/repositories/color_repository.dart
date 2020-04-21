import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:game_counter/core/error/failure.dart';

abstract class ColorRepository {
  Future<Either<Failure, Color>> getColor();
  Future<Either<Failure, void>> updateBackGroundColor(
      Color updatedBackgroundColor);
  Future<Either<Failure, void>> updateAccentColor(Color updatedAccentColor);
  Future<Either<Failure, void>> updateErrorColor(Color updatedErrorColor);
  Future<Either<Failure, void>> updatePrimaryColor(Color updatedPrimaryColor);
}
