import 'package:dartz/dartz.dart';

extension UnwrapEither<L, R> on Either<L, R> {
  dynamic unwrapResult() => this.fold(
        (failure) => failure,
        (success) => success,
      );
}
