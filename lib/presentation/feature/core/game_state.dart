part of 'game_bloc.dart';

@freezed
abstract class GameState with _$GameState {
  factory GameState.initialState() = _OnGameInitialState;
  factory GameState.updatedState({Game game}) = _OnGameUpdatedState;
  factory GameState.errorState({String errorMessage}) = _OnGameErrorState;
  factory GameState.overState({Player player}) = _OnGameOverState;
}