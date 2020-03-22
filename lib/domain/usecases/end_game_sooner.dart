import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../core/error/failure.dart';
import '../../core/usecase/base_usecase.dart';
import '../entities/game.dart';
import '../entities/player.dart';
import '../repositories/game_repository.dart';

class EndGameSooner implements BaseUseCase<Player, Params> {
  final GameRepository repository;

  EndGameSooner({@required this.repository});

  @override
  Future<Either<Failure, Player>> call(Params params) async {
    final currentGame = params.currentGame;
    int currentMaximumPoints = -1;
    Player gameWinner;

    //TODO Implement behavior when multiple players have the same points that the winner is playerA,playerB not just one winner
    for (var i = 0; i < currentGame.players.length; i++) {
      final player = currentGame.players[i];
      if (player.sumOfAllPoints > currentMaximumPoints) {
        currentMaximumPoints = player.sumOfAllPoints;
        gameWinner = player;
      }
    }

    currentGame.winner = gameWinner.name;
    await repository.saveGame(currentGame);

    return await Future<Either<Failure, Player>>.value(Right(gameWinner));
  }
}

class Params extends Equatable {
  final Game currentGame;

  Params({@required this.currentGame});

  @override
  List<Object> get props => [currentGame];
}
