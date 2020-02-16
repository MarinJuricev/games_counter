import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  @override
  List<Object> get props => [];
}

class ValidationFailure extends Failure {}
class PlayerAlreadyExistsFailure extends Failure {}
class PointsToHighFailure extends Failure {}
class CantAddMorePlayersFailure extends Failure {}
class CacheFailure extends Failure {}
