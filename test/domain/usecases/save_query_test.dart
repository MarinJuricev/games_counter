import 'package:flutter_test/flutter_test.dart';
import 'package:game_counter/domain/repositories/history_repository.dart';
import 'package:game_counter/domain/usecases/save_query.dart';
import 'package:mockito/mockito.dart';

class MockHistoryRepository extends Mock implements HistoryRepository {}

void main() {
  MockHistoryRepository mockHistoryRepository;
  SaveQuery saveQuery;
  String testQuery = 'testQuery';

  setUp(
    () {
      mockHistoryRepository = MockHistoryRepository();
      saveQuery = SaveQuery(repository: mockHistoryRepository);
    },
  );

  test(
    'should trigget historyRepository saveQuery with the provided query',
    () async {
      saveQuery(testQuery);

      verify(mockHistoryRepository.saveQuery(testQuery)).called(1);
    },
  );
}
