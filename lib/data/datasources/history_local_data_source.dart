import '../../domain/entities/game.dart';

abstract class HistoryLocalDataSource {
  Future<List<Game>> getRecentSearches();
  Future<void> deleteRecentGame();
}

class HistoryLocalDataSourceImpl implements HistoryLocalDataSource {
  @override
  Future<void> deleteRecentGame() {
    return null;
  }

  @override
  Future<List<Game>> getRecentSearches() {
    return null;
  }
}
