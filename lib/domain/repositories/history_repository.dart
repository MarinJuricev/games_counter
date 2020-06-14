import 'package:dartz/dartz.dart';

import '../../core/error/failure.dart';
import '../entities/game.dart';

abstract class HistoryRepository {
  Future<Either<Failure, List<String>>> getRecentQueries();
  Future<Either<Failure, List<Game>>> getMatchesByQuery(String gameName);
  Future<Either<Failure, void>> saveGameIntoHistory(Game gameToSave);
  Future<Either<Failure, void>> saveQuery(String query);
  Future<Either<Failure, void>> deleteQuery(int positionToDelete);
}
