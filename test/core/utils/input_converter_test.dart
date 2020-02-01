import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:game_counter/core/error/failure.dart';
import 'package:game_counter/core/util/input_converter.dart';

void main() {
  InputConverter inputConverter;

  setUp(
    () {
      inputConverter = InputConverter();
    },
  );

  group(
    'stringToUnsignedInt',
    () {
      test(
        'should return an integer when the string represents an unsigned integer',
        () async {
          final str = '123';

          final result = inputConverter.stringToUnsignedInteger(str);

          expect(result, Right(123));
        },
      );

      test(
        'should return a Failure when the string is not a integer',
        () async {
          final str = 'abc';

          final result = inputConverter.stringToUnsignedInteger(str);

          expect(result, Left(ValidationFailure()));
        },
      );

      test(
        'should return a Failure when the string is a negative integer',
        () async {
          final str = '-123';

          final result = inputConverter.stringToUnsignedInteger(str);

          expect(result, Left(ValidationFailure()));
        },
      );

      test('should return a Failure when the provided string is null', () {
        final str = null;

          final result = inputConverter.stringToUnsignedInteger(str);

          expect(result, Left(ValidationFailure()));
      });

      test('should return a Failure when the provided string is empty', () {
        final str = '';

          final result = inputConverter.stringToUnsignedInteger(str);

          expect(result, Left(ValidationFailure()));
      });
    },
  );
}
