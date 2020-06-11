import 'package:meta/meta.dart';

import '../../core/error/exceptions.dart';
import '../../domain/entities/game.dart';
import '../models/local_game.dart';
import 'local_persistence_provider.dart';

abstract class HistoryLocalDataSource {
  Future<List<String>> getRecentQueries();
  Future<List<Game>> getMatchesByQuery(String query);
  Future<void> deleteRecentGame();
  Future<void> saveGame(LocalGame gameToSave);
  Future<void> saveQuery(String query);
}

const HISTORY_BOX = 'HISTORY_BOX';
const HISTORY_QUERY_BOX = 'HISTORY_QUERY_BOX';

class HistoryLocalDataSourceImpl implements HistoryLocalDataSource {
  final LocalPersistenceProvider localPersistenceProvider;

  HistoryLocalDataSourceImpl({@required this.localPersistenceProvider});

  @override
  Future<void> deleteRecentGame() {
    return null;
  }

  @override
  Future<List<String>> getRecentQueries() async {
    final allQueries = await localPersistenceProvider.getAllFromPersistence(
        boxToGetDataFrom: HISTORY_QUERY_BOX);

    if (allQueries != null) {
      final List<String> convertedList = List<String>.from(allQueries);
      return Future.value(convertedList);
    } else {
      throw CacheException();
    }
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
  Future<void> saveQuery(String query) async {
    // Avoid duplicate queries
    final previousQueries = await getRecentQueries();
    final lowerCaseQuery = query.toLowerCase();
    // It shouldn't be case sensitive
    if (previousQueries
        .map((item) => item.toLowerCase())
        .contains(lowerCaseQuery)) {
      return Future<void>.value();
    }

    final positionInBox = await localPersistenceProvider.saveIntoPersistence(
      boxToSaveInto: HISTORY_QUERY_BOX,
      valueToSave: query,
    );

    if (positionInBox > 0)
      return Future<void>.value();
    else
      throw CacheException();
  }

  @override
  Future<List<Game>> getMatchesByQuery(String query) async {
    final allGames = await localPersistenceProvider.getAllFromPersistence(
        boxToGetDataFrom: HISTORY_BOX);

    if (allGames != null) {
      final List<LocalGame> convertedList = List<LocalGame>.from(allGames);
      final List<LocalGame> filteredGames = convertedList
          .where((LocalGame element) =>
              element.name.toLowerCase().startsWith(query.toLowerCase()))
          .toList();

      final List<Game> mappedGames = filteredGames
          .map((LocalGame localGame) => localGame.toGame())
          .toList();

      return Future.value(mappedGames);
    } else {
      throw CacheException();
    }
  }
}
