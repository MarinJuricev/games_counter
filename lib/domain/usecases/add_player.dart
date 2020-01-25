import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../core/error/failure.dart';
import '../../core/usecase/base_usecase.dart';
import '../entities/player.dart';

class AddPlayer implements BaseUseCase<Player, Params> {
  @override
  Future<Either<Failure, Player>> call(Params params) async {
    return await _validateFields(params.playerName);
  }

  Future<Either<Failure, Player>> _validateFields(String playerName) async{
    if (playerName.isEmpty) return Future<Either<Failure, Player>>.value(Left(ValidationFailure()));

    // return Future<Either<Failure, Player>>.value(Right(ValidationFailure()))
  }
}

class Params extends Equatable {
  final String playerName;

  Params({@required this.playerName});

  @override
  List<Object> get props => [playerName];
}
