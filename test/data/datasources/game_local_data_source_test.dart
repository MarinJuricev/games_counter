import 'package:flutter_test/flutter_test.dart';
import 'package:game_counter/core/error/exceptions.dart';
import 'package:game_counter/data/datasources/game_local_data_source.dart';
import 'package:game_counter/domain/entities/game.dart';
import 'package:matcher/matcher.dart';

void main() {
  GameLocalDataSource gameLocalDataSource;

  setUp(
    () {
      gameLocalDataSource = GameLocalDataSourceImpl();
    },
  );

  group('gameLocalDataSource', () {
    final gameName = 'Treseta';
    final pointsToWinParsed = 41;
    final numberOfPlayersParsed = 4;
    final testGame = Game(
      name: gameName,
      pointsToWin: pointsToWinParsed,
      numberOfPlayers: numberOfPlayersParsed,
    );

    test('should update the inMemory instance with cacheGame call', () async {
      gameLocalDataSource.cacheGame(testGame);

      final expectedResult = await gameLocalDataSource.getGame();

      expect(testGame, expectedResult);
    });

    test('should throw [CacheException] if the data is null when when getGame is called', () async {
      await gameLocalDataSource.cacheGame(null);

      final call = gameLocalDataSource.getGame;
      expect(() => call(), throwsA(TypeMatcher<CacheException>()));
    });
  });
}
