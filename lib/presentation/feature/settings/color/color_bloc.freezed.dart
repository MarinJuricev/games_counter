// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'color_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$ColorEventTearOff {
  const _$ColorEventTearOff();

  _OnGetCurrentAppColors onGetCurrentAppColors() {
    return _OnGetCurrentAppColors();
  }

  _OnScaffoldColorChange onScaffoldColorChange(
      {@required Color newScaffoldColor}) {
    return _OnScaffoldColorChange(
      newScaffoldColor: newScaffoldColor,
    );
  }

  _OnErrorColorChange onErrorColorChange({@required Color newErrorColor}) {
    return _OnErrorColorChange(
      newErrorColor: newErrorColor,
    );
  }

  _OnPrimaryColorChange onPrimaryColorChange(
      {@required Color newPrimaryColor}) {
    return _OnPrimaryColorChange(
      newPrimaryColor: newPrimaryColor,
    );
  }

  _OnAccentColorChange onAccentColorChange({@required Color newAccentColor}) {
    return _OnAccentColorChange(
      newAccentColor: newAccentColor,
    );
  }

  _OnResetAppColors onResetAppColors() {
    return _OnResetAppColors();
  }
}

// ignore: unused_element
const $ColorEvent = _$ColorEventTearOff();

mixin _$ColorEvent {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result onGetCurrentAppColors(),
    @required Result onScaffoldColorChange(Color newScaffoldColor),
    @required Result onErrorColorChange(Color newErrorColor),
    @required Result onPrimaryColorChange(Color newPrimaryColor),
    @required Result onAccentColorChange(Color newAccentColor),
    @required Result onResetAppColors(),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result onGetCurrentAppColors(),
    Result onScaffoldColorChange(Color newScaffoldColor),
    Result onErrorColorChange(Color newErrorColor),
    Result onPrimaryColorChange(Color newPrimaryColor),
    Result onAccentColorChange(Color newAccentColor),
    Result onResetAppColors(),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result onGetCurrentAppColors(_OnGetCurrentAppColors value),
    @required Result onScaffoldColorChange(_OnScaffoldColorChange value),
    @required Result onErrorColorChange(_OnErrorColorChange value),
    @required Result onPrimaryColorChange(_OnPrimaryColorChange value),
    @required Result onAccentColorChange(_OnAccentColorChange value),
    @required Result onResetAppColors(_OnResetAppColors value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result onGetCurrentAppColors(_OnGetCurrentAppColors value),
    Result onScaffoldColorChange(_OnScaffoldColorChange value),
    Result onErrorColorChange(_OnErrorColorChange value),
    Result onPrimaryColorChange(_OnPrimaryColorChange value),
    Result onAccentColorChange(_OnAccentColorChange value),
    Result onResetAppColors(_OnResetAppColors value),
    @required Result orElse(),
  });
}

abstract class $ColorEventCopyWith<$Res> {
  factory $ColorEventCopyWith(
          ColorEvent value, $Res Function(ColorEvent) then) =
      _$ColorEventCopyWithImpl<$Res>;
}

class _$ColorEventCopyWithImpl<$Res> implements $ColorEventCopyWith<$Res> {
  _$ColorEventCopyWithImpl(this._value, this._then);

  final ColorEvent _value;
  // ignore: unused_field
  final $Res Function(ColorEvent) _then;
}

abstract class _$OnGetCurrentAppColorsCopyWith<$Res> {
  factory _$OnGetCurrentAppColorsCopyWith(_OnGetCurrentAppColors value,
          $Res Function(_OnGetCurrentAppColors) then) =
      __$OnGetCurrentAppColorsCopyWithImpl<$Res>;
}

class __$OnGetCurrentAppColorsCopyWithImpl<$Res>
    extends _$ColorEventCopyWithImpl<$Res>
    implements _$OnGetCurrentAppColorsCopyWith<$Res> {
  __$OnGetCurrentAppColorsCopyWithImpl(_OnGetCurrentAppColors _value,
      $Res Function(_OnGetCurrentAppColors) _then)
      : super(_value, (v) => _then(v as _OnGetCurrentAppColors));

  @override
  _OnGetCurrentAppColors get _value => super._value as _OnGetCurrentAppColors;
}

