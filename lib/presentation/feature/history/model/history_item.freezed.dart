// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'history_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$HistoryItemTearOff {
  const _$HistoryItemTearOff();

  _HistoryItem call(
      {@required bool isExpanded,
      @required String createdAt,
      @required String gameTitle,
      @required String gameWinner,
      @required String highlightedGameTitle,
      @required String nonHighlightedGameTitle,
      @required List<Player> playersSortedByPoints}) {
    return _HistoryItem(
      isExpanded: isExpanded,
      createdAt: createdAt,
      gameTitle: gameTitle,
      gameWinner: gameWinner,
      highlightedGameTitle: highlightedGameTitle,
      nonHighlightedGameTitle: nonHighlightedGameTitle,
      playersSortedByPoints: playersSortedByPoints,
    );
  }
}

// ignore: unused_element
const $HistoryItem = _$HistoryItemTearOff();

mixin _$HistoryItem {
  bool get isExpanded;
  String get createdAt;
  String get gameTitle;
  String get gameWinner;
  String get highlightedGameTitle;
  String get nonHighlightedGameTitle;
  List<Player> get playersSortedByPoints;

  $HistoryItemCopyWith<HistoryItem> get copyWith;
}

abstract class $HistoryItemCopyWith<$Res> {
  factory $HistoryItemCopyWith(
          HistoryItem value, $Res Function(HistoryItem) then) =
      _$HistoryItemCopyWithImpl<$Res>;
  $Res call(
      {bool isExpanded,
      String createdAt,
      String gameTitle,
      String gameWinner,
      String highlightedGameTitle,
      String nonHighlightedGameTitle,
      List<Player> playersSortedByPoints});
}

class _$HistoryItemCopyWithImpl<$Res> implements $HistoryItemCopyWith<$Res> {
  _$HistoryItemCopyWithImpl(this._value, this._then);

  final HistoryItem _value;
  // ignore: unused_field
  final $Res Function(HistoryItem) _then;

  @override
  $Res call({
    Object isExpanded = freezed,
    Object createdAt = freezed,
    Object gameTitle = freezed,
    Object gameWinner = freezed,
    Object highlightedGameTitle = freezed,
    Object nonHighlightedGameTitle = freezed,
    Object playersSortedByPoints = freezed,
  }) {
    return _then(_value.copyWith(
      isExpanded:
          isExpanded == freezed ? _value.isExpanded : isExpanded as bool,
      createdAt: createdAt == freezed ? _value.createdAt : createdAt as String,
      gameTitle: gameTitle == freezed ? _value.gameTitle : gameTitle as String,
      gameWinner:
          gameWinner == freezed ? _value.gameWinner : gameWinner as String,
      highlightedGameTitle: highlightedGameTitle == freezed
          ? _value.highlightedGameTitle
          : highlightedGameTitle as String,
      nonHighlightedGameTitle: nonHighlightedGameTitle == freezed
          ? _value.nonHighlightedGameTitle
          : nonHighlightedGameTitle as String,
      playersSortedByPoints: playersSortedByPoints == freezed
          ? _value.playersSortedByPoints
          : playersSortedByPoints as List<Player>,
    ));
  }
}

abstract class _$HistoryItemCopyWith<$Res>
    implements $HistoryItemCopyWith<$Res> {
  factory _$HistoryItemCopyWith(
          _HistoryItem value, $Res Function(_HistoryItem) then) =
      __$HistoryItemCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isExpanded,
      String createdAt,
      String gameTitle,
      String gameWinner,
      String highlightedGameTitle,
      String nonHighlightedGameTitle,
      List<Player> playersSortedByPoints});
}

class __$HistoryItemCopyWithImpl<$Res> extends _$HistoryItemCopyWithImpl<$Res>
    implements _$HistoryItemCopyWith<$Res> {
  __$HistoryItemCopyWithImpl(
      _HistoryItem _value, $Res Function(_HistoryItem) _then)
      : super(_value, (v) => _then(v as _HistoryItem));

  @override
  _HistoryItem get _value => super._value as _HistoryItem;

  @override
  $Res call({
    Object isExpanded = freezed,
    Object createdAt = freezed,
    Object gameTitle = freezed,
    Object gameWinner = freezed,
    Object highlightedGameTitle = freezed,
    Object nonHighlightedGameTitle = freezed,
    Object playersSortedByPoints = freezed,
  }) {
    return _then(_HistoryItem(
      isExpanded:
          isExpanded == freezed ? _value.isExpanded : isExpanded as bool,
      createdAt: createdAt == freezed ? _value.createdAt : createdAt as String,
      gameTitle: gameTitle == freezed ? _value.gameTitle : gameTitle as String,
      gameWinner:
          gameWinner == freezed ? _value.gameWinner : gameWinner as String,
      highlightedGameTitle: highlightedGameTitle == freezed
          ? _value.highlightedGameTitle
          : highlightedGameTitle as String,
      nonHighlightedGameTitle: nonHighlightedGameTitle == freezed
          ? _value.nonHighlightedGameTitle
          : nonHighlightedGameTitle as String,
      playersSortedByPoints: playersSortedByPoints == freezed
          ? _value.playersSortedByPoints
          : playersSortedByPoints as List<Player>,
    ));
  }
}

class _$_HistoryItem with DiagnosticableTreeMixin implements _HistoryItem {
  _$_HistoryItem(
      {@required this.isExpanded,
      @required this.createdAt,
      @required this.gameTitle,
      @required this.gameWinner,
      @required this.highlightedGameTitle,
      @required this.nonHighlightedGameTitle,
      @required this.playersSortedByPoints})
      : assert(isExpanded != null),
        assert(createdAt != null),
        assert(gameTitle != null),
        assert(gameWinner != null),
        assert(highlightedGameTitle != null),
        assert(nonHighlightedGameTitle != null),
        assert(playersSortedByPoints != null);

  @override
  final bool isExpanded;
  @override
  final String createdAt;
  @override
  final String gameTitle;
  @override
  final String gameWinner;
  @override
  final String highlightedGameTitle;
  @override
  final String nonHighlightedGameTitle;
  @override
  final List<Player> playersSortedByPoints;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'HistoryItem(isExpanded: $isExpanded, createdAt: $createdAt, gameTitle: $gameTitle, gameWinner: $gameWinner, highlightedGameTitle: $highlightedGameTitle, nonHighlightedGameTitle: $nonHighlightedGameTitle, playersSortedByPoints: $playersSortedByPoints)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'HistoryItem'))
      ..add(DiagnosticsProperty('isExpanded', isExpanded))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('gameTitle', gameTitle))
      ..add(DiagnosticsProperty('gameWinner', gameWinner))
      ..add(DiagnosticsProperty('highlightedGameTitle', highlightedGameTitle))
      ..add(DiagnosticsProperty(
          'nonHighlightedGameTitle', nonHighlightedGameTitle))
      ..add(
          DiagnosticsProperty('playersSortedByPoints', playersSortedByPoints));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _HistoryItem &&
            (identical(other.isExpanded, isExpanded) ||
                const DeepCollectionEquality()
                    .equals(other.isExpanded, isExpanded)) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality()
                    .equals(other.createdAt, createdAt)) &&
            (identical(other.gameTitle, gameTitle) ||
                const DeepCollectionEquality()
                    .equals(other.gameTitle, gameTitle)) &&
            (identical(other.gameWinner, gameWinner) ||
                const DeepCollectionEquality()
                    .equals(other.gameWinner, gameWinner)) &&
            (identical(other.highlightedGameTitle, highlightedGameTitle) ||
                const DeepCollectionEquality().equals(
                    other.highlightedGameTitle, highlightedGameTitle)) &&
            (identical(
                    other.nonHighlightedGameTitle, nonHighlightedGameTitle) ||
                const DeepCollectionEquality().equals(
                    other.nonHighlightedGameTitle, nonHighlightedGameTitle)) &&
            (identical(other.playersSortedByPoints, playersSortedByPoints) ||
                const DeepCollectionEquality().equals(
                    other.playersSortedByPoints, playersSortedByPoints)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(isExpanded) ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(gameTitle) ^
      const DeepCollectionEquality().hash(gameWinner) ^
      const DeepCollectionEquality().hash(highlightedGameTitle) ^
      const DeepCollectionEquality().hash(nonHighlightedGameTitle) ^
      const DeepCollectionEquality().hash(playersSortedByPoints);

  @override
  _$HistoryItemCopyWith<_HistoryItem> get copyWith =>
      __$HistoryItemCopyWithImpl<_HistoryItem>(this, _$identity);
}

abstract class _HistoryItem implements HistoryItem {
  factory _HistoryItem(
      {@required bool isExpanded,
      @required String createdAt,
      @required String gameTitle,
      @required String gameWinner,
      @required String highlightedGameTitle,
      @required String nonHighlightedGameTitle,
      @required List<Player> playersSortedByPoints}) = _$_HistoryItem;

  @override
  bool get isExpanded;
  @override
  String get createdAt;
  @override
  String get gameTitle;
  @override
  String get gameWinner;
  @override
  String get highlightedGameTitle;
  @override
  String get nonHighlightedGameTitle;
  @override
  List<Player> get playersSortedByPoints;
  @override
  _$HistoryItemCopyWith<_HistoryItem> get copyWith;
}
