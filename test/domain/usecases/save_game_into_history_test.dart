import 'package:flutter_test/flutter_test.dart';
import 'package:game_counter/domain/repositories/history_repository.dart';
import 'package:game_counter/domain/usecases/save_game_into_history.dart';
import 'package:mockito/mockito.dart';

import '../../test_data/test_data.dart';

class MockHistoryRepository extends Mock implements HistoryRepository {}

void main() {
  MockHistoryRepository mockHistoryRepository;
  SaveGameIntoHistory saveGameIntoHistory;

  setUp(
    () {
      mockHistoryRepository = MockHistoryRepository();
      saveGameIntoHistory =
          SaveGameIntoHistory(repository: mockHistoryRepository);

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
