import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:game_counter/core/error/failure.dart';
import 'package:game_counter/core/usecase/base_usecase.dart';
import 'package:game_counter/domain/entities/game.dart';
import 'package:game_counter/domain/repositories/game_repository.dart';
import 'package:meta/meta.dart';

class EndGameSooner implements BaseUseCase<String, Params> {
  final GameRepository repository;

  EndGameSooner({@required this.repository});

  @override
  Future<Either<Failure, String>> call(Params params) async {
    final currentGame = params.currentGame;
    int currentMaximumPoints = -1;
    String gameWinner = '';

    for (var i = 0; i < currentGame.players.length; i++) {
      final player = currentGame.players[i];
      if (player.sumOfAllPoints > currentMaximumPoints) {
        currentMaximumPoints = player.sumOfAllPoints;
        gameWinner = player.name;
      }
    }

    currentGame.winner = gameWinner;
    await repository.saveGame(currentGame);
    
    return await Future<Either<Failure, String>>.value(Right(gameWinner));
  }
}

class Params extends Equatable {
  final Game currentGame;

  Params({@required this.currentGame});

  @override
  List<Object> get props => [currentGame];
}
