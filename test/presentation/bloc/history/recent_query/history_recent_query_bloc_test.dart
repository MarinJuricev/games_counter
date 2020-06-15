import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:game_counter/core/error/failure.dart';
import 'package:game_counter/core/usecase/base_usecase.dart';
import 'package:game_counter/domain/usecases/delete_query.dart';
import 'package:game_counter/domain/usecases/get_recent_queries.dart';
import 'package:game_counter/presentation/feature/history/recent_query/bloc/history_recent_query_bloc.dart';
import 'package:mockito/mockito.dart';

import '../../../../test_data/test_data.dart';

class MockGetRecentQueries extends Mock implements GetRecentQueries {}

class MockDeleteQuery extends Mock implements DeleteQuery {}

void main() {
  MockGetRecentQueries mockGetRecentQueries;
  MockDeleteQuery mockDeleteQuery;

  final int positionToDelete = 0;

  setUp(
    () {
      mockGetRecentQueries = MockGetRecentQueries();
      mockDeleteQuery = MockDeleteQuery();
    },
  );

  group(
    'getRecentQuries',
    () {
      blocTest(
        'should emit [HistoryRecentQueryState.errorState] when getRecentQueriesResult returns a [Failure]',
        build: () async {
          when(mockGetRecentQueries(NoParams()))
              .thenAnswer((_) async => Left(CacheFailure(TEST_ERROR_MESSAGE)));

          return HistoryRecentQueryBloc(
            getRecentQueries: mockGetRecentQueries,
            deleteQuery: mockDeleteQuery,
          );
        },
        act: (HistoryRecentQueryBloc bloc) async => bloc.add(
          HistoryRecentQueryEvent.getRecentQuries(),
        ),
        verify: (_) => mockGetRecentQueries(NoParams()),
        expect: [
          HistoryRecentQueryState.errorState(errorMessage: TEST_ERROR_MESSAGE)
        ],
      );

      blocTest(
        'should emit [HistoryRecentQueryState.updatedState] when getRecentQueriesResult returns a List<String>',
        build: () async {
          when(mockGetRecentQueries(NoParams()))
              .thenAnswer((_) async => Right(testQueries));

          return HistoryRecentQueryBloc(
            getRecentQueries: mockGetRecentQueries,
            deleteQuery: mockDeleteQuery,
          );
        },
        act: (HistoryRecentQueryBloc bloc) async => bloc.add(
          HistoryRecentQueryEvent.getRecentQuries(),
        ),
        verify: (_) => mockGetRecentQueries(NoParams()),
        expect: [
          HistoryRecentQueryState.updatedState(recentQueries: testQueries)
        ],
      );
    },
  );

  group(
    'deleteQuery',
    () {
      blocTest(
        'should call _handleGetRecentQuries when deleteQueryResult returns a [Success]',
        build: () async {
          when(mockDeleteQuery(positionToDelete))
              .thenAnswer((_) async => Right(null));
          when(mockGetRecentQueries(NoParams()))
              .thenAnswer((_) async => Right(testQueries));

          return HistoryRecentQueryBloc(
            getRecentQueries: mockGetRecentQueries,
            deleteQuery: mockDeleteQuery,
          );
        },
        act: (HistoryRecentQueryBloc bloc) async => bloc.add(
          HistoryRecentQueryEvent.recentQueryDeleted(
              positionToDelete: positionToDelete),
        ),
        verify: (_) {
          mockGetRecentQueries(NoParams());
          return mockDeleteQuery(positionToDelete);
        },
        expect: [
          HistoryRecentQueryState.updatedState(recentQueries: testQueries)
        ],
      );

      blocTest(
        'should emit [HistoryRecentQueryState.errorState] when deleteQuery returns a [Failure]',
        build: () async {
          when(mockDeleteQuery(positionToDelete))
              .thenAnswer((_) async => Left(CacheFailure(TEST_ERROR_MESSAGE)));

          return HistoryRecentQueryBloc(
            getRecentQueries: mockGetRecentQueries,
            deleteQuery: mockDeleteQuery,
          );
        },
        act: (HistoryRecentQueryBloc bloc) async => bloc.add(
          HistoryRecentQueryEvent.recentQueryDeleted(
              positionToDelete: positionToDelete),
        ),
        verify: (_) => mockDeleteQuery(positionToDelete),
        expect: [
          HistoryRecentQueryState.errorState(errorMessage: TEST_ERROR_MESSAGE)
        ],
      );
    },
  );
}
