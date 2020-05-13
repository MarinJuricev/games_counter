import 'package:meta/meta.dart';

import '../../core/error/exceptions.dart';
import '../../domain/entities/game.dart';
import '../models/local_game.dart';
import 'local_persistence_provider.dart';

abstract class HistoryLocalDataSource {
  Future<List<Game>> getRecentSearches();
  Future<List<Game>> getMatchesByQuery(String query);
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

  @override
  Future<List<Game>> getMatchesByQuery(String query) async {
    final allGames = await localPersistenceProvider.getAllFromPersistence(
        boxToGetDataFrom: HISTORY_BOX) as List<LocalGame>;

    if (allGames != null) {
      final filteredGames =
          allGames.where((element) => element.name.startsWith(query)).toList();

      final mappedGames =
          filteredGames.map((localGame) => localGame.toGame()).toList();

      return Future.value(mappedGames);
    } else {
      throw CacheException();
    }
  }
}
