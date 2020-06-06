part of 'history_bloc.dart';

@freezed
abstract class HistoryState with _$HistoryState {
  factory HistoryState.initialState() = _OnHistoryInitialState;
  factory HistoryState.updatedState({List<HistoryItem> historyItems}) = _OnHistoryUpdatedState;
  factory HistoryState.errorState({String errorMessage}) = _OnHistoryErrorState;
}