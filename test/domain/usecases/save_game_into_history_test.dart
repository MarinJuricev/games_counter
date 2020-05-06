import 'package:flutter_test/flutter_test.dart';
import 'package:game_counter/domain/entities/game.dart';
import 'package:game_counter/domain/repositories/history_repository.dart';
import 'package:game_counter/domain/usecases/save_game_into_history.dart';
import 'package:mockito/mockito.dart';

class MockHistoryRepository extends Mock implements HistoryRepository {}

void main() {
  MockHistoryRepository mockHistoryRepository;
  SaveGameIntoHistory saveGameIntoHistory;
  Game testGame;
  final gameName = 'Treseta';
  final pointsToWin = 41;
  final numberOfPlayers = 2;

  setUp(
    () {
      mockHistoryRepository = MockHistoryRepository();
      saveGameIntoHistory =
          SaveGameIntoHistory(repository: mockHistoryRepository);

      testGame = Game(
        name: gameName,
        pointsToWin: pointsToWin,
        numberOfPlayers: numberOfPlayers,
        players: [],
      );
    },
  );

  test(
    'should trigger historyRepository saveGameIntoHistory with the provided game',
    () async {
      saveGameIntoHistory(SaveGameIntoHistoryParams(gameToSave: testGame));

      verify(mockHistoryRepository.saveGameIntoHistory(testGame)).called(1);
    },
  );
}
