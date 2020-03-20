import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../core/error/failure.dart';
import '../../core/usecase/base_usecase.dart';
import '../entities/game.dart';
import '../entities/player.dart';
import '../repositories/game_repository.dart';

class UpdateGame implements BaseUseCase<Game, Params> {
  final GameRepository repository;

  UpdateGame({@required this.repository});

  @override
  Future<Either<Failure, Game>> call(Params params) async {
    final currentGame = params.currentGame;
    final currentPlayer = params.currentPlayer;
    final newPoints = params.newPoints;
    final newBonusPoints = params.newBonusPoints;

    if (currentGame.players.contains(currentPlayer)) {
      final currentPlayerPosition = currentGame.players.indexOf(currentPlayer);

      final updatedPlayer = Player(
          name: currentPlayer.name,
          points: currentPlayer.points + newPoints,
          bonusPoints: currentPlayer.bonusPoints + newBonusPoints);

      currentGame.players[currentPlayerPosition] = updatedPlayer;

      if (updatedPlayer.sumOfAllPoints >= currentGame.pointsToWin) {
        currentGame.winner = updatedPlayer.name;
      }

      await repository.saveGame(currentGame);

      return await Future<Either<Failure, Game>>.value(Right(currentGame));
    } else {
      return await Future<Either<Failure, Game>>.value(
          Left(NotImplementedFailure()));
      //TODO 2.0 when we implement the backend for potential errors
    }
  }
}

class Params extends Equatable {
  final Game currentGame;
  final Player currentPlayer;
  final int newPoints;
  final int newBonusPoints;

  Params({
    @required this.currentGame,
    @required this.currentPlayer,
    @required this.newPoints,
    @required this.newBonusPoints,
  });

  @override
  List<Object> get props =>
      [currentGame, currentPlayer, newPoints, newBonusPoints];
}
