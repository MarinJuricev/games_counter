import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:game_counter/core/error/failure.dart';
import 'package:game_counter/core/usecase/base_usecase.dart';
import 'package:game_counter/domain/entities/game.dart';
import 'package:meta/meta.dart';

class CreateGame implements BaseUseCase<Game, Params> {
  @override
  Future<Either<Failure, Game>> call(Params params) async {
    return await _validateFields(
      params.gameTitle,
      params.numberOfPlayers,
      params.winningPoints,
    );
  }

  Future<Either<Failure, Game>> _validateFields(
    String gameTitle,
    int numberOfPlayers,
    int winningPoints,
  ) async {
    if (gameTitle.isEmpty ||
        numberOfPlayers.isNegative ||
        winningPoints.isNegative ||
        numberOfPlayers == 0 ||
        winningPoints == 0)
      return Future<Either<Failure, Game>>.value(Left(ValidationFailure()));

    // return Future<Either<Failure, Player>>.value(Right(ValidationFailure()))
  }
}

class Params extends Equatable {
  final String gameTitle;
  final int numberOfPlayers;
  final int winningPoints;

  Params({
    @required this.gameTitle,
    @required this.numberOfPlayers,
    @required this.winningPoints,
  });

  @override
  List<Object> get props => [gameTitle, numberOfPlayers, winningPoints];
}
