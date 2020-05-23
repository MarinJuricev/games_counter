part of 'history_bloc.dart';

@freezed
abstract class HistoryState with _$HistoryState {
  factory HistoryState.initialState() = _OnHistoryInitialState;
  factory HistoryState.updatedState({List<Game> games}) = _OnHistoryUpdatedState;
  factory HistoryState.errorState({String errorMessage}) = _OnHistoryErrorState;
}