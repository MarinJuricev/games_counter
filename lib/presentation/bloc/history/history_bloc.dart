import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:game_counter/domain/entities/game.dart';
import 'package:game_counter/domain/usecases/get_games_from_query.dart';
import 'package:meta/meta.dart';

part 'history_event.dart';
part 'history_state.dart';
part 'history_bloc.freezed.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  final GetGamesFromQuery getGamesFromQuery;

  HistoryBloc({@required this.getGamesFromQuery});

  @override
  HistoryState get initialState => HistoryInitial();

  @override
  Stream<HistoryState> mapEventToState(
    HistoryEvent event,
  ) async* {
    yield* event.map(
      queryChanged: (params) => _handleQueryChanged(params.query),
      recentGameDeleted: null,
      allRecentGamesDeleted: null,
    );
  }

  Stream<HistoryState> _handleQueryChanged(String newQuery) {
    
  }
}
