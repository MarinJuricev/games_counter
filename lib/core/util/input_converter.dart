import 'package:dartz/dartz.dart';
import 'package:game_counter/core/error/failure.dart';

const String REQUIRED_FIELDS_NOT_EMTPY = 'Required fields can\'t be empty';
const String POSITIVE_PROVIDED_NUMBER = 'Provided number\'s can\t be negative';
const String INVALID_NUMBER_PROVIDED = 'Invalid number provided';

class InputConverter {
  Either<Failure, int> stringToUnsignedInteger(String str) {
    try {
      if (str == null || str.isEmpty) {
        return Left(ValidationFailure(errorMessage: REQUIRED_FIELDS_NOT_EMTPY));
      }
      final integer = int.parse(str);
      if (integer < 0) {
        return Left(ValidationFailure(errorMessage: POSITIVE_PROVIDED_NUMBER));
      }
      return Right(integer);
    } on FormatException {
      return Left(ValidationFailure(errorMessage: INVALID_NUMBER_PROVIDED));
    }
  }
}
