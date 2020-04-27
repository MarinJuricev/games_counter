part of 'color_bloc.dart';

@freezed
abstract class ColorEvent with _$ColorEvent {
  factory ColorEvent.onGetCurrentAppColors() = _OnGetCurrentAppColors;
  factory ColorEvent.onScaffoldColorChange({@required Color newScaffoldColor}) =
      _OnScaffoldColorChange;
  factory ColorEvent.onErrorColorChange({@required Color newErrorColor}) =
      _OnErrorColorChange;
  factory ColorEvent.onPrimaryColorChange({@required Color newPrimaryColor}) =
      _OnPrimaryColorChange;
  factory ColorEvent.onAccentColorChange({@required Color newAccentColor}) =
      _OnAccentColorChange;
}
