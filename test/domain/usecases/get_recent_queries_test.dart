import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:game_counter/core/usecase/base_usecase.dart';
import 'package:game_counter/domain/repositories/history_repository.dart';
import 'package:game_counter/domain/usecases/get_recent_queries.dart';
import 'package:mockito/mockito.dart';

import '../../test_data/test_data.dart';

class MockHistoryRepository extends Mock implements HistoryRepository {}

void main() {
  MockHistoryRepository mockHistoryRepository;
  GetRecentQueries getRecentQueries;

  setUp(
    () {
      mockHistoryRepository = MockHistoryRepository();
      getRecentQueries =
          GetRecentQueries(historyRepository: mockHistoryRepository);
    },
  );

  test(
    'should trigger historyRepository getRecentQueries and delegate the result back',
    () async {
      when(mockHistoryRepository.getRecentQueries())
          .thenAnswer((_) async => Right(testQueries));

      final actualResult = await getRecentQueries(NoParams());
      final expectedResult = Right(testQueries);

      expect(expectedResult, actualResult);
      verify(mockHistoryRepository.getRecentQueries()).called(1);
    },
  );
}
