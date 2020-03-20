import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../core/error/failure.dart';
import '../../core/usecase/base_usecase.dart';
import '../entities/game.dart';
import '../entities/player.dart';
import '../repositories/game_repository.dart';

class DeletePlayer implements BaseUseCase<Game, Params> {
  final GameRepository repository;

  DeletePlayer({@required this.repository});

  @override
  Future<Either<Failure, Game>> call(Params params) async {
    final currentGame = params.currentGame;
    final playerToDelete = params.playerToDelete;

    int currentPlayerIndex =
        currentGame.players.indexWhere((player) => player == playerToDelete);

    // If index is greater than 0 we found the index, else return a error
    if (currentPlayerIndex >= 0) {
      currentGame.players.removeAt(currentPlayerIndex);
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
  final Player playerToDelete;

  Params({
    @required this.currentGame,
    @required this.playerToDelete,
    Player currentPlayer,
  });

  @override
  List<Object> get props => [currentGame, playerToDelete];
}
