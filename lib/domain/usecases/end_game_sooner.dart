import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../core/constants/budget_constants.dart';
import '../../core/error/failure.dart';
import '../../core/extensions/extensions.dart';
import '../../core/usecase/base_usecase.dart';
import '../entities/game.dart';
import '../entities/player.dart';
import '../repositories/game_repository.dart';

class EndGameSooner implements BaseUseCase<Player, EndGameSoonerParams> {
  final GameRepository repository;

  EndGameSooner({@required this.repository});

  @override
  Future<Either<Failure, Player>> call(EndGameSoonerParams params) async {
    final currentGameEither = await repository.getGame();
    final currentGameResult = currentGameEither.unwrapResult();

    if (currentGameResult is Game) {
      int currentMaximumPoints = -1;
      Player gameWinner;

      for (var i = 0; i < currentGameResult.players.length; i++) {
        final player = currentGameResult.players[i];
        if (player.sumOfAllPoints > currentMaximumPoints) {
          currentMaximumPoints = player.sumOfAllPoints;
          gameWinner = player;
        }
      }

      final updatedGame = currentGameResult.copyWith(winner: gameWinner.name);
      await repository.saveGame(updatedGame);

      return await Future<Either<Failure, Player>>.value(Right(gameWinner));
    } else {
      return await Future<Either<Failure, Player>>.value(
          Left(CacheFailure((ERROR_RETREVING_LOCAL_DATA))));
    }
  }
}

class EndGameSoonerParams extends Equatable {
  List<Object> get props => [];
}
