part of 'history_bloc.dart';

@freezed
abstract class HistoryEvent with _$HistoryEvent {
  factory HistoryEvent.queryChanged({String query}) = _OnQueryChanged;
  factory HistoryEvent.recentGameDeleted({Game gameToDelete}) = _OnGameDeleted;
  factory HistoryEvent.allRecentGamesDeleted() = _onAllRecentGamesDeleted;
}
