import 'package:game_counter/core/error/exceptions.dart';
import 'package:game_counter/domain/entities/game.dart';


abstract class GameLocalDataSource {
  Future<Game> getGame();
  Future<void> cacheGame(Game game);
}

// TODO for now everything will be kept in memory, local persistance will be added later
class GameLocalDataSourceImpl implements GameLocalDataSource {
  Game currentGame;

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
