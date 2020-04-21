part of 'color_bloc.dart';

@freezed
abstract class ColorEvent with _$ColorEvent {
  factory ColorEvent.onScaffoldColorChange(Color newScaffoldColor) =
      _OnScaffoldColorChange;
  factory ColorEvent.onErrorColorChange() = _OnErrorColorChange;
  factory ColorEvent.onPrimaryColorChange() = _OnPrimaryColorChange;
  factory ColorEvent.onAccentColorChange() = _OnAccentColorChange;
}
