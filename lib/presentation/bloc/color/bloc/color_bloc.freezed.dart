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

  _OnScaffoldColorChange onScaffoldColorChange(Color newScaffoldColor) {
    return _OnScaffoldColorChange(
      newScaffoldColor,
    );
  }

  _OnErrorColorChange onErrorColorChange() {
    return _OnErrorColorChange();
  }

  _OnPrimaryColorChange onPrimaryColorChange() {
    return _OnPrimaryColorChange();
  }

  _OnAccentColorChange onAccentColorChange() {
    return _OnAccentColorChange();
  }
}

// ignore: unused_element
const $ColorEvent = _$ColorEventTearOff();

mixin _$ColorEvent {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result onGetCurrentAppColors(),
    @required Result onScaffoldColorChange(Color newScaffoldColor),
    @required Result onErrorColorChange(),
    @required Result onPrimaryColorChange(),
    @required Result onAccentColorChange(),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result onGetCurrentAppColors(),
    Result onScaffoldColorChange(Color newScaffoldColor),
    Result onErrorColorChange(),
    Result onPrimaryColorChange(),
    Result onAccentColorChange(),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result onGetCurrentAppColors(_OnGetCurrentAppColors value),
    @required Result onScaffoldColorChange(_OnScaffoldColorChange value),
    @required Result onErrorColorChange(_OnErrorColorChange value),
    @required Result onPrimaryColorChange(_OnPrimaryColorChange value),
    @required Result onAccentColorChange(_OnAccentColorChange value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result onGetCurrentAppColors(_OnGetCurrentAppColors value),
    Result onScaffoldColorChange(_OnScaffoldColorChange value),
    Result onErrorColorChange(_OnErrorColorChange value),
    Result onPrimaryColorChange(_OnPrimaryColorChange value),
    Result onAccentColorChange(_OnAccentColorChange value),
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
    @required Result onErrorColorChange(),
    @required Result onPrimaryColorChange(),
    @required Result onAccentColorChange(),
  }) {
    assert(onGetCurrentAppColors != null);
    assert(onScaffoldColorChange != null);
    assert(onErrorColorChange != null);
    assert(onPrimaryColorChange != null);
    assert(onAccentColorChange != null);
    return onGetCurrentAppColors();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result onGetCurrentAppColors(),
    Result onScaffoldColorChange(Color newScaffoldColor),
    Result onErrorColorChange(),
    Result onPrimaryColorChange(),
    Result onAccentColorChange(),
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
  }) {
    assert(onGetCurrentAppColors != null);
    assert(onScaffoldColorChange != null);
    assert(onErrorColorChange != null);
    assert(onPrimaryColorChange != null);
    assert(onAccentColorChange != null);
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
      newScaffoldColor == freezed
          ? _value.newScaffoldColor
          : newScaffoldColor as Color,
    ));
  }
}

class _$_OnScaffoldColorChange
    with DiagnosticableTreeMixin
    implements _OnScaffoldColorChange {
  _$_OnScaffoldColorChange(this.newScaffoldColor)
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
    @required Result onErrorColorChange(),
    @required Result onPrimaryColorChange(),
    @required Result onAccentColorChange(),
  }) {
    assert(onGetCurrentAppColors != null);
    assert(onScaffoldColorChange != null);
    assert(onErrorColorChange != null);
    assert(onPrimaryColorChange != null);
    assert(onAccentColorChange != null);
    return onScaffoldColorChange(newScaffoldColor);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result onGetCurrentAppColors(),
    Result onScaffoldColorChange(Color newScaffoldColor),
    Result onErrorColorChange(),
    Result onPrimaryColorChange(),
    Result onAccentColorChange(),
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
  }) {
    assert(onGetCurrentAppColors != null);
    assert(onScaffoldColorChange != null);
    assert(onErrorColorChange != null);
    assert(onPrimaryColorChange != null);
    assert(onAccentColorChange != null);
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
  factory _OnScaffoldColorChange(Color newScaffoldColor) =
      _$_OnScaffoldColorChange;

  Color get newScaffoldColor;
  _$OnScaffoldColorChangeCopyWith<_OnScaffoldColorChange> get copyWith;
}

abstract class _$OnErrorColorChangeCopyWith<$Res> {
  factory _$OnErrorColorChangeCopyWith(
          _OnErrorColorChange value, $Res Function(_OnErrorColorChange) then) =
      __$OnErrorColorChangeCopyWithImpl<$Res>;
}

class __$OnErrorColorChangeCopyWithImpl<$Res>
    extends _$ColorEventCopyWithImpl<$Res>
    implements _$OnErrorColorChangeCopyWith<$Res> {
  __$OnErrorColorChangeCopyWithImpl(
      _OnErrorColorChange _value, $Res Function(_OnErrorColorChange) _then)
      : super(_value, (v) => _then(v as _OnErrorColorChange));

  @override
  _OnErrorColorChange get _value => super._value as _OnErrorColorChange;
}

