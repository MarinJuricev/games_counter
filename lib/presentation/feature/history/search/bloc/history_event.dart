part of 'history_bloc.dart';

@freezed
abstract class HistoryEvent with _$HistoryEvent {
  factory HistoryEvent.queryChanged({String query}) = _OnQueryChanged;
}