class _$_OnGetCurrentAppColors
    with DiagnosticableTreeMixin
    implements _OnGetCurrentAppColors {
  _$_OnGetCurrentAppColors();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ColorEvent.onGetCurrentAppColors()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ColorEvent.onGetCurrentAppColors'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _OnGetCurrentAppColors);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result onGetCurrentAppColors(),
    @required Result onScaffoldColorChange(Color newScaffoldColor),
    @required Result onErrorColorChange(Color newErrorColor),
    @required Result onPrimaryColorChange(Color newPrimaryColor),
    @required Result onAccentColorChange(Color newAccentColor),
    @required Result onResetAppColors(),
  }) {
    assert(onGetCurrentAppColors != null);
    assert(onScaffoldColorChange != null);
    assert(onErrorColorChange != null);
    assert(onPrimaryColorChange != null);
    assert(onAccentColorChange != null);
    assert(onResetAppColors != null);
    return onGetCurrentAppColors();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result onGetCurrentAppColors(),
    Result onScaffoldColorChange(Color newScaffoldColor),
    Result onErrorColorChange(Color newErrorColor),
    Result onPrimaryColorChange(Color newPrimaryColor),
    Result onAccentColorChange(Color newAccentColor),
    Result onResetAppColors(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (onGetCurrentAppColors != null) {
      return onGetCurrentAppColors();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result onGetCurrentAppColors(_OnGetCurrentAppColors value),
    @required Result onScaffoldColorChange(_OnScaffoldColorChange value),
    @required Result onErrorColorChange(_OnErrorColorChange value),
    @required Result onPrimaryColorChange(_OnPrimaryColorChange value),
    @required Result onAccentColorChange(_OnAccentColorChange value),
    @required Result onResetAppColors(_OnResetAppColors value),
  }) {
    assert(onGetCurrentAppColors != null);
    assert(onScaffoldColorChange != null);
    assert(onErrorColorChange != null);
    assert(onPrimaryColorChange != null);
    assert(onAccentColorChange != null);
    assert(onResetAppColors != null);
    return onGetCurrentAppColors(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result onGetCurrentAppColors(_OnGetCurrentAppColors value),
    Result onScaffoldColorChange(_OnScaffoldColorChange value),
    Result onErrorColorChange(_OnErrorColorChange value),
    Result onPrimaryColorChange(_OnPrimaryColorChange value),
    Result onAccentColorChange(_OnAccentColorChange value),
    Result onResetAppColors(_OnResetAppColors value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (onGetCurrentAppColors != null) {
      return onGetCurrentAppColors(this);
    }
    return orElse();
  }
}

abstract class _OnGetCurrentAppColors implements ColorEvent {
  factory _OnGetCurrentAppColors() = _$_OnGetCurrentAppColors;
}

abstract class _$OnScaffoldColorChangeCopyWith<$Res> {
  factory _$OnScaffoldColorChangeCopyWith(_OnScaffoldColorChange value,
          $Res Function(_OnScaffoldColorChange) then) =
      __$OnScaffoldColorChangeCopyWithImpl<$Res>;
  $Res call({Color newScaffoldColor});
}

class __$OnScaffoldColorChangeCopyWithImpl<$Res>
    extends _$ColorEventCopyWithImpl<$Res>
    implements _$OnScaffoldColorChangeCopyWith<$Res> {
  __$OnScaffoldColorChangeCopyWithImpl(_OnScaffoldColorChange _value,
      $Res Function(_OnScaffoldColorChange) _then)
      : super(_value, (v) => _then(v as _OnScaffoldColorChange));

  @override
  _OnScaffoldColorChange get _value => super._value as _OnScaffoldColorChange;

  @override
  $Res call({
    Object newScaffoldColor = freezed,
  }) {
    return _then(_OnScaffoldColorChange(
      newScaffoldColor: newScaffoldColor == freezed
          ? _value.newScaffoldColor
          : newScaffoldColor as Color,
    ));
  }
}

class _$_OnScaffoldColorChange
    with DiagnosticableTreeMixin
    implements _OnScaffoldColorChange {
  _$_OnScaffoldColorChange({@required this.newScaffoldColor})
      : assert(newScaffoldColor != null);

  @override
  final Color newScaffoldColor;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ColorEvent.onScaffoldColorChange(newScaffoldColor: $newScaffoldColor)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ColorEvent.onScaffoldColorChange'))
      ..add(DiagnosticsProperty('newScaffoldColor', newScaffoldColor));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _OnScaffoldColorChange &&
            (identical(other.newScaffoldColor, newScaffoldColor) ||
                const DeepCollectionEquality()
                    .equals(other.newScaffoldColor, newScaffoldColor)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(newScaffoldColor);

  @override
  _$OnScaffoldColorChangeCopyWith<_OnScaffoldColorChange> get copyWith =>
      __$OnScaffoldColorChangeCopyWithImpl<_OnScaffoldColorChange>(
          this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result onGetCurrentAppColors(),
    @required Result onScaffoldColorChange(Color newScaffoldColor),
    @required Result onErrorColorChange(Color newErrorColor),
    @required Result onPrimaryColorChange(Color newPrimaryColor),
    @required Result onAccentColorChange(Color newAccentColor),
    @required Result onResetAppColors(),
  }) {
    assert(onGetCurrentAppColors != null);
    assert(onScaffoldColorChange != null);
    assert(onErrorColorChange != null);
    assert(onPrimaryColorChange != null);
    assert(onAccentColorChange != null);
    assert(onResetAppColors != null);
    return onScaffoldColorChange(newScaffoldColor);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result onGetCurrentAppColors(),
    Result onScaffoldColorChange(Color newScaffoldColor),
    Result onErrorColorChange(Color newErrorColor),
    Result onPrimaryColorChange(Color newPrimaryColor),
    Result onAccentColorChange(Color newAccentColor),
    Result onResetAppColors(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (onScaffoldColorChange != null) {
      return onScaffoldColorChange(newScaffoldColor);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result onGetCurrentAppColors(_OnGetCurrentAppColors value),
    @required Result onScaffoldColorChange(_OnScaffoldColorChange value),
    @required Result onErrorColorChange(_OnErrorColorChange value),
    @required Result onPrimaryColorChange(_OnPrimaryColorChange value),
    @required Result onAccentColorChange(_OnAccentColorChange value),
    @required Result onResetAppColors(_OnResetAppColors value),
  }) {
    assert(onGetCurrentAppColors != null);
    assert(onScaffoldColorChange != null);
    assert(onErrorColorChange != null);
    assert(onPrimaryColorChange != null);
    assert(onAccentColorChange != null);
    assert(onResetAppColors != null);
    return onScaffoldColorChange(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result onGetCurrentAppColors(_OnGetCurrentAppColors value),
    Result onScaffoldColorChange(_OnScaffoldColorChange value),
    Result onErrorColorChange(_OnErrorColorChange value),
    Result onPrimaryColorChange(_OnPrimaryColorChange value),
    Result onAccentColorChange(_OnAccentColorChange value),
    Result onResetAppColors(_OnResetAppColors value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (onScaffoldColorChange != null) {
      return onScaffoldColorChange(this);
    }
    return orElse();
  }
}

abstract class _OnScaffoldColorChange implements ColorEvent {
  factory _OnScaffoldColorChange({@required Color newScaffoldColor}) =
      _$_OnScaffoldColorChange;

  Color get newScaffoldColor;
  _$OnScaffoldColorChangeCopyWith<_OnScaffoldColorChange> get copyWith;
}

abstract class _$OnErrorColorChangeCopyWith<$Res> {
  factory _$OnErrorColorChangeCopyWith(
          _OnErrorColorChange value, $Res Function(_OnErrorColorChange) then) =
      __$OnErrorColorChangeCopyWithImpl<$Res>;
  $Res call({Color newErrorColor});
}

class __$OnErrorColorChangeCopyWithImpl<$Res>
    extends _$ColorEventCopyWithImpl<$Res>
    implements _$OnErrorColorChangeCopyWith<$Res> {
  __$OnErrorColorChangeCopyWithImpl(
      _OnErrorColorChange _value, $Res Function(_OnErrorColorChange) _then)
      : super(_value, (v) => _then(v as _OnErrorColorChange));

  @override
  _OnErrorColorChange get _value => super._value as _OnErrorColorChange;

  @override
  $Res call({
    Object newErrorColor = freezed,
  }) {
    return _then(_OnErrorColorChange(
      newErrorColor: newErrorColor == freezed
          ? _value.newErrorColor
          : newErrorColor as Color,
    ));
  }
}

class _$_OnErrorColorChange
    with DiagnosticableTreeMixin
    implements _OnErrorColorChange {
  _$_OnErrorColorChange({@required this.newErrorColor})
      : assert(newErrorColor != null);

  @override
  final Color newErrorColor;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ColorEvent.onErrorColorChange(newErrorColor: $newErrorColor)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ColorEvent.onErrorColorChange'))
      ..add(DiagnosticsProperty('newErrorColor', newErrorColor));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _OnErrorColorChange &&
            (identical(other.newErrorColor, newErrorColor) ||
                const DeepCollectionEquality()
                    .equals(other.newErrorColor, newErrorColor)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(newErrorColor);

  @override
  _$OnErrorColorChangeCopyWith<_OnErrorColorChange> get copyWith =>
      __$OnErrorColorChangeCopyWithImpl<_OnErrorColorChange>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result onGetCurrentAppColors(),
    @required Result onScaffoldColorChange(Color newScaffoldColor),
    @required Result onErrorColorChange(Color newErrorColor),
    @required Result onPrimaryColorChange(Color newPrimaryColor),
    @required Result onAccentColorChange(Color newAccentColor),
    @required Result onResetAppColors(),
  }) {
    assert(onGetCurrentAppColors != null);
    assert(onScaffoldColorChange != null);
    assert(onErrorColorChange != null);
    assert(onPrimaryColorChange != null);
    assert(onAccentColorChange != null);
    assert(onResetAppColors != null);
    return onErrorColorChange(newErrorColor);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result onGetCurrentAppColors(),
    Result onScaffoldColorChange(Color newScaffoldColor),
    Result onErrorColorChange(Color newErrorColor),
    Result onPrimaryColorChange(Color newPrimaryColor),
    Result onAccentColorChange(Color newAccentColor),
    Result onResetAppColors(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (onErrorColorChange != null) {
      return onErrorColorChange(newErrorColor);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result onGetCurrentAppColors(_OnGetCurrentAppColors value),
    @required Result onScaffoldColorChange(_OnScaffoldColorChange value),
    @required Result onErrorColorChange(_OnErrorColorChange value),
    @required Result onPrimaryColorChange(_OnPrimaryColorChange value),
    @required Result onAccentColorChange(_OnAccentColorChange value),
    @required Result onResetAppColors(_OnResetAppColors value),
  }) {
    assert(onGetCurrentAppColors != null);
    assert(onScaffoldColorChange != null);
    assert(onErrorColorChange != null);
    assert(onPrimaryColorChange != null);
    assert(onAccentColorChange != null);
    assert(onResetAppColors != null);
    return onErrorColorChange(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result onGetCurrentAppColors(_OnGetCurrentAppColors value),
    Result onScaffoldColorChange(_OnScaffoldColorChange value),
    Result onErrorColorChange(_OnErrorColorChange value),
    Result onPrimaryColorChange(_OnPrimaryColorChange value),
    Result onAccentColorChange(_OnAccentColorChange value),
    Result onResetAppColors(_OnResetAppColors value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (onErrorColorChange != null) {
      return onErrorColorChange(this);
    }
    return orElse();
  }
}

abstract class _OnErrorColorChange implements ColorEvent {
  factory _OnErrorColorChange({@required Color newErrorColor}) =
      _$_OnErrorColorChange;

  Color get newErrorColor;
  _$OnErrorColorChangeCopyWith<_OnErrorColorChange> get copyWith;
}

abstract class _$OnPrimaryColorChangeCopyWith<$Res> {
  factory _$OnPrimaryColorChangeCopyWith(_OnPrimaryColorChange value,
          $Res Function(_OnPrimaryColorChange) then) =
      __$OnPrimaryColorChangeCopyWithImpl<$Res>;
  $Res call({Color newPrimaryColor});
}

class __$OnPrimaryColorChangeCopyWithImpl<$Res>
    extends _$ColorEventCopyWithImpl<$Res>
    implements _$OnPrimaryColorChangeCopyWith<$Res> {
  __$OnPrimaryColorChangeCopyWithImpl(
      _OnPrimaryColorChange _value, $Res Function(_OnPrimaryColorChange) _then)
      : super(_value, (v) => _then(v as _OnPrimaryColorChange));

  @override
  _OnPrimaryColorChange get _value => super._value as _OnPrimaryColorChange;

  @override
  $Res call({
    Object newPrimaryColor = freezed,
  }) {
    return _then(_OnPrimaryColorChange(
      newPrimaryColor: newPrimaryColor == freezed
          ? _value.newPrimaryColor
          : newPrimaryColor as Color,
    ));
  }
}

class _$_OnPrimaryColorChange
    with DiagnosticableTreeMixin
    implements _OnPrimaryColorChange {
  _$_OnPrimaryColorChange({@required this.newPrimaryColor})
      : assert(newPrimaryColor != null);

  @override
  final Color newPrimaryColor;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ColorEvent.onPrimaryColorChange(newPrimaryColor: $newPrimaryColor)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ColorEvent.onPrimaryColorChange'))
      ..add(DiagnosticsProperty('newPrimaryColor', newPrimaryColor));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _OnPrimaryColorChange &&
            (identical(other.newPrimaryColor, newPrimaryColor) ||
                const DeepCollectionEquality()
                    .equals(other.newPrimaryColor, newPrimaryColor)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(newPrimaryColor);

  @override
  _$OnPrimaryColorChangeCopyWith<_OnPrimaryColorChange> get copyWith =>
      __$OnPrimaryColorChangeCopyWithImpl<_OnPrimaryColorChange>(
          this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result onGetCurrentAppColors(),
    @required Result onScaffoldColorChange(Color newScaffoldColor),
    @required Result onErrorColorChange(Color newErrorColor),
    @required Result onPrimaryColorChange(Color newPrimaryColor),
    @required Result onAccentColorChange(Color newAccentColor),
    @required Result onResetAppColors(),
  }) {
    assert(onGetCurrentAppColors != null);
    assert(onScaffoldColorChange != null);
    assert(onErrorColorChange != null);
    assert(onPrimaryColorChange != null);
    assert(onAccentColorChange != null);
    assert(onResetAppColors != null);
    return onPrimaryColorChange(newPrimaryColor);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result onGetCurrentAppColors(),
    Result onScaffoldColorChange(Color newScaffoldColor),
    Result onErrorColorChange(Color newErrorColor),
    Result onPrimaryColorChange(Color newPrimaryColor),
    Result onAccentColorChange(Color newAccentColor),
    Result onResetAppColors(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (onPrimaryColorChange != null) {
      return onPrimaryColorChange(newPrimaryColor);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result onGetCurrentAppColors(_OnGetCurrentAppColors value),
    @required Result onScaffoldColorChange(_OnScaffoldColorChange value),
    @required Result onErrorColorChange(_OnErrorColorChange value),
    @required Result onPrimaryColorChange(_OnPrimaryColorChange value),
    @required Result onAccentColorChange(_OnAccentColorChange value),
    @required Result onResetAppColors(_OnResetAppColors value),
  }) {
    assert(onGetCurrentAppColors != null);
    assert(onScaffoldColorChange != null);
    assert(onErrorColorChange != null);
    assert(onPrimaryColorChange != null);
    assert(onAccentColorChange != null);
    assert(onResetAppColors != null);
    return onPrimaryColorChange(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result onGetCurrentAppColors(_OnGetCurrentAppColors value),
    Result onScaffoldColorChange(_OnScaffoldColorChange value),
    Result onErrorColorChange(_OnErrorColorChange value),
    Result onPrimaryColorChange(_OnPrimaryColorChange value),
    Result onAccentColorChange(_OnAccentColorChange value),
    Result onResetAppColors(_OnResetAppColors value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (onPrimaryColorChange != null) {
      return onPrimaryColorChange(this);
    }
    return orElse();
  }
}

abstract class _OnPrimaryColorChange implements ColorEvent {
  factory _OnPrimaryColorChange({@required Color newPrimaryColor}) =
      _$_OnPrimaryColorChange;

  Color get newPrimaryColor;
  _$OnPrimaryColorChangeCopyWith<_OnPrimaryColorChange> get copyWith;
}

abstract class _$OnAccentColorChangeCopyWith<$Res> {
  factory _$OnAccentColorChangeCopyWith(_OnAccentColorChange value,
          $Res Function(_OnAccentColorChange) then) =
      __$OnAccentColorChangeCopyWithImpl<$Res>;
  $Res call({Color newAccentColor});
}

class __$OnAccentColorChangeCopyWithImpl<$Res>
    extends _$ColorEventCopyWithImpl<$Res>
    implements _$OnAccentColorChangeCopyWith<$Res> {
  __$OnAccentColorChangeCopyWithImpl(
      _OnAccentColorChange _value, $Res Function(_OnAccentColorChange) _then)
      : super(_value, (v) => _then(v as _OnAccentColorChange));

  @override
  _OnAccentColorChange get _value => super._value as _OnAccentColorChange;

  @override
  $Res call({
    Object newAccentColor = freezed,
  }) {
    return _then(_OnAccentColorChange(
      newAccentColor: newAccentColor == freezed
          ? _value.newAccentColor
          : newAccentColor as Color,
    ));
  }
}

class _$_OnAccentColorChange
    with DiagnosticableTreeMixin
    implements _OnAccentColorChange {
  _$_OnAccentColorChange({@required this.newAccentColor})
      : assert(newAccentColor != null);

  @override
  final Color newAccentColor;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ColorEvent.onAccentColorChange(newAccentColor: $newAccentColor)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ColorEvent.onAccentColorChange'))
      ..add(DiagnosticsProperty('newAccentColor', newAccentColor));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _OnAccentColorChange &&
            (identical(other.newAccentColor, newAccentColor) ||
                const DeepCollectionEquality()
                    .equals(other.newAccentColor, newAccentColor)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(newAccentColor);

  @override
  _$OnAccentColorChangeCopyWith<_OnAccentColorChange> get copyWith =>
      __$OnAccentColorChangeCopyWithImpl<_OnAccentColorChange>(
          this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result onGetCurrentAppColors(),
    @required Result onScaffoldColorChange(Color newScaffoldColor),
    @required Result onErrorColorChange(Color newErrorColor),
    @required Result onPrimaryColorChange(Color newPrimaryColor),
    @required Result onAccentColorChange(Color newAccentColor),
    @required Result onResetAppColors(),
  }) {
    assert(onGetCurrentAppColors != null);
    assert(onScaffoldColorChange != null);
    assert(onErrorColorChange != null);
    assert(onPrimaryColorChange != null);
    assert(onAccentColorChange != null);
    assert(onResetAppColors != null);
    return onAccentColorChange(newAccentColor);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result onGetCurrentAppColors(),
    Result onScaffoldColorChange(Color newScaffoldColor),
    Result onErrorColorChange(Color newErrorColor),
    Result onPrimaryColorChange(Color newPrimaryColor),
    Result onAccentColorChange(Color newAccentColor),
    Result onResetAppColors(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (onAccentColorChange != null) {
      return onAccentColorChange(newAccentColor);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result onGetCurrentAppColors(_OnGetCurrentAppColors value),
    @required Result onScaffoldColorChange(_OnScaffoldColorChange value),
    @required Result onErrorColorChange(_OnErrorColorChange value),
    @required Result onPrimaryColorChange(_OnPrimaryColorChange value),
    @required Result onAccentColorChange(_OnAccentColorChange value),
    @required Result onResetAppColors(_OnResetAppColors value),
  }) {
    assert(onGetCurrentAppColors != null);
    assert(onScaffoldColorChange != null);
    assert(onErrorColorChange != null);
    assert(onPrimaryColorChange != null);
    assert(onAccentColorChange != null);
    assert(onResetAppColors != null);
    return onAccentColorChange(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result onGetCurrentAppColors(_OnGetCurrentAppColors value),
    Result onScaffoldColorChange(_OnScaffoldColorChange value),
    Result onErrorColorChange(_OnErrorColorChange value),
    Result onPrimaryColorChange(_OnPrimaryColorChange value),
    Result onAccentColorChange(_OnAccentColorChange value),
    Result onResetAppColors(_OnResetAppColors value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (onAccentColorChange != null) {
      return onAccentColorChange(this);
    }
    return orElse();
  }
}

abstract class _OnAccentColorChange implements ColorEvent {
  factory _OnAccentColorChange({@required Color newAccentColor}) =
      _$_OnAccentColorChange;

  Color get newAccentColor;
  _$OnAccentColorChangeCopyWith<_OnAccentColorChange> get copyWith;
}

abstract class _$OnResetAppColorsCopyWith<$Res> {
  factory _$OnResetAppColorsCopyWith(
          _OnResetAppColors value, $Res Function(_OnResetAppColors) then) =
      __$OnResetAppColorsCopyWithImpl<$Res>;
}

class __$OnResetAppColorsCopyWithImpl<$Res>
    extends _$ColorEventCopyWithImpl<$Res>
    implements _$OnResetAppColorsCopyWith<$Res> {
  __$OnResetAppColorsCopyWithImpl(
      _OnResetAppColors _value, $Res Function(_OnResetAppColors) _then)
      : super(_value, (v) => _then(v as _OnResetAppColors));

  @override
  _OnResetAppColors get _value => super._value as _OnResetAppColors;
}

class _$_OnResetAppColors
    with DiagnosticableTreeMixin
    implements _OnResetAppColors {
  _$_OnResetAppColors();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ColorEvent.onResetAppColors()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'ColorEvent.onResetAppColors'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _OnResetAppColors);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result onGetCurrentAppColors(),
    @required Result onScaffoldColorChange(Color newScaffoldColor),
    @required Result onErrorColorChange(Color newErrorColor),
    @required Result onPrimaryColorChange(Color newPrimaryColor),
    @required Result onAccentColorChange(Color newAccentColor),
    @required Result onResetAppColors(),
  }) {
    assert(onGetCurrentAppColors != null);
    assert(onScaffoldColorChange != null);
    assert(onErrorColorChange != null);
    assert(onPrimaryColorChange != null);
    assert(onAccentColorChange != null);
    assert(onResetAppColors != null);
    return onResetAppColors();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result onGetCurrentAppColors(),
    Result onScaffoldColorChange(Color newScaffoldColor),
    Result onErrorColorChange(Color newErrorColor),
    Result onPrimaryColorChange(Color newPrimaryColor),
    Result onAccentColorChange(Color newAccentColor),
    Result onResetAppColors(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (onResetAppColors != null) {
      return onResetAppColors();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result onGetCurrentAppColors(_OnGetCurrentAppColors value),
    @required Result onScaffoldColorChange(_OnScaffoldColorChange value),
    @required Result onErrorColorChange(_OnErrorColorChange value),
    @required Result onPrimaryColorChange(_OnPrimaryColorChange value),
    @required Result onAccentColorChange(_OnAccentColorChange value),
    @required Result onResetAppColors(_OnResetAppColors value),
  }) {
    assert(onGetCurrentAppColors != null);
    assert(onScaffoldColorChange != null);
    assert(onErrorColorChange != null);
    assert(onPrimaryColorChange != null);
    assert(onAccentColorChange != null);
    assert(onResetAppColors != null);
    return onResetAppColors(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result onGetCurrentAppColors(_OnGetCurrentAppColors value),
    Result onScaffoldColorChange(_OnScaffoldColorChange value),
    Result onErrorColorChange(_OnErrorColorChange value),
    Result onPrimaryColorChange(_OnPrimaryColorChange value),
    Result onAccentColorChange(_OnAccentColorChange value),
    Result onResetAppColors(_OnResetAppColors value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (onResetAppColors != null) {
      return onResetAppColors(this);
    }
    return orElse();
  }
}

abstract class _OnResetAppColors implements ColorEvent {
  factory _OnResetAppColors() = _$_OnResetAppColors;
}

class _$ColorStateTearOff {
  const _$ColorStateTearOff();

  _OnColorInitialState initialState() {
    return _OnColorInitialState();
  }

  _OnColorUpdatedState updatedState({AppColors appColors}) {
    return _OnColorUpdatedState(
      appColors: appColors,
    );
  }
}

// ignore: unused_element
const $ColorState = _$ColorStateTearOff();

mixin _$ColorState {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initialState(),
    @required Result updatedState(AppColors appColors),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initialState(),
    Result updatedState(AppColors appColors),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initialState(_OnColorInitialState value),
    @required Result updatedState(_OnColorUpdatedState value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initialState(_OnColorInitialState value),
    Result updatedState(_OnColorUpdatedState value),
    @required Result orElse(),
  });
}

abstract class $ColorStateCopyWith<$Res> {
  factory $ColorStateCopyWith(
          ColorState value, $Res Function(ColorState) then) =
      _$ColorStateCopyWithImpl<$Res>;
}

class _$ColorStateCopyWithImpl<$Res> implements $ColorStateCopyWith<$Res> {
  _$ColorStateCopyWithImpl(this._value, this._then);

  final ColorState _value;
  // ignore: unused_field
  final $Res Function(ColorState) _then;
}

abstract class _$OnColorInitialStateCopyWith<$Res> {
  factory _$OnColorInitialStateCopyWith(_OnColorInitialState value,
          $Res Function(_OnColorInitialState) then) =
      __$OnColorInitialStateCopyWithImpl<$Res>;
}

class __$OnColorInitialStateCopyWithImpl<$Res>
    extends _$ColorStateCopyWithImpl<$Res>
    implements _$OnColorInitialStateCopyWith<$Res> {
  __$OnColorInitialStateCopyWithImpl(
      _OnColorInitialState _value, $Res Function(_OnColorInitialState) _then)
      : super(_value, (v) => _then(v as _OnColorInitialState));

  @override
  _OnColorInitialState get _value => super._value as _OnColorInitialState;
}

class _$_OnColorInitialState
    with DiagnosticableTreeMixin
    implements _OnColorInitialState {
  _$_OnColorInitialState();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ColorState.initialState()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'ColorState.initialState'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _OnColorInitialState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initialState(),
    @required Result updatedState(AppColors appColors),
  }) {
    assert(initialState != null);
    assert(updatedState != null);
    return initialState();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initialState(),
    Result updatedState(AppColors appColors),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (initialState != null) {
      return initialState();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initialState(_OnColorInitialState value),
    @required Result updatedState(_OnColorUpdatedState value),
  }) {
    assert(initialState != null);
    assert(updatedState != null);
    return initialState(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initialState(_OnColorInitialState value),
    Result updatedState(_OnColorUpdatedState value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (initialState != null) {
      return initialState(this);
    }
    return orElse();
  }
}

abstract class _OnColorInitialState implements ColorState {
  factory _OnColorInitialState() = _$_OnColorInitialState;
}

abstract class _$OnColorUpdatedStateCopyWith<$Res> {
  factory _$OnColorUpdatedStateCopyWith(_OnColorUpdatedState value,
          $Res Function(_OnColorUpdatedState) then) =
      __$OnColorUpdatedStateCopyWithImpl<$Res>;
  $Res call({AppColors appColors});

  $AppColorsCopyWith<$Res> get appColors;
}

class __$OnColorUpdatedStateCopyWithImpl<$Res>
    extends _$ColorStateCopyWithImpl<$Res>
    implements _$OnColorUpdatedStateCopyWith<$Res> {
  __$OnColorUpdatedStateCopyWithImpl(
      _OnColorUpdatedState _value, $Res Function(_OnColorUpdatedState) _then)
      : super(_value, (v) => _then(v as _OnColorUpdatedState));

  @override
  _OnColorUpdatedState get _value => super._value as _OnColorUpdatedState;

  @override
  $Res call({
    Object appColors = freezed,
  }) {
    return _then(_OnColorUpdatedState(
      appColors:
          appColors == freezed ? _value.appColors : appColors as AppColors,
    ));
  }

  @override
  $AppColorsCopyWith<$Res> get appColors {
    if (_value.appColors == null) {
      return null;
    }
    return $AppColorsCopyWith<$Res>(_value.appColors, (value) {
      return _then(_value.copyWith(appColors: value));
    });
  }
}

class _$_OnColorUpdatedState
    with DiagnosticableTreeMixin
    implements _OnColorUpdatedState {
  _$_OnColorUpdatedState({this.appColors});

  @override
  final AppColors appColors;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ColorState.updatedState(appColors: $appColors)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ColorState.updatedState'))
      ..add(DiagnosticsProperty('appColors', appColors));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _OnColorUpdatedState &&
            (identical(other.appColors, appColors) ||
                const DeepCollectionEquality()
                    .equals(other.appColors, appColors)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(appColors);

  @override
  _$OnColorUpdatedStateCopyWith<_OnColorUpdatedState> get copyWith =>
      __$OnColorUpdatedStateCopyWithImpl<_OnColorUpdatedState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initialState(),
    @required Result updatedState(AppColors appColors),
  }) {
    assert(initialState != null);
    assert(updatedState != null);
    return updatedState(appColors);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initialState(),
    Result updatedState(AppColors appColors),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (updatedState != null) {
      return updatedState(appColors);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initialState(_OnColorInitialState value),
    @required Result updatedState(_OnColorUpdatedState value),
  }) {
    assert(initialState != null);
    assert(updatedState != null);
    return updatedState(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initialState(_OnColorInitialState value),
    Result updatedState(_OnColorUpdatedState value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (updatedState != null) {
      return updatedState(this);
    }
    return orElse();
  }
}

abstract class _OnColorUpdatedState implements ColorState {
  factory _OnColorUpdatedState({AppColors appColors}) = _$_OnColorUpdatedState;

  AppColors get appColors;
  _$OnColorUpdatedStateCopyWith<_OnColorUpdatedState> get copyWith;
}
