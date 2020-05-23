// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'game.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$GameTearOff {
  const _$GameTearOff();

  _Game call(
      {@required List<Player> players,
      @required String name,
      @required int pointsToWin,
      @required int numberOfPlayers,
      @required String winner,
      @required String createdAt}) {
    return _Game(
      players: players,
      name: name,
      pointsToWin: pointsToWin,
      numberOfPlayers: numberOfPlayers,
      winner: winner,
      createdAt: createdAt,
    );
  }
}

// ignore: unused_element
const $Game = _$GameTearOff();

mixin _$Game {
  List<Player> get players;
  String get name;
  int get pointsToWin;
  int get numberOfPlayers;
  String get winner;
  String get createdAt;

  $GameCopyWith<Game> get copyWith;
}

abstract class $GameCopyWith<$Res> {
  factory $GameCopyWith(Game value, $Res Function(Game) then) =
      _$GameCopyWithImpl<$Res>;
  $Res call(
      {List<Player> players,
      String name,
      int pointsToWin,
      int numberOfPlayers,
      String winner,
      String createdAt});
}

class _$GameCopyWithImpl<$Res> implements $GameCopyWith<$Res> {
  _$GameCopyWithImpl(this._value, this._then);

  final Game _value;
  // ignore: unused_field
  final $Res Function(Game) _then;

  @override
  $Res call({
    Object players = freezed,
    Object name = freezed,
    Object pointsToWin = freezed,
    Object numberOfPlayers = freezed,
    Object winner = freezed,
    Object createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      players: players == freezed ? _value.players : players as List<Player>,
      name: name == freezed ? _value.name : name as String,
      pointsToWin:
          pointsToWin == freezed ? _value.pointsToWin : pointsToWin as int,
      numberOfPlayers: numberOfPlayers == freezed
          ? _value.numberOfPlayers
          : numberOfPlayers as int,
      winner: winner == freezed ? _value.winner : winner as String,
      createdAt: createdAt == freezed ? _value.createdAt : createdAt as String,
    ));
  }
}

abstract class _$GameCopyWith<$Res> implements $GameCopyWith<$Res> {
  factory _$GameCopyWith(_Game value, $Res Function(_Game) then) =
      __$GameCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<Player> players,
      String name,
      int pointsToWin,
      int numberOfPlayers,
      String winner,
      String createdAt});
}

class __$GameCopyWithImpl<$Res> extends _$GameCopyWithImpl<$Res>
    implements _$GameCopyWith<$Res> {
  __$GameCopyWithImpl(_Game _value, $Res Function(_Game) _then)
      : super(_value, (v) => _then(v as _Game));

  @override
  _Game get _value => super._value as _Game;

  @override
  $Res call({
    Object players = freezed,
    Object name = freezed,
    Object pointsToWin = freezed,
    Object numberOfPlayers = freezed,
    Object winner = freezed,
    Object createdAt = freezed,
  }) {
    return _then(_Game(
      players: players == freezed ? _value.players : players as List<Player>,
      name: name == freezed ? _value.name : name as String,
      pointsToWin:
          pointsToWin == freezed ? _value.pointsToWin : pointsToWin as int,
      numberOfPlayers: numberOfPlayers == freezed
          ? _value.numberOfPlayers
          : numberOfPlayers as int,
      winner: winner == freezed ? _value.winner : winner as String,
      createdAt: createdAt == freezed ? _value.createdAt : createdAt as String,
    ));
  }
}

class _$_Game with DiagnosticableTreeMixin implements _Game {
  _$_Game(
      {@required this.players,
      @required this.name,
      @required this.pointsToWin,
      @required this.numberOfPlayers,
      @required this.winner,
      @required this.createdAt})
      : assert(players != null),
        assert(name != null),
        assert(pointsToWin != null),
        assert(numberOfPlayers != null),
        assert(winner != null),
        assert(createdAt != null);

  @override
  final List<Player> players;
  @override
  final String name;
  @override
  final int pointsToWin;
  @override
  final int numberOfPlayers;
  @override
  final String winner;
  @override
  final String createdAt;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Game(players: $players, name: $name, pointsToWin: $pointsToWin, numberOfPlayers: $numberOfPlayers, winner: $winner, createdAt: $createdAt)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Game'))
      ..add(DiagnosticsProperty('players', players))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('pointsToWin', pointsToWin))
      ..add(DiagnosticsProperty('numberOfPlayers', numberOfPlayers))
      ..add(DiagnosticsProperty('winner', winner))
      ..add(DiagnosticsProperty('createdAt', createdAt));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Game &&
            (identical(other.players, players) ||
                const DeepCollectionEquality()
                    .equals(other.players, players)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.pointsToWin, pointsToWin) ||
                const DeepCollectionEquality()
                    .equals(other.pointsToWin, pointsToWin)) &&
            (identical(other.numberOfPlayers, numberOfPlayers) ||
                const DeepCollectionEquality()
                    .equals(other.numberOfPlayers, numberOfPlayers)) &&
            (identical(other.winner, winner) ||
                const DeepCollectionEquality().equals(other.winner, winner)) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality()
                    .equals(other.createdAt, createdAt)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(players) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(pointsToWin) ^
      const DeepCollectionEquality().hash(numberOfPlayers) ^
      const DeepCollectionEquality().hash(winner) ^
      const DeepCollectionEquality().hash(createdAt);

  @override
  _$GameCopyWith<_Game> get copyWith =>
      __$GameCopyWithImpl<_Game>(this, _$identity);
}

abstract class _Game implements Game {
  factory _Game(
      {@required List<Player> players,
      @required String name,
      @required int pointsToWin,
      @required int numberOfPlayers,
      @required String winner,
      @required String createdAt}) = _$_Game;

  @override
  List<Player> get players;
  @override
  String get name;
  @override
  int get pointsToWin;
  @override
  int get numberOfPlayers;
  @override
  String get winner;
  @override
  String get createdAt;
  @override
  _$GameCopyWith<_Game> get copyWith;
}
