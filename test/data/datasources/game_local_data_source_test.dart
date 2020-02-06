import 'package:flutter_test/flutter_test.dart';
import 'package:game_counter/data/datasources/game_local_data_source.dart';
import 'package:game_counter/domain/entities/game.dart';

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
  });
}