class _$_OnErrorColorChange
    with DiagnosticableTreeMixin
    implements _OnErrorColorChange {
  _$_OnErrorColorChange();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ColorEvent.onErrorColorChange()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ColorEvent.onErrorColorChange'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _OnErrorColorChange);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result onGetCurrentAppColors(),
    @required Result onScaffoldColorChange(Color newScaffoldColor),
    @required Result onErrorColorChange(),
    @required Result onPrimaryColorChange(),
    @required Result onAccentColorChange(),
  }) {
    assert(onGetCurrentAppColors != null);
    assert(onScaffoldColorChange != null);
    assert(onErrorColorChange != null);
    assert(onPrimaryColorChange != null);
    assert(onAccentColorChange != null);
    return onErrorColorChange();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result onGetCurrentAppColors(),
    Result onScaffoldColorChange(Color newScaffoldColor),
    Result onErrorColorChange(),
    Result onPrimaryColorChange(),
    Result onAccentColorChange(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (onErrorColorChange != null) {
      return onErrorColorChange();
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
  }) {
    assert(onGetCurrentAppColors != null);
    assert(onScaffoldColorChange != null);
    assert(onErrorColorChange != null);
    assert(onPrimaryColorChange != null);
    assert(onAccentColorChange != null);
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
  factory _OnErrorColorChange() = _$_OnErrorColorChange;
}

abstract class _$OnPrimaryColorChangeCopyWith<$Res> {
  factory _$OnPrimaryColorChangeCopyWith(_OnPrimaryColorChange value,
          $Res Function(_OnPrimaryColorChange) then) =
      __$OnPrimaryColorChangeCopyWithImpl<$Res>;
}

class __$OnPrimaryColorChangeCopyWithImpl<$Res>
    extends _$ColorEventCopyWithImpl<$Res>
    implements _$OnPrimaryColorChangeCopyWith<$Res> {
  __$OnPrimaryColorChangeCopyWithImpl(
      _OnPrimaryColorChange _value, $Res Function(_OnPrimaryColorChange) _then)
      : super(_value, (v) => _then(v as _OnPrimaryColorChange));

  @override
  _OnPrimaryColorChange get _value => super._value as _OnPrimaryColorChange;
}

class _$_OnPrimaryColorChange
    with DiagnosticableTreeMixin
    implements _OnPrimaryColorChange {
  _$_OnPrimaryColorChange();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ColorEvent.onPrimaryColorChange()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ColorEvent.onPrimaryColorChange'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _OnPrimaryColorChange);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result onGetCurrentAppColors(),
    @required Result onScaffoldColorChange(Color newScaffoldColor),
    @required Result onErrorColorChange(),
    @required Result onPrimaryColorChange(),
    @required Result onAccentColorChange(),
  }) {
    assert(onGetCurrentAppColors != null);
    assert(onScaffoldColorChange != null);
    assert(onErrorColorChange != null);
    assert(onPrimaryColorChange != null);
    assert(onAccentColorChange != null);
    return onPrimaryColorChange();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result onGetCurrentAppColors(),
    Result onScaffoldColorChange(Color newScaffoldColor),
    Result onErrorColorChange(),
    Result onPrimaryColorChange(),
    Result onAccentColorChange(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (onPrimaryColorChange != null) {
      return onPrimaryColorChange();
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
  }) {
    assert(onGetCurrentAppColors != null);
    assert(onScaffoldColorChange != null);
    assert(onErrorColorChange != null);
    assert(onPrimaryColorChange != null);
    assert(onAccentColorChange != null);
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
  factory _OnPrimaryColorChange() = _$_OnPrimaryColorChange;
}

abstract class _$OnAccentColorChangeCopyWith<$Res> {
  factory _$OnAccentColorChangeCopyWith(_OnAccentColorChange value,
          $Res Function(_OnAccentColorChange) then) =
      __$OnAccentColorChangeCopyWithImpl<$Res>;
}

class __$OnAccentColorChangeCopyWithImpl<$Res>
    extends _$ColorEventCopyWithImpl<$Res>
    implements _$OnAccentColorChangeCopyWith<$Res> {
  __$OnAccentColorChangeCopyWithImpl(
      _OnAccentColorChange _value, $Res Function(_OnAccentColorChange) _then)
      : super(_value, (v) => _then(v as _OnAccentColorChange));

  @override
  _OnAccentColorChange get _value => super._value as _OnAccentColorChange;
}

class _$_OnAccentColorChange
    with DiagnosticableTreeMixin
    implements _OnAccentColorChange {
  _$_OnAccentColorChange();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ColorEvent.onAccentColorChange()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ColorEvent.onAccentColorChange'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _OnAccentColorChange);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result onGetCurrentAppColors(),
    @required Result onScaffoldColorChange(Color newScaffoldColor),
    @required Result onErrorColorChange(),
    @required Result onPrimaryColorChange(),
    @required Result onAccentColorChange(),
  }) {
    assert(onGetCurrentAppColors != null);
    assert(onScaffoldColorChange != null);
    assert(onErrorColorChange != null);
    assert(onPrimaryColorChange != null);
    assert(onAccentColorChange != null);
    return onAccentColorChange();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result onGetCurrentAppColors(),
    Result onScaffoldColorChange(Color newScaffoldColor),
    Result onErrorColorChange(),
    Result onPrimaryColorChange(),
    Result onAccentColorChange(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (onAccentColorChange != null) {
      return onAccentColorChange();
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
  }) {
    assert(onGetCurrentAppColors != null);
    assert(onScaffoldColorChange != null);
    assert(onErrorColorChange != null);
    assert(onPrimaryColorChange != null);
    assert(onAccentColorChange != null);
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
  factory _OnAccentColorChange() = _$_OnAccentColorChange;
}
