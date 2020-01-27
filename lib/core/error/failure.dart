import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class Failure extends Equatable {
  String errorMessage;

  @override
  List<Object> get props => [];
}

class ValidationFailure extends Failure {
  final String errorMessage;

  ValidationFailure({@required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
