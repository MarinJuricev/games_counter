import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:game_counter/core/error/failure.dart';
import 'package:game_counter/domain/entities/game.dart';
import 'package:game_counter/domain/usecases/get_games_from_query.dart';
import 'package:game_counter/presentation/feature/history/bloc/history_bloc.dart';
import 'package:game_counter/presentation/feature/history/model/history_item.dart';
import 'package:mockito/mockito.dart';

import '../../../test_data/test_data.dart';

class MockGetGamesFromQuery extends Mock implements GetGamesFromQuery {}

void main() {
  MockGetGamesFromQuery mockGetGamesFromQuery;
  String query = "Mau";
  String errorMessage = "errorMessage";

  List<Game> testList = [testGame, testGame2];
  List<HistoryItem> testHistoryItem = [
    HistoryItem(
      isExpanded: false,
      createdAt: testGame.createdAt,
      gameTitle: testGame.name,
      highlightedGameTitle: '',
      nonHighlightedGameTitle: '',
      gameWinner: testGame.winner,
      playersSortedByPoints: testGame.players,
    ),
    HistoryItem(
      isExpanded: false,
      createdAt: testGame2.createdAt,
      gameTitle: testGame2.name,
      highlightedGameTitle: 'Mau',
      nonHighlightedGameTitle: 'Mau',
      gameWinner: testGame2.winner,
      playersSortedByPoints: testGame2.players,
    )
  ];

  setUp(() {
    mockGetGamesFromQuery = MockGetGamesFromQuery();
  });

  group(
    'queryChanged',
    () {
      blocTest(
        'should emit [HistoryUpdatedState] when getGamesFromQuery retuns List<Game>',
        build: () async {
          when(mockGetGamesFromQuery(GetGamesFromQueryParams(query: query)))
              .thenAnswer((_) async => Right(testList));

          return HistoryBloc(
            getGamesFromQuery: mockGetGamesFromQuery,
          );
        },
        act: (HistoryBloc historyBloc) async => historyBloc.add(
          HistoryEvent.queryChanged(query: query),
        ),
        verify: (_) =>
            mockGetGamesFromQuery(GetGamesFromQueryParams(query: query)),
        expect: [HistoryState.updatedState(historyItems: testHistoryItem)],
      );

      blocTest(
        'should emit [HistoryErrorState] when getGamesFromQuery retuns [Failure]',
        build: () async {
          when(mockGetGamesFromQuery(GetGamesFromQueryParams(query: query)))
              .thenAnswer((_) async => Left(CacheFailure(errorMessage)));

          return HistoryBloc(
            getGamesFromQuery: mockGetGamesFromQuery,
          );
        },
        act: (HistoryBloc historyBloc) async => historyBloc.add(
          HistoryEvent.queryChanged(query: query),
        ),
        verify: (_) =>
            mockGetGamesFromQuery(GetGamesFromQueryParams(query: query)),
        expect: [HistoryState.errorState(errorMessage: errorMessage)],
      );
    },
  );
}
