import 'package:meta/meta.dart';

import '../../core/error/exceptions.dart';
import '../../domain/entities/game.dart';
import '../models/local_game.dart';
import 'local_persistence_provider.dart';

abstract class GameLocalDataSource {
  Future<Game> getGame();
  Future<void> cacheGame(Game game);
}

const CURRENT_GAME_BOX = 'CURRENT_GAME_BOX';

class GameLocalDataSourceImpl implements GameLocalDataSource {
  final LocalPersistenceProvider localPersistenceProvider;

  GameLocalDataSourceImpl({@required this.localPersistenceProvider});

  @override
  Future<Game> getGame() async {
    final LocalGame gameToReturn = await localPersistenceProvider
        .getFromKeyValuePair(boxToGetDatFrom: CURRENT_GAME_BOX);

    if (gameToReturn != null)
      return Future.value(gameToReturn.toGame());
    else
      throw CacheException();
  }

  @override
  Future<void> cacheGame(Game game) async {
    await localPersistenceProvider.saveKeyValuePair(
      valueToSave: game.toLocal(),
      boxToSaveInto: CURRENT_GAME_BOX,
    );

    return Future<void>.value();
  }
}
