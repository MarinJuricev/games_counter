import 'package:dartz/dartz.dart';
import 'package:game_counter/core/error/exceptions.dart';
import 'package:game_counter/core/error/failure.dart';
import 'package:game_counter/data/datasources/game_local_data_source.dart';
import 'package:game_counter/domain/entities/game.dart';
import 'package:game_counter/domain/repositories/game_repository.dart';
import 'package:meta/meta.dart';

class GameRepositoryImpl implements GameRepository {
  final GameLocalDataSource gameLocalDataSource;

  GameRepositoryImpl({@required this.gameLocalDataSource});

  @override
  Future<Either<Failure, Game>> getGame() async {
    try{
      final localResult = await gameLocalDataSource.getGame();

    return Right(localResult);
    } on CacheException{
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, void>> saveGame(Game game) async {
    try {
      final localResult = await gameLocalDataSource.cacheGame(game);

      return Right(localResult);
    } on CacheException {
      return Left(CacheFailure());
    }
  }
}
