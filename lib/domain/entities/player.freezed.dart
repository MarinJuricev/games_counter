// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'player.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$PlayerTearOff {
  const _$PlayerTearOff();

  _Player call(
      {@required String name,
      @required int points,
      @required int bonusPoints}) {
    return _Player(
      name: name,
      points: points,
      bonusPoints: bonusPoints,
    );
  }
}

// ignore: unused_element
const $Player = _$PlayerTearOff();

mixin _$Player {
  String get name;
  int get points;
  int get bonusPoints;

  $PlayerCopyWith<Player> get copyWith;
}

abstract class $PlayerCopyWith<$Res> {
  factory $PlayerCopyWith(Player value, $Res Function(Player) then) =
      _$PlayerCopyWithImpl<$Res>;
  $Res call({String name, int points, int bonusPoints});
}

class _$PlayerCopyWithImpl<$Res> implements $PlayerCopyWith<$Res> {
  _$PlayerCopyWithImpl(this._value, this._then);

  final Player _value;
  // ignore: unused_field
  final $Res Function(Player) _then;

  @override
  $Res call({
    Object name = freezed,
    Object points = freezed,
    Object bonusPoints = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed ? _value.name : name as String,
      points: points == freezed ? _value.points : points as int,
      bonusPoints:
          bonusPoints == freezed ? _value.bonusPoints : bonusPoints as int,
    ));
  }
}

abstract class _$PlayerCopyWith<$Res> implements $PlayerCopyWith<$Res> {
  factory _$PlayerCopyWith(_Player value, $Res Function(_Player) then) =
      __$PlayerCopyWithImpl<$Res>;
  @override
  $Res call({String name, int points, int bonusPoints});
}

class __$PlayerCopyWithImpl<$Res> extends _$PlayerCopyWithImpl<$Res>
    implements _$PlayerCopyWith<$Res> {
  __$PlayerCopyWithImpl(_Player _value, $Res Function(_Player) _then)
      : super(_value, (v) => _then(v as _Player));

  @override
  _Player get _value => super._value as _Player;

  @override
  $Res call({
    Object name = freezed,
    Object points = freezed,
    Object bonusPoints = freezed,
  }) {
    return _then(_Player(
      name: name == freezed ? _value.name : name as String,
      points: points == freezed ? _value.points : points as int,
      bonusPoints:
          bonusPoints == freezed ? _value.bonusPoints : bonusPoints as int,
    ));
  }
}

class _$_Player extends _Player with DiagnosticableTreeMixin {
  _$_Player(
      {@required this.name, @required this.points, @required this.bonusPoints})
      : assert(name != null),
        assert(points != null),
        assert(bonusPoints != null),
        super._();

  @override
  final String name;
  @override
  final int points;
  @override
  final int bonusPoints;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Player(name: $name, points: $points, bonusPoints: $bonusPoints)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Player'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('points', points))
      ..add(DiagnosticsProperty('bonusPoints', bonusPoints));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Player &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.points, points) ||
                const DeepCollectionEquality().equals(other.points, points)) &&
            (identical(other.bonusPoints, bonusPoints) ||
                const DeepCollectionEquality()
                    .equals(other.bonusPoints, bonusPoints)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(points) ^
      const DeepCollectionEquality().hash(bonusPoints);

  @override
  _$PlayerCopyWith<_Player> get copyWith =>
      __$PlayerCopyWithImpl<_Player>(this, _$identity);
}

abstract class _Player extends Player {
  _Player._() : super._();
  factory _Player(
      {@required String name,
      @required int points,
      @required int bonusPoints}) = _$_Player;

  @override
  String get name;
  @override
  int get points;
  @override
  int get bonusPoints;
  @override
  _$PlayerCopyWith<_Player> get copyWith;
}
