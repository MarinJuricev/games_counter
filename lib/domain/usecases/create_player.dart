import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:game_counter/domain/repositories/game_repository.dart';
import 'package:meta/meta.dart';

import '../../core/error/failure.dart';
import '../../core/usecase/base_usecase.dart';
import '../entities/game.dart';
import '../entities/player.dart';

class CreatePlayer implements BaseUseCase<Game, Params> {
  final GameRepository repository;

  CreatePlayer({@required this.repository});

  @override
  Future<Either<Failure, Game>> call(Params params) async {
    final newPlayer = Player(
      name: params.playerName,
      points: params.points,
      bonusPoints: params.bonusPoints,
    );
    final currentGame = params.currentGame;

    final playerAlreadyExists = currentGame.players.firstWhere(
        (itemToCheck) => itemToCheck.name == newPlayer.name,
        orElse: () => null);

    if (playerAlreadyExists != null) {
      return await Future<Either<Failure, Game>>.value(
          Left(PlayerAlreadyExistsFailure()));
    }

    currentGame.players.add(newPlayer);
    await repository.saveGame(currentGame);
    return await Future<Either<Failure, Game>>.value(Right(currentGame));
  }
}

class Params extends Equatable {
  final String playerName;
  final int points;
  final int bonusPoints;
  final Game currentGame;

  Params({
    @required this.playerName,
    @required this.points,
    @required this.bonusPoints,
    @required this.currentGame,
  });

  @override
  List<Object> get props => [
        playerName,
        points,
        bonusPoints,
        currentGame,
      ];
}
