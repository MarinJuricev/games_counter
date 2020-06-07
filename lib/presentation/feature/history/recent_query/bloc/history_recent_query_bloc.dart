import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';

import '../../../../../core/usecase/base_usecase.dart';
import '../../../../../domain/entities/game.dart';
import '../../../../../domain/usecases/get_recent_queries.dart';

part 'history_recent_query_bloc.freezed.dart';
part 'history_recent_query_event.dart';
part 'history_recent_query_state.dart';

class HistoryRecentQueryBloc
    extends Bloc<HistoryRecentQueryEvent, HistoryRecentQueryState> {
  final GetRecentQueries getRecentQueries;

  HistoryRecentQueryBloc({
    @required this.getRecentQueries,
  });

  @override
  HistoryRecentQueryState get initialState =>
      HistoryRecentQueryState.initialState();

  @override
  Stream<HistoryRecentQueryState> mapEventToState(
    HistoryRecentQueryEvent event,
  ) async* {
    yield* event.map(
      getRecentQuries: _handleGetRecentQuries(),
      recentGameDeleted: yieldTestResult(),
      allRecentGamesDeleted: yieldTestResult(),
    );
  }

  _handleGetRecentQuries() async* {
    final getRecentQueriesResult = await getRecentQueries(NoParams());

    yield getRecentQueriesResult.fold(
      (error) =>
          HistoryRecentQueryState.errorState(errorMessage: error.message),
      (result) => HistoryRecentQueryState.updatedState(recentQueries: result),
    );
  }

  yieldTestResult() async* {
    yield HistoryRecentQueryState.errorState(errorMessage: 'Placeholder');
  }
}
