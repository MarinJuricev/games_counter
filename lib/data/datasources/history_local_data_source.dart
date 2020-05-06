import 'package:game_counter/core/error/exceptions.dart';
import 'package:game_counter/data/models/local_game.dart';
import 'package:meta/meta.dart';

import '../../domain/entities/game.dart';
import 'local_persistence_provider.dart';

abstract class HistoryLocalDataSource {
  Future<List<Game>> getRecentSearches();
  Future<void> deleteRecentGame();
  Future<void> saveGame(LocalGame gameToSave);
}

const HISTORY_BOX = 'HISTORY_BOX';

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

  @override
  Future<void> saveGame(LocalGame gameToSave) async {
    final positionInBox = await localPersistenceProvider.saveIntoPersistence(
      boxToSaveInto: HISTORY_BOX,
      valueToSave: gameToSave,
    );

    if (positionInBox > 0)
      return Future<void>.value();
    else
      throw CacheException();
  }
}
