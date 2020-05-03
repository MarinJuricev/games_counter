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

class DeletePlayer implements BaseUseCase<Game, DeletePlayerParams> {
  final GameRepository repository;

  DeletePlayer({@required this.repository});

  @override
  Future<Either<Failure, Game>> call(DeletePlayerParams params) async {
    final playerToDelete = params.playerToDelete;

    final currentGameEither = await repository.getGame();
    final currentGameResult = currentGameEither.unwrapResult();

    if (currentGameResult is Game) {
      int currentPlayerIndex = currentGameResult.players
          .indexWhere((player) => player == playerToDelete);

      // If index is greater than 0 we found the index, else return a error
      if (currentPlayerIndex >= 0) {
        currentGameResult.players.removeAt(currentPlayerIndex);
        await repository.saveGame(currentGameResult);

        print('test');

        return await Future<Either<Failure, Game>>.value(
            Right(currentGameResult));
      } else {
        return await Future<Either<Failure, Game>>.value(
            Left(NotImplementedFailure()));
        //TODO 2.0 when we implement the backend for potential errors
      }
    } else {
      return await Future<Either<Failure, Game>>.value(
          Left(CacheFailure((ERROR_RETREVING_LOCAL_DATA))));
    }
  }
}

class DeletePlayerParams extends Equatable {
  final Player playerToDelete;

  DeletePlayerParams({
    @required this.playerToDelete,
  });

  @override
  List<Object> get props => [playerToDelete];
}
