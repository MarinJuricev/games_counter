import 'package:dartz/dartz.dart';

import '../../core/error/failure.dart';
import '../entities/game.dart';

abstract class HistoryRepository {
  Future<Either<Failure, List<Game>>> getRecentSearches();
  Future<Either<Failure, List<Game>>> deleteRecentGame(Game gameToDelete);
  Future<Either<Failure, void>> saveGameIntoHistory(Game gameToSave);
}
