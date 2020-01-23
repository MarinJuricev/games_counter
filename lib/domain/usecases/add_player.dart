import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../core/error/failure.dart';
import '../../core/usecase/base_usecase.dart';
import '../entities/game.dart';

class AddPlayer implements BaseUseCase<Game, Params> {
  @override
  Future<Either<Failure, Game>> call(Params params) async {
    return await _validateFields(params.playerName);
  }

  Either<Failure, Game> _validateFields(String playerName) {
    if (playerName.isEmpty) return (Left(ValidationFailure()));
  }
}

class Params extends Equatable {
  final String playerName;

  Params({@required this.playerName});

  @override
  List<Object> get props => [playerName];
}
