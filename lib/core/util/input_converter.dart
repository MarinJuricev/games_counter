import 'package:dartz/dartz.dart';

import '../constants/budget_constants.dart';
import '../error/failure.dart';

class InputConverter {
  Either<Failure, int> stringToUnsignedInteger(String str) {
    try {
      if (str == null || str.isEmpty) {
        return Left(ValidationFailure(REQUIRED_FIELDS_NOT_EMTPY));
      }
      final integer = int.parse(str);
      if (integer < 0) {
        return Left(ValidationFailure(POSITIVE_PROVIDED_NUMBER));
      }
      return Right(integer);
    } on FormatException {
      return Left(ValidationFailure(INVALID_NUMBER_PROVIDED));
    }
  }
}
