import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:game_counter/domain/entities/game.dart';
import 'package:meta/meta.dart';

part 'history_recent_query_event.dart';
part 'history_recent_query_state.dart';
part 'history_recent_query_bloc.freezed.dart';

class HistoryRecentQueryBloc extends Bloc<HistoryRecentQueryEvent, HistoryRecentQueryState> {
  @override
  HistoryRecentQueryState get initialState => HistoryRecentQueryInitial();

  @override
  Stream<HistoryRecentQueryState> mapEventToState(
    HistoryRecentQueryEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
