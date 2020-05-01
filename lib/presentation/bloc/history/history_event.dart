part of 'history_bloc.dart';

@freezed
abstract class HistoryEvent with _$HistoryEvent {
  factory HistoryEvent.screenLoaded() = _OnScreenLoaded;
  factory HistoryEvent.recentGameDeleted({Game gameToDelete}) = _OnGameDeleted;
  factory HistoryEvent.allRecentGamesDeleted() = _onAllRecentGamesDeleted;
}
