import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../../core/constants/budget_constants.dart';
import '../../core/error/exceptions.dart';
import '../../core/error/failure.dart';
import '../../domain/entities/game.dart';
import '../../domain/repositories/game_repository.dart';
import '../datasources/game_local_data_source.dart';

class GameRepositoryImpl implements GameRepository {
  final GameLocalDataSource gameLocalDataSource;

  GameRepositoryImpl({@required this.gameLocalDataSource});

  @override
  Future<Either<Failure, Game>> getGame() async {
    try{
      final localResult = await gameLocalDataSource.getGame();

    return Right(localResult);
    } on CacheException{
      return Left(CacheFailure(ERROR_RETREVING_LOCAL_DATA));
    }
  }

  @override
  Future<Either<Failure, void>> saveGame(Game game) async {
    try {
      final localResult = await gameLocalDataSource.cacheGame(game);

      return Right(localResult);
    } on CacheException {
      return Left(CacheFailure(ERROR_RETREVING_LOCAL_DATA));
    }
  }
}
