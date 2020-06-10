import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:game_counter/domain/usecases/save_query.dart';
import 'package:meta/meta.dart';

import '../../../../../domain/usecases/get_games_from_query.dart';
import '../model/history_item.dart';

part 'history_bloc.freezed.dart';
part 'history_event.dart';
part 'history_state.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  final GetGamesFromQuery getGamesFromQuery;
  final SaveQuery saveQuery;

  HistoryBloc({
    @required this.getGamesFromQuery,
    @required this.saveQuery,
  });

  @override
  HistoryState get initialState => HistoryState.initialState();

  @override
  Stream<HistoryState> mapEventToState(
    HistoryEvent event,
  ) async* {
    yield* _handleQueryChanged(event.query);
  }

  Stream<HistoryState> _handleQueryChanged(String newQuery) async* {
    final gamesFromQueryResult =
        await getGamesFromQuery(GetGamesFromQueryParams(query: newQuery));

    await saveQuery(newQuery);

    yield gamesFromQueryResult.fold(
      (error) => HistoryState.errorState(errorMessage: error.message),
      (result) => HistoryState.updatedState(
        historyItems:
            result.map((item) => item.toHistoryItem(newQuery)).toList(),
      ),
    );
  }
}
