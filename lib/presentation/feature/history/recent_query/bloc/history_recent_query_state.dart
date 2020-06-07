part of 'history_recent_query_bloc.dart';

@freezed
abstract class HistoryRecentQueryState with _$HistoryRecentQueryState {
  factory HistoryRecentQueryState.initialState() = _OnHistoryRecentInitialState;
  factory HistoryRecentQueryState.updatedState({List<String> recentQueries}) =
      _OnHistoryRecentUpdatedState;
  factory HistoryRecentQueryState.errorState({String errorMessage}) =
      _OnHistoryRecentErrorState;
}
