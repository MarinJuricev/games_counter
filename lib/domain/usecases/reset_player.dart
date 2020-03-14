import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:game_counter/core/error/failure.dart';

import '../../core/usecase/base_usecase.dart';
import '../entities/game.dart';
import '../entities/player.dart';
import '../repositories/game_repository.dart';
import 'package:meta/meta.dart';

class ResetPlayer implements BaseUseCase<Game, Params> {
  final GameRepository repository;

  ResetPlayer({@required this.repository});

  @override
  Future<Either<Failure, Game>> call(params) async {
    return await _resetPlayer(params.currentGame, params.currentPlayer);
  }

  Future<Either<Failure, Game>> _resetPlayer(
      Game currentGame, Player currentPlayer) async {
    if (currentGame.players.contains(currentPlayer)) {
      final currentPlayerPosition = currentGame.players.indexOf(currentPlayer);

      final updatedPlayer = Player(
        name: currentPlayer.name,
        points: 0,
        bonusPoints: 0,
      );

      currentGame.players[currentPlayerPosition] = updatedPlayer;

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

  Params({
    @required this.currentGame,
    @required this.currentPlayer,
  });

  @override
  List<Object> get props => [currentGame, currentPlayer];
}
