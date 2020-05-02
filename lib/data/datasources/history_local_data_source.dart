import 'package:meta/meta.dart';

import '../../domain/entities/game.dart';
import 'local_persistence_provider.dart';

abstract class HistoryLocalDataSource {
  Future<List<Game>> getRecentSearches();
  Future<void> deleteRecentGame();
}

class HistoryLocalDataSourceImpl implements HistoryLocalDataSource {
  final LocalPersistenceProvider localPersistenceProvider;

  HistoryLocalDataSourceImpl({@required this.localPersistenceProvider});

  @override
  Future<void> deleteRecentGame() {
    return null;
  }

  @override
  Future<List<Game>> getRecentSearches() {
    return null;
  }
}
