import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../core/error/failure.dart';
import '../../core/usecase/base_usecase.dart';
import '../entities/game.dart';
import '../entities/player.dart';
import '../repositories/game_repository.dart';

class DeletePlayer implements BaseUseCase<Game, DeletePlayerParams> {
  final GameRepository repository;

  DeletePlayer({@required this.repository});

  @override
  Future<Either<Failure, Game>> call(DeletePlayerParams params) async {
    // Copies the object by value, if we don't do this for some reason the bloc doesn't
    // detect a change ( possiblity it say's it's the same object and refuses to re-render)
    final currentGame = Game.clone(params.currentGame);
    final playerToDelete = params.playerToDelete;

    int currentPlayerIndex =
        currentGame.players.indexWhere((player) => player == playerToDelete);

    // If index is greater than 0 we found the index, else return a error
    if (currentPlayerIndex >= 0) {
      currentGame.players.removeAt(currentPlayerIndex);
      await repository.saveGame(currentGame);

      print('test');

      return await Future<Either<Failure, Game>>.value(Right(currentGame));
    } else {
      return await Future<Either<Failure, Game>>.value(
          Left(NotImplementedFailure()));
      //TODO 2.0 when we implement the backend for potential errors
    }
  }
}

class DeletePlayerParams extends Equatable {
  final Game currentGame;
  final Player playerToDelete;

  DeletePlayerParams({
    @required this.currentGame,
    @required this.playerToDelete,
  });

  @override
  List<Object> get props => [currentGame, playerToDelete];
}
