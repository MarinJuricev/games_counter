import 'package:meta/meta.dart';

import '../../core/error/exceptions.dart';
import '../../domain/entities/game.dart';
import 'local_persistence_provider.dart';

abstract class GameLocalDataSource {
  Future<Game> getGame();
  Future<void> cacheGame(Game game);
}

const CURRENT_GAME_BOX = 'CURRENT_GAME_BOX';

class GameLocalDataSourceImpl implements GameLocalDataSource {
  final LocalPersistenceProvider localPersistenceProvider;

  Game currentGame;

  GameLocalDataSourceImpl({@required this.localPersistenceProvider});

  @override
  Future<Game> getGame() async {
    final gameToReturn = await Future<Game>.value(currentGame);

    if (gameToReturn != null)
      return gameToReturn;
    else
      throw CacheException();
  }

  @override
  Future<void> cacheGame(Game game) async {
    currentGame = game;
    return await Future<Game>.value();
  }
}
