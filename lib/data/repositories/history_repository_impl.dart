import 'package:dartz/dartz.dart';

import '../../core/error/failure.dart';
import '../../domain/entities/game.dart';
import '../../domain/repositories/history_repository.dart';

class HistoryRepositoryImpl implements HistoryRepository {

  final 

  @override
  Future<Either<Failure, List<Game>>> deleteRecentGame(Game gameToDelete) {
    return null;
  }

  @override
  Future<Either<Failure, List<Game>>> getRecentSearches() {
    return null;
  }
  
}
