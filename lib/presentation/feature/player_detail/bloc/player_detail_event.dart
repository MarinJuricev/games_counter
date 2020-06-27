part of 'player_detail_bloc.dart';

@freezed
abstract class PlayerDetailEvent with _$PlayerDetailEvent {
  factory PlayerDetailEvent.saveClicked({
    @required int newMainPoints,
    @required int newBonusPoints,
    @required Player currentPlayer,
  }) = _OnSaveClicked;

  factory PlayerDetailEvent.resetClicked({
    @required Player currentPlayer,
  }) = _OnResetClicked;
}
