part of 'color_bloc.dart';

@freezed
abstract class ColorState with _$ColorState{
  factory ColorState.initialState() = _OnColorInitialState;
  factory ColorState.updatedState({AppColors appColors}) = _OnColorUpdatedState;
}