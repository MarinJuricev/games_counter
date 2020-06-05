import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';

import '../../../../domain/entities/game.dart';
import '../../../../domain/usecases/get_games_from_query.dart';
import '../../history/model/history_item.dart';
import '../model/history_item.dart';

part 'history_bloc.freezed.dart';
part 'history_event.dart';
part 'history_state.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  final GetGamesFromQuery getGamesFromQuery;

  HistoryBloc({@required this.getGamesFromQuery});

  @override
  HistoryState get initialState => HistoryState.initialState();

  @override
  Stream<HistoryState> mapEventToState(
    HistoryEvent event,
  ) async* {
    yield* event.map(
      queryChanged: (params) => _handleQueryChanged(params.query),
      recentGameDeleted: (params) => test(),
      allRecentGamesDeleted: (params) => test(),
    );
  }

  Stream<HistoryState> _handleQueryChanged(String newQuery) async* {
    final gamesFromQueryResult =
        await getGamesFromQuery(GetGamesFromQueryParams(query: newQuery));

    yield gamesFromQueryResult.fold(
      (error) => HistoryState.errorState(errorMessage: error.message),
      (result) => HistoryState.updatedState(
        historyItems:
            result.map((item) => item.toHistoryItem(newQuery)).toList(),
      ),
    );
  }

  // Freezed won't compile if a state returns null, so we have this cheap workaround for
  // now so that queryChanged unit tests pass.
  Stream<HistoryState> test() async* {
    yield HistoryState.errorState(errorMessage: 'test');
  }
}
