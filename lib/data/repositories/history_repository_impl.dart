import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../../core/error/failure.dart';
import '../../domain/entities/game.dart';
import '../../domain/repositories/history_repository.dart';
import '../datasources/history_local_data_source.dart';

class HistoryRepositoryImpl implements HistoryRepository {
  final HistoryLocalDataSource historyLocalDataSource;

  HistoryRepositoryImpl({@required this.historyLocalDataSource});

  @override
  Future<Either<Failure, List<Game>>> deleteRecentGame(Game gameToDelete) {
    return null;
  }

  @override
  Future<Either<Failure, List<Game>>> getRecentSearches() {
    return null;
  }

  @override
  Future<Either<Failure, void>> saveGameIntoHistory(Game gameToSave) {
    // TODO: implement saveGameIntoHistory
    return null;
  }
}
