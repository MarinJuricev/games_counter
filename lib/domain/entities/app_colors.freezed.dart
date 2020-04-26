// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'app_colors.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$AppColorsTearOff {
  const _$AppColorsTearOff();

  _AppColors call(
      {String backGroundColor,
      String accentColor,
      String errorColor,
      String primaryColor}) {
    return _AppColors(
      backGroundColor: backGroundColor,
      accentColor: accentColor,
      errorColor: errorColor,
      primaryColor: primaryColor,
    );
  }
}

// ignore: unused_element
const $AppColors = _$AppColorsTearOff();

mixin _$AppColors {
  String get backGroundColor;
  String get accentColor;
  String get errorColor;
  String get primaryColor;

  $AppColorsCopyWith<AppColors> get copyWith;
}

abstract class $AppColorsCopyWith<$Res> {
  factory $AppColorsCopyWith(AppColors value, $Res Function(AppColors) then) =
      _$AppColorsCopyWithImpl<$Res>;
  $Res call(
      {String backGroundColor,
      String accentColor,
      String errorColor,
      String primaryColor});
}

class _$AppColorsCopyWithImpl<$Res> implements $AppColorsCopyWith<$Res> {
  _$AppColorsCopyWithImpl(this._value, this._then);

  final AppColors _value;
  // ignore: unused_field
  final $Res Function(AppColors) _then;

  @override
  $Res call({
    Object backGroundColor = freezed,
    Object accentColor = freezed,
    Object errorColor = freezed,
    Object primaryColor = freezed,
  }) {
    return _then(_value.copyWith(
      backGroundColor: backGroundColor == freezed
          ? _value.backGroundColor
          : backGroundColor as String,
      accentColor:
          accentColor == freezed ? _value.accentColor : accentColor as String,
      errorColor:
          errorColor == freezed ? _value.errorColor : errorColor as String,
      primaryColor: primaryColor == freezed
          ? _value.primaryColor
          : primaryColor as String,
    ));
  }
}

abstract class _$AppColorsCopyWith<$Res> implements $AppColorsCopyWith<$Res> {
  factory _$AppColorsCopyWith(
          _AppColors value, $Res Function(_AppColors) then) =
      __$AppColorsCopyWithImpl<$Res>;
  @override
  $Res call(
      {String backGroundColor,
      String accentColor,
      String errorColor,
      String primaryColor});
}

class __$AppColorsCopyWithImpl<$Res> extends _$AppColorsCopyWithImpl<$Res>
    implements _$AppColorsCopyWith<$Res> {
  __$AppColorsCopyWithImpl(_AppColors _value, $Res Function(_AppColors) _then)
      : super(_value, (v) => _then(v as _AppColors));

  @override
  _AppColors get _value => super._value as _AppColors;

  @override
  $Res call({
    Object backGroundColor = freezed,
    Object accentColor = freezed,
    Object errorColor = freezed,
    Object primaryColor = freezed,
  }) {
    return _then(_AppColors(
      backGroundColor: backGroundColor == freezed
          ? _value.backGroundColor
          : backGroundColor as String,
      accentColor:
          accentColor == freezed ? _value.accentColor : accentColor as String,
      errorColor:
          errorColor == freezed ? _value.errorColor : errorColor as String,
      primaryColor: primaryColor == freezed
          ? _value.primaryColor
          : primaryColor as String,
    ));
  }
}

class _$_AppColors with DiagnosticableTreeMixin implements _AppColors {
  _$_AppColors(
      {this.backGroundColor,
      this.accentColor,
      this.errorColor,
      this.primaryColor});

  @override
  final String backGroundColor;
  @override
  final String accentColor;
  @override
  final String errorColor;
  @override
  final String primaryColor;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AppColors(backGroundColor: $backGroundColor, accentColor: $accentColor, errorColor: $errorColor, primaryColor: $primaryColor)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AppColors'))
      ..add(DiagnosticsProperty('backGroundColor', backGroundColor))
      ..add(DiagnosticsProperty('accentColor', accentColor))
      ..add(DiagnosticsProperty('errorColor', errorColor))
      ..add(DiagnosticsProperty('primaryColor', primaryColor));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AppColors &&
            (identical(other.backGroundColor, backGroundColor) ||
                const DeepCollectionEquality()
                    .equals(other.backGroundColor, backGroundColor)) &&
            (identical(other.accentColor, accentColor) ||
                const DeepCollectionEquality()
                    .equals(other.accentColor, accentColor)) &&
            (identical(other.errorColor, errorColor) ||
                const DeepCollectionEquality()
                    .equals(other.errorColor, errorColor)) &&
            (identical(other.primaryColor, primaryColor) ||
                const DeepCollectionEquality()
                    .equals(other.primaryColor, primaryColor)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(backGroundColor) ^
      const DeepCollectionEquality().hash(accentColor) ^
      const DeepCollectionEquality().hash(errorColor) ^
      const DeepCollectionEquality().hash(primaryColor);

  @override
  _$AppColorsCopyWith<_AppColors> get copyWith =>
      __$AppColorsCopyWithImpl<_AppColors>(this, _$identity);
}

abstract class _AppColors implements AppColors {
  factory _AppColors(
      {String backGroundColor,
      String accentColor,
      String errorColor,
      String primaryColor}) = _$_AppColors;

  @override
  String get backGroundColor;
  @override
  String get accentColor;
  @override
  String get errorColor;
  @override
  String get primaryColor;
  @override
  _$AppColorsCopyWith<_AppColors> get copyWith;
}
