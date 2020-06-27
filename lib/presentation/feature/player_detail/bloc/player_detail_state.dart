part of 'player_detail_bloc.dart';

@freezed
abstract class PlayerDetailState with _$PlayerDetailState {
  factory PlayerDetailState.initialState() = _OnPlayerDetailState;
  factory PlayerDetailState.resetState() = _OnPlayerResetState;
  factory PlayerDetailState.saveTriggered() = _OnPlayerSaveTriggered;
  factory PlayerDetailState.updatedState({Player player}) = _OnPlayerUpdatedState;
  factory PlayerDetailState.errorState({String errorMessage}) = _OnPlayerErrorState;
}