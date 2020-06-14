import 'package:flutter_test/flutter_test.dart';
import 'package:game_counter/domain/repositories/history_repository.dart';
import 'package:game_counter/domain/usecases/delete_query.dart';
import 'package:mockito/mockito.dart';

class MockHistoryRepository extends Mock implements HistoryRepository {}

void main() {
  MockHistoryRepository mockHistoryRepository;
  DeleteQuery deleteQuery;
  int positionToDelete = 0;

  setUp(
    () {
      mockHistoryRepository = MockHistoryRepository();
      deleteQuery = DeleteQuery(repository: mockHistoryRepository);
    },
  );

  test(
    'should trigger historyRepository deleteQuery with the provided query',
    () async {
      await deleteQuery(positionToDelete);

      verify(mockHistoryRepository.deleteQuery(positionToDelete)).called(1);
    },
  );
}
