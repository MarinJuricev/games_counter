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
    return await Future<Game>.value(currentGame);
  }

  @override
  Future<void> cacheGame(Game game) async {
    currentGame = game;
    return await Future<Game>.value();
  }
}
