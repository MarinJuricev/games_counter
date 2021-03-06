part of 'history_recent_query_bloc.dart';

@freezed
abstract class HistoryRecentQueryEvent with _$HistoryRecentQueryEvent {
  factory HistoryRecentQueryEvent.getRecentQuries() = _OnGetRecentQueries;
  factory HistoryRecentQueryEvent.recentQueryDeleted({int positionToDelete}) = _OnGameDeleted;
  factory HistoryRecentQueryEvent.allRecentGamesDeleted() = _OnAllRecentGamesDeleted;
}