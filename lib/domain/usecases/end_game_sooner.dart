import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../core/error/failure.dart';
import '../../core/usecase/base_usecase.dart';
import '../entities/game.dart';
import '../entities/player.dart';
import '../repositories/game_repository.dart';

class EndGameSooner implements BaseUseCase<Player, EndGameSoonerParams> {
  final GameRepository repository;

  EndGameSooner({@required this.repository});

  @override
  Future<Either<Failure, Player>> call(EndGameSoonerParams params) async {
    final currentGame = params.currentGame;
    int currentMaximumPoints = -1;
    Player gameWinner;

    for (var i = 0; i < currentGame.players.length; i++) {
      final player = currentGame.players[i];
      if (player.sumOfAllPoints > currentMaximumPoints) {
        currentMaximumPoints = player.sumOfAllPoints;
        gameWinner = player;
      }
    }

    final updatedGame = currentGame.copyWith(winner: gameWinner.name);
    await repository.saveGame(updatedGame);

    return await Future<Either<Failure, Player>>.value(Right(gameWinner));
  }
}

class EndGameSoonerParams extends Equatable {
  final Game currentGame;

  EndGameSoonerParams({@required this.currentGame});

  @override
  List<Object> get props => [currentGame];
}
