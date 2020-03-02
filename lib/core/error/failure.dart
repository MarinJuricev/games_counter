import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class Failure extends Equatable {
  final String message;

  Failure({@required this.message});

  @override
  List<Object> get props => [message];
}

class ValidationFailure extends Failure {
  ValidationFailure(String errorMessage) : super(message: errorMessage);
}

class PlayerAlreadyExistsFailure extends Failure {
  PlayerAlreadyExistsFailure(String errorMessage)
      : super(message: errorMessage);
}

class PointsToHighFailure extends Failure {
  PointsToHighFailure(String errorMessage) : super(message: errorMessage);
}

class CantAddMorePlayersFailure extends Failure {
  CantAddMorePlayersFailure(String errorMessage) : super(message: errorMessage);
}

class CacheFailure extends Failure {
  CacheFailure(String errorMessage) : super(message: errorMessage);
}

class UpdateGameFailure extends Failure {
  UpdateGameFailure(String errorMessage) : super(message: errorMessage);
}
