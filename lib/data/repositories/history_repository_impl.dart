import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../../core/constants/budget_constants.dart';
import '../../core/error/exceptions.dart';
import '../../core/error/failure.dart';
import '../../domain/entities/game.dart';
import '../../domain/repositories/history_repository.dart';
import '../datasources/history_local_data_source.dart';
import '../models/local_game.dart';

class HistoryRepositoryImpl implements HistoryRepository {
  final HistoryLocalDataSource historyLocalDataSource;

  HistoryRepositoryImpl({@required this.historyLocalDataSource});

  @override
  Future<Either<Failure, List<Game>>> deleteRecentGame(Game gameToDelete) {
    return null;
  }

  @override
  Future<Either<Failure, List<String>>> getRecentQueries() async {
    try {
      final localResult = await historyLocalDataSource.getRecentQueries();

      return Right(localResult);
    } on CacheException {
      return Left(CacheFailure(ERROR_RETREVING_LOCAL_DATA));
    }
  }

  @override
  Future<Either<Failure, List<Game>>> getMatchesByQuery(String gameName) async {
    try {
      final localResult =
          await historyLocalDataSource.getMatchesByQuery(gameName);

      return Right(localResult);
    } on CacheException {
      return Left(CacheFailure(ERROR_RETREVING_LOCAL_DATA));
    }
  }

  @override
  Future<Either<Failure, void>> saveGameIntoHistory(Game gameToSave) async {
    try {
      final localResult =
          await historyLocalDataSource.saveGame(gameToSave.toLocal());

      return Right(localResult);
    } on CacheException {
      return Left(CacheFailure(ERROR_RETREVING_LOCAL_DATA));
    }
  }

  @override
  Future<Either<Failure, void>> saveQuery(String query) async {
    try {
      final localResult = await historyLocalDataSource.saveQuery(query);

      return Right(localResult);
    } on CacheException {
      return Left(CacheFailure(ERROR_RETREVING_LOCAL_DATA));
    }
  }
}
