import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:game_counter/core/error/failure.dart';
import 'package:game_counter/domain/entities/game.dart';
import 'package:game_counter/domain/usecases/get_games_from_query.dart';
import 'package:game_counter/presentation/bloc/history/history_bloc.dart';
import 'package:mockito/mockito.dart';

class MockGetGamesFromQuery extends Mock implements GetGamesFromQuery {}

void main() {
  MockGetGamesFromQuery mockGetGamesFromQuery;
  String query = "test";
  String errorMessage = "errorMessage";

  Game testGame = Game(
    name: 'test',
    bonusPoints: 0,
    pointsToWin: 0,
    numberOfPlayers: 4,
    players: [],
  );

  Game testGame2 = Game(
    name: 'test2',
    bonusPoints: 0,
    winner: '',
    numberOfPlayers: 4,
    players: [],
  );

  List<Game> testList = [testGame, testGame2];

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

            return HistoryBloc(getGamesFromQuery: mockGetGamesFromQuery);
          },
          act: (HistoryBloc historyBloc) async => historyBloc.add(
                HistoryEvent.queryChanged(query: query),
              ),
          verify: (_) => mockGetGamesFromQuery(GetGamesFromQueryParams(query: query)),
          expect: [HistoryState.updatedState(games: testList)]);

          blocTest(
          'should emit [HistoryErrorState] when getGamesFromQuery retuns [Failure]',
          build: () async {
            when(mockGetGamesFromQuery(GetGamesFromQueryParams(query: query)))
                .thenAnswer((_) async => Left(CacheFailure(errorMessage)));

            return HistoryBloc(getGamesFromQuery: mockGetGamesFromQuery);
          },
          act: (HistoryBloc historyBloc) async => historyBloc.add(
                HistoryEvent.queryChanged(query: query),
              ),
          verify: (_) => mockGetGamesFromQuery(GetGamesFromQueryParams(query: query)),
          expect: [HistoryState.errorState(errorMessage: errorMessage)]);
    },
  );
}
