import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../core/error/failure.dart';
import '../../core/usecase/base_usecase.dart';
import '../entities/player.dart';

class CreatePlayer implements BaseUseCase<Player, Params> {
  @override
  Future<Either<Failure, Player>> call(Params params) async {
    return await _createPlayer(
        params.playerName, params.points, params.bonusPoints);
  }

  Future<Either<Failure, Player>> _createPlayer(
      String playerName, int points, int bonusPoints) async {
    final player = Player(
      name: playerName,
      points: points,
      bonusPoints: bonusPoints,
    );

    return await Future<Either<Failure, Player>>.value(
        Right(player));
  }
}

class Params extends Equatable {
  final String playerName;
  final int points;
  final int bonusPoints;

  Params({
    @required this.playerName,
    @required this.points,
    @required this.bonusPoints,
  });

  @override
  List<Object> get props => [playerName, points, bonusPoints];
}
