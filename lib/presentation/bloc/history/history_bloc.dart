import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/rendering.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';

import '../../../core/error/failure.dart';
import '../../../core/extensions/extensions.dart';
import '../../../domain/entities/game.dart';
import '../../../domain/usecases/get_games_from_query.dart';

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
    final gameFromQueryEither = gamesFromQueryResult.unwrapResult();

    if (gameFromQueryEither is List<Game>)
      yield HistoryState.updatedState(games: gameFromQueryEither);
    else if (gameFromQueryEither is Failure) {
      yield HistoryState.errorState(errorMessage: gameFromQueryEither.message);
    }
  }

  // Freezed won't compile if a state returns null, so we have this cheap workaround for
  // now so that queryChanged unit tests pass.
  Stream<HistoryState> test() async* {
    yield HistoryState.errorState(errorMessage: 'test');
  }
}
