// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'player_detail_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$PlayerDetailEventTearOff {
  const _$PlayerDetailEventTearOff();

  _OnSaveClicked saveClicked(
      {@required int newMainPoints,
      @required int newBonusPoints,
      @required Player currentPlayer}) {
    return _OnSaveClicked(
      newMainPoints: newMainPoints,
      newBonusPoints: newBonusPoints,
      currentPlayer: currentPlayer,
    );
  }

  _OnResetClicked resetClicked({@required Player currentPlayer}) {
    return _OnResetClicked(
      currentPlayer: currentPlayer,
    );
  }
}

// ignore: unused_element
const $PlayerDetailEvent = _$PlayerDetailEventTearOff();

mixin _$PlayerDetailEvent {
  Player get currentPlayer;

  @optionalTypeArgs
  Result when<Result extends Object>({
    @required
        Result saveClicked(
            int newMainPoints, int newBonusPoints, Player currentPlayer),
    @required Result resetClicked(Player currentPlayer),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result saveClicked(
        int newMainPoints, int newBonusPoints, Player currentPlayer),
    Result resetClicked(Player currentPlayer),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result saveClicked(_OnSaveClicked value),
    @required Result resetClicked(_OnResetClicked value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result saveClicked(_OnSaveClicked value),
    Result resetClicked(_OnResetClicked value),
    @required Result orElse(),
  });

  $PlayerDetailEventCopyWith<PlayerDetailEvent> get copyWith;
}

abstract class $PlayerDetailEventCopyWith<$Res> {
  factory $PlayerDetailEventCopyWith(
          PlayerDetailEvent value, $Res Function(PlayerDetailEvent) then) =
      _$PlayerDetailEventCopyWithImpl<$Res>;
  $Res call({Player currentPlayer});

  $PlayerCopyWith<$Res> get currentPlayer;
}

class _$PlayerDetailEventCopyWithImpl<$Res>
    implements $PlayerDetailEventCopyWith<$Res> {
  _$PlayerDetailEventCopyWithImpl(this._value, this._then);

  final PlayerDetailEvent _value;
  // ignore: unused_field
  final $Res Function(PlayerDetailEvent) _then;

  @override
  $Res call({
    Object currentPlayer = freezed,
  }) {
    return _then(_value.copyWith(
      currentPlayer: currentPlayer == freezed
          ? _value.currentPlayer
          : currentPlayer as Player,
    ));
  }

  @override
  $PlayerCopyWith<$Res> get currentPlayer {
    if (_value.currentPlayer == null) {
      return null;
    }
    return $PlayerCopyWith<$Res>(_value.currentPlayer, (value) {
      return _then(_value.copyWith(currentPlayer: value));
    });
  }
}

abstract class _$OnSaveClickedCopyWith<$Res>
    implements $PlayerDetailEventCopyWith<$Res> {
  factory _$OnSaveClickedCopyWith(
          _OnSaveClicked value, $Res Function(_OnSaveClicked) then) =
      __$OnSaveClickedCopyWithImpl<$Res>;
  @override
  $Res call({int newMainPoints, int newBonusPoints, Player currentPlayer});

  @override
  $PlayerCopyWith<$Res> get currentPlayer;
}

class __$OnSaveClickedCopyWithImpl<$Res>
    extends _$PlayerDetailEventCopyWithImpl<$Res>
    implements _$OnSaveClickedCopyWith<$Res> {
  __$OnSaveClickedCopyWithImpl(
      _OnSaveClicked _value, $Res Function(_OnSaveClicked) _then)
      : super(_value, (v) => _then(v as _OnSaveClicked));

  @override
  _OnSaveClicked get _value => super._value as _OnSaveClicked;

  @override
  $Res call({
    Object newMainPoints = freezed,
    Object newBonusPoints = freezed,
    Object currentPlayer = freezed,
  }) {
    return _then(_OnSaveClicked(
      newMainPoints: newMainPoints == freezed
          ? _value.newMainPoints
          : newMainPoints as int,
      newBonusPoints: newBonusPoints == freezed
          ? _value.newBonusPoints
          : newBonusPoints as int,
      currentPlayer: currentPlayer == freezed
          ? _value.currentPlayer
          : currentPlayer as Player,
    ));
  }
}

class _$_OnSaveClicked with DiagnosticableTreeMixin implements _OnSaveClicked {
  _$_OnSaveClicked(
      {@required this.newMainPoints,
      @required this.newBonusPoints,
      @required this.currentPlayer})
      : assert(newMainPoints != null),
        assert(newBonusPoints != null),
        assert(currentPlayer != null);

  @override
  final int newMainPoints;
  @override
  final int newBonusPoints;
  @override
  final Player currentPlayer;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PlayerDetailEvent.saveClicked(newMainPoints: $newMainPoints, newBonusPoints: $newBonusPoints, currentPlayer: $currentPlayer)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PlayerDetailEvent.saveClicked'))
      ..add(DiagnosticsProperty('newMainPoints', newMainPoints))
      ..add(DiagnosticsProperty('newBonusPoints', newBonusPoints))
      ..add(DiagnosticsProperty('currentPlayer', currentPlayer));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _OnSaveClicked &&
            (identical(other.newMainPoints, newMainPoints) ||
                const DeepCollectionEquality()
                    .equals(other.newMainPoints, newMainPoints)) &&
            (identical(other.newBonusPoints, newBonusPoints) ||
                const DeepCollectionEquality()
                    .equals(other.newBonusPoints, newBonusPoints)) &&
            (identical(other.currentPlayer, currentPlayer) ||
                const DeepCollectionEquality()
                    .equals(other.currentPlayer, currentPlayer)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(newMainPoints) ^
      const DeepCollectionEquality().hash(newBonusPoints) ^
      const DeepCollectionEquality().hash(currentPlayer);

  @override
  _$OnSaveClickedCopyWith<_OnSaveClicked> get copyWith =>
      __$OnSaveClickedCopyWithImpl<_OnSaveClicked>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required
        Result saveClicked(
            int newMainPoints, int newBonusPoints, Player currentPlayer),
    @required Result resetClicked(Player currentPlayer),
  }) {
    assert(saveClicked != null);
    assert(resetClicked != null);
    return saveClicked(newMainPoints, newBonusPoints, currentPlayer);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result saveClicked(
        int newMainPoints, int newBonusPoints, Player currentPlayer),
    Result resetClicked(Player currentPlayer),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (saveClicked != null) {
      return saveClicked(newMainPoints, newBonusPoints, currentPlayer);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result saveClicked(_OnSaveClicked value),
    @required Result resetClicked(_OnResetClicked value),
  }) {
    assert(saveClicked != null);
    assert(resetClicked != null);
    return saveClicked(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result saveClicked(_OnSaveClicked value),
    Result resetClicked(_OnResetClicked value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (saveClicked != null) {
      return saveClicked(this);
    }
    return orElse();
  }
}

abstract class _OnSaveClicked implements PlayerDetailEvent {
  factory _OnSaveClicked(
      {@required int newMainPoints,
      @required int newBonusPoints,
      @required Player currentPlayer}) = _$_OnSaveClicked;

  int get newMainPoints;
  int get newBonusPoints;
  @override
  Player get currentPlayer;
  @override
  _$OnSaveClickedCopyWith<_OnSaveClicked> get copyWith;
}

abstract class _$OnResetClickedCopyWith<$Res>
    implements $PlayerDetailEventCopyWith<$Res> {
  factory _$OnResetClickedCopyWith(
          _OnResetClicked value, $Res Function(_OnResetClicked) then) =
      __$OnResetClickedCopyWithImpl<$Res>;
  @override
  $Res call({Player currentPlayer});

  @override
  $PlayerCopyWith<$Res> get currentPlayer;
}

class __$OnResetClickedCopyWithImpl<$Res>
    extends _$PlayerDetailEventCopyWithImpl<$Res>
    implements _$OnResetClickedCopyWith<$Res> {
  __$OnResetClickedCopyWithImpl(
      _OnResetClicked _value, $Res Function(_OnResetClicked) _then)
      : super(_value, (v) => _then(v as _OnResetClicked));

  @override
  _OnResetClicked get _value => super._value as _OnResetClicked;

  @override
  $Res call({
    Object currentPlayer = freezed,
  }) {
    return _then(_OnResetClicked(
      currentPlayer: currentPlayer == freezed
          ? _value.currentPlayer
          : currentPlayer as Player,
    ));
  }
}

class _$_OnResetClicked
    with DiagnosticableTreeMixin
    implements _OnResetClicked {
  _$_OnResetClicked({@required this.currentPlayer})
      : assert(currentPlayer != null);

  @override
  final Player currentPlayer;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PlayerDetailEvent.resetClicked(currentPlayer: $currentPlayer)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PlayerDetailEvent.resetClicked'))
      ..add(DiagnosticsProperty('currentPlayer', currentPlayer));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _OnResetClicked &&
            (identical(other.currentPlayer, currentPlayer) ||
                const DeepCollectionEquality()
                    .equals(other.currentPlayer, currentPlayer)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(currentPlayer);

  @override
  _$OnResetClickedCopyWith<_OnResetClicked> get copyWith =>
      __$OnResetClickedCopyWithImpl<_OnResetClicked>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required
        Result saveClicked(
            int newMainPoints, int newBonusPoints, Player currentPlayer),
    @required Result resetClicked(Player currentPlayer),
  }) {
    assert(saveClicked != null);
    assert(resetClicked != null);
    return resetClicked(currentPlayer);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result saveClicked(
        int newMainPoints, int newBonusPoints, Player currentPlayer),
    Result resetClicked(Player currentPlayer),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (resetClicked != null) {
      return resetClicked(currentPlayer);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result saveClicked(_OnSaveClicked value),
    @required Result resetClicked(_OnResetClicked value),
  }) {
    assert(saveClicked != null);
    assert(resetClicked != null);
    return resetClicked(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result saveClicked(_OnSaveClicked value),
    Result resetClicked(_OnResetClicked value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (resetClicked != null) {
      return resetClicked(this);
    }
    return orElse();
  }
}

abstract class _OnResetClicked implements PlayerDetailEvent {
  factory _OnResetClicked({@required Player currentPlayer}) = _$_OnResetClicked;

  @override
  Player get currentPlayer;
  @override
  _$OnResetClickedCopyWith<_OnResetClicked> get copyWith;
}

class _$PlayerDetailStateTearOff {
  const _$PlayerDetailStateTearOff();

  _OnPlayerDetailState initialState() {
    return _OnPlayerDetailState();
  }

  _OnPlayerResetState resetState() {
    return _OnPlayerResetState();
  }

  _OnPlayerSaveTriggered saveTriggered() {
    return _OnPlayerSaveTriggered();
  }

  _OnPlayerUpdatedState updatedState({Player player}) {
    return _OnPlayerUpdatedState(
      player: player,
    );
  }

  _OnPlayerErrorState errorState({String errorMessage}) {
    return _OnPlayerErrorState(
      errorMessage: errorMessage,
    );
  }
}

// ignore: unused_element
const $PlayerDetailState = _$PlayerDetailStateTearOff();

mixin _$PlayerDetailState {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initialState(),
    @required Result resetState(),
    @required Result saveTriggered(),
    @required Result updatedState(Player player),
    @required Result errorState(String errorMessage),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initialState(),
    Result resetState(),
    Result saveTriggered(),
    Result updatedState(Player player),
    Result errorState(String errorMessage),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initialState(_OnPlayerDetailState value),
    @required Result resetState(_OnPlayerResetState value),
    @required Result saveTriggered(_OnPlayerSaveTriggered value),
    @required Result updatedState(_OnPlayerUpdatedState value),
    @required Result errorState(_OnPlayerErrorState value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initialState(_OnPlayerDetailState value),
    Result resetState(_OnPlayerResetState value),
    Result saveTriggered(_OnPlayerSaveTriggered value),
    Result updatedState(_OnPlayerUpdatedState value),
    Result errorState(_OnPlayerErrorState value),
    @required Result orElse(),
  });
}

abstract class $PlayerDetailStateCopyWith<$Res> {
  factory $PlayerDetailStateCopyWith(
          PlayerDetailState value, $Res Function(PlayerDetailState) then) =
      _$PlayerDetailStateCopyWithImpl<$Res>;
}

class _$PlayerDetailStateCopyWithImpl<$Res>
    implements $PlayerDetailStateCopyWith<$Res> {
  _$PlayerDetailStateCopyWithImpl(this._value, this._then);

  final PlayerDetailState _value;
  // ignore: unused_field
  final $Res Function(PlayerDetailState) _then;
}

abstract class _$OnPlayerDetailStateCopyWith<$Res> {
  factory _$OnPlayerDetailStateCopyWith(_OnPlayerDetailState value,
          $Res Function(_OnPlayerDetailState) then) =
      __$OnPlayerDetailStateCopyWithImpl<$Res>;
}

class __$OnPlayerDetailStateCopyWithImpl<$Res>
    extends _$PlayerDetailStateCopyWithImpl<$Res>
    implements _$OnPlayerDetailStateCopyWith<$Res> {
  __$OnPlayerDetailStateCopyWithImpl(
      _OnPlayerDetailState _value, $Res Function(_OnPlayerDetailState) _then)
      : super(_value, (v) => _then(v as _OnPlayerDetailState));

  @override
  _OnPlayerDetailState get _value => super._value as _OnPlayerDetailState;
}

class _$_OnPlayerDetailState
    with DiagnosticableTreeMixin
    implements _OnPlayerDetailState {
  _$_OnPlayerDetailState();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PlayerDetailState.initialState()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PlayerDetailState.initialState'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _OnPlayerDetailState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initialState(),
    @required Result resetState(),
    @required Result saveTriggered(),
    @required Result updatedState(Player player),
    @required Result errorState(String errorMessage),
  }) {
    assert(initialState != null);
    assert(resetState != null);
    assert(saveTriggered != null);
    assert(updatedState != null);
    assert(errorState != null);
    return initialState();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initialState(),
    Result resetState(),
    Result saveTriggered(),
    Result updatedState(Player player),
    Result errorState(String errorMessage),
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
    @required Result initialState(_OnPlayerDetailState value),
    @required Result resetState(_OnPlayerResetState value),
    @required Result saveTriggered(_OnPlayerSaveTriggered value),
    @required Result updatedState(_OnPlayerUpdatedState value),
    @required Result errorState(_OnPlayerErrorState value),
  }) {
    assert(initialState != null);
    assert(resetState != null);
    assert(saveTriggered != null);
    assert(updatedState != null);
    assert(errorState != null);
    return initialState(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initialState(_OnPlayerDetailState value),
    Result resetState(_OnPlayerResetState value),
    Result saveTriggered(_OnPlayerSaveTriggered value),
    Result updatedState(_OnPlayerUpdatedState value),
    Result errorState(_OnPlayerErrorState value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (initialState != null) {
      return initialState(this);
    }
    return orElse();
  }
}

abstract class _OnPlayerDetailState implements PlayerDetailState {
  factory _OnPlayerDetailState() = _$_OnPlayerDetailState;
}

abstract class _$OnPlayerResetStateCopyWith<$Res> {
  factory _$OnPlayerResetStateCopyWith(
          _OnPlayerResetState value, $Res Function(_OnPlayerResetState) then) =
      __$OnPlayerResetStateCopyWithImpl<$Res>;
}

class __$OnPlayerResetStateCopyWithImpl<$Res>
    extends _$PlayerDetailStateCopyWithImpl<$Res>
    implements _$OnPlayerResetStateCopyWith<$Res> {
  __$OnPlayerResetStateCopyWithImpl(
      _OnPlayerResetState _value, $Res Function(_OnPlayerResetState) _then)
      : super(_value, (v) => _then(v as _OnPlayerResetState));

  @override
  _OnPlayerResetState get _value => super._value as _OnPlayerResetState;
}

class _$_OnPlayerResetState
    with DiagnosticableTreeMixin
    implements _OnPlayerResetState {
  _$_OnPlayerResetState();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PlayerDetailState.resetState()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PlayerDetailState.resetState'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _OnPlayerResetState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initialState(),
    @required Result resetState(),
    @required Result saveTriggered(),
    @required Result updatedState(Player player),
    @required Result errorState(String errorMessage),
  }) {
    assert(initialState != null);
    assert(resetState != null);
    assert(saveTriggered != null);
    assert(updatedState != null);
    assert(errorState != null);
    return resetState();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initialState(),
    Result resetState(),
    Result saveTriggered(),
    Result updatedState(Player player),
    Result errorState(String errorMessage),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (resetState != null) {
      return resetState();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initialState(_OnPlayerDetailState value),
    @required Result resetState(_OnPlayerResetState value),
    @required Result saveTriggered(_OnPlayerSaveTriggered value),
    @required Result updatedState(_OnPlayerUpdatedState value),
    @required Result errorState(_OnPlayerErrorState value),
  }) {
    assert(initialState != null);
    assert(resetState != null);
    assert(saveTriggered != null);
    assert(updatedState != null);
    assert(errorState != null);
    return resetState(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initialState(_OnPlayerDetailState value),
    Result resetState(_OnPlayerResetState value),
    Result saveTriggered(_OnPlayerSaveTriggered value),
    Result updatedState(_OnPlayerUpdatedState value),
    Result errorState(_OnPlayerErrorState value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (resetState != null) {
      return resetState(this);
    }
    return orElse();
  }
}

abstract class _OnPlayerResetState implements PlayerDetailState {
  factory _OnPlayerResetState() = _$_OnPlayerResetState;
}

abstract class _$OnPlayerSaveTriggeredCopyWith<$Res> {
  factory _$OnPlayerSaveTriggeredCopyWith(_OnPlayerSaveTriggered value,
          $Res Function(_OnPlayerSaveTriggered) then) =
      __$OnPlayerSaveTriggeredCopyWithImpl<$Res>;
}

class __$OnPlayerSaveTriggeredCopyWithImpl<$Res>
    extends _$PlayerDetailStateCopyWithImpl<$Res>
    implements _$OnPlayerSaveTriggeredCopyWith<$Res> {
  __$OnPlayerSaveTriggeredCopyWithImpl(_OnPlayerSaveTriggered _value,
      $Res Function(_OnPlayerSaveTriggered) _then)
      : super(_value, (v) => _then(v as _OnPlayerSaveTriggered));

  @override
  _OnPlayerSaveTriggered get _value => super._value as _OnPlayerSaveTriggered;
}

class _$_OnPlayerSaveTriggered
    with DiagnosticableTreeMixin
    implements _OnPlayerSaveTriggered {
  _$_OnPlayerSaveTriggered();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PlayerDetailState.saveTriggered()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PlayerDetailState.saveTriggered'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _OnPlayerSaveTriggered);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initialState(),
    @required Result resetState(),
    @required Result saveTriggered(),
    @required Result updatedState(Player player),
    @required Result errorState(String errorMessage),
  }) {
    assert(initialState != null);
    assert(resetState != null);
    assert(saveTriggered != null);
    assert(updatedState != null);
    assert(errorState != null);
    return saveTriggered();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initialState(),
    Result resetState(),
    Result saveTriggered(),
    Result updatedState(Player player),
    Result errorState(String errorMessage),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (saveTriggered != null) {
      return saveTriggered();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initialState(_OnPlayerDetailState value),
    @required Result resetState(_OnPlayerResetState value),
    @required Result saveTriggered(_OnPlayerSaveTriggered value),
    @required Result updatedState(_OnPlayerUpdatedState value),
    @required Result errorState(_OnPlayerErrorState value),
  }) {
    assert(initialState != null);
    assert(resetState != null);
    assert(saveTriggered != null);
    assert(updatedState != null);
    assert(errorState != null);
    return saveTriggered(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initialState(_OnPlayerDetailState value),
    Result resetState(_OnPlayerResetState value),
    Result saveTriggered(_OnPlayerSaveTriggered value),
    Result updatedState(_OnPlayerUpdatedState value),
    Result errorState(_OnPlayerErrorState value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (saveTriggered != null) {
      return saveTriggered(this);
    }
    return orElse();
  }
}

abstract class _OnPlayerSaveTriggered implements PlayerDetailState {
  factory _OnPlayerSaveTriggered() = _$_OnPlayerSaveTriggered;
}

abstract class _$OnPlayerUpdatedStateCopyWith<$Res> {
  factory _$OnPlayerUpdatedStateCopyWith(_OnPlayerUpdatedState value,
          $Res Function(_OnPlayerUpdatedState) then) =
      __$OnPlayerUpdatedStateCopyWithImpl<$Res>;
  $Res call({Player player});

  $PlayerCopyWith<$Res> get player;
}

class __$OnPlayerUpdatedStateCopyWithImpl<$Res>
    extends _$PlayerDetailStateCopyWithImpl<$Res>
    implements _$OnPlayerUpdatedStateCopyWith<$Res> {
  __$OnPlayerUpdatedStateCopyWithImpl(
      _OnPlayerUpdatedState _value, $Res Function(_OnPlayerUpdatedState) _then)
      : super(_value, (v) => _then(v as _OnPlayerUpdatedState));

  @override
  _OnPlayerUpdatedState get _value => super._value as _OnPlayerUpdatedState;

  @override
  $Res call({
    Object player = freezed,
  }) {
    return _then(_OnPlayerUpdatedState(
      player: player == freezed ? _value.player : player as Player,
    ));
  }

  @override
  $PlayerCopyWith<$Res> get player {
    if (_value.player == null) {
      return null;
    }
    return $PlayerCopyWith<$Res>(_value.player, (value) {
      return _then(_value.copyWith(player: value));
    });
  }
}

class _$_OnPlayerUpdatedState
    with DiagnosticableTreeMixin
    implements _OnPlayerUpdatedState {
  _$_OnPlayerUpdatedState({this.player});

  @override
  final Player player;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PlayerDetailState.updatedState(player: $player)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PlayerDetailState.updatedState'))
      ..add(DiagnosticsProperty('player', player));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _OnPlayerUpdatedState &&
            (identical(other.player, player) ||
                const DeepCollectionEquality().equals(other.player, player)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(player);

  @override
  _$OnPlayerUpdatedStateCopyWith<_OnPlayerUpdatedState> get copyWith =>
      __$OnPlayerUpdatedStateCopyWithImpl<_OnPlayerUpdatedState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initialState(),
    @required Result resetState(),
    @required Result saveTriggered(),
    @required Result updatedState(Player player),
    @required Result errorState(String errorMessage),
  }) {
    assert(initialState != null);
    assert(resetState != null);
    assert(saveTriggered != null);
    assert(updatedState != null);
    assert(errorState != null);
    return updatedState(player);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initialState(),
    Result resetState(),
    Result saveTriggered(),
    Result updatedState(Player player),
    Result errorState(String errorMessage),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (updatedState != null) {
      return updatedState(player);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initialState(_OnPlayerDetailState value),
    @required Result resetState(_OnPlayerResetState value),
    @required Result saveTriggered(_OnPlayerSaveTriggered value),
    @required Result updatedState(_OnPlayerUpdatedState value),
    @required Result errorState(_OnPlayerErrorState value),
  }) {
    assert(initialState != null);
    assert(resetState != null);
    assert(saveTriggered != null);
    assert(updatedState != null);
    assert(errorState != null);
    return updatedState(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initialState(_OnPlayerDetailState value),
    Result resetState(_OnPlayerResetState value),
    Result saveTriggered(_OnPlayerSaveTriggered value),
    Result updatedState(_OnPlayerUpdatedState value),
    Result errorState(_OnPlayerErrorState value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (updatedState != null) {
      return updatedState(this);
    }
    return orElse();
  }
}

abstract class _OnPlayerUpdatedState implements PlayerDetailState {
  factory _OnPlayerUpdatedState({Player player}) = _$_OnPlayerUpdatedState;

  Player get player;
  _$OnPlayerUpdatedStateCopyWith<_OnPlayerUpdatedState> get copyWith;
}

abstract class _$OnPlayerErrorStateCopyWith<$Res> {
  factory _$OnPlayerErrorStateCopyWith(
          _OnPlayerErrorState value, $Res Function(_OnPlayerErrorState) then) =
      __$OnPlayerErrorStateCopyWithImpl<$Res>;
  $Res call({String errorMessage});
}

class __$OnPlayerErrorStateCopyWithImpl<$Res>
    extends _$PlayerDetailStateCopyWithImpl<$Res>
    implements _$OnPlayerErrorStateCopyWith<$Res> {
  __$OnPlayerErrorStateCopyWithImpl(
      _OnPlayerErrorState _value, $Res Function(_OnPlayerErrorState) _then)
      : super(_value, (v) => _then(v as _OnPlayerErrorState));

  @override
  _OnPlayerErrorState get _value => super._value as _OnPlayerErrorState;

  @override
  $Res call({
    Object errorMessage = freezed,
  }) {
    return _then(_OnPlayerErrorState(
      errorMessage: errorMessage == freezed
          ? _value.errorMessage
          : errorMessage as String,
    ));
  }
}

class _$_OnPlayerErrorState
    with DiagnosticableTreeMixin
    implements _OnPlayerErrorState {
  _$_OnPlayerErrorState({this.errorMessage});

  @override
  final String errorMessage;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PlayerDetailState.errorState(errorMessage: $errorMessage)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PlayerDetailState.errorState'))
      ..add(DiagnosticsProperty('errorMessage', errorMessage));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _OnPlayerErrorState &&
            (identical(other.errorMessage, errorMessage) ||
                const DeepCollectionEquality()
                    .equals(other.errorMessage, errorMessage)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(errorMessage);

  @override
  _$OnPlayerErrorStateCopyWith<_OnPlayerErrorState> get copyWith =>
      __$OnPlayerErrorStateCopyWithImpl<_OnPlayerErrorState>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initialState(),
    @required Result resetState(),
    @required Result saveTriggered(),
    @required Result updatedState(Player player),
    @required Result errorState(String errorMessage),
  }) {
    assert(initialState != null);
    assert(resetState != null);
    assert(saveTriggered != null);
    assert(updatedState != null);
    assert(errorState != null);
    return errorState(errorMessage);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initialState(),
    Result resetState(),
    Result saveTriggered(),
    Result updatedState(Player player),
    Result errorState(String errorMessage),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (errorState != null) {
      return errorState(errorMessage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initialState(_OnPlayerDetailState value),
    @required Result resetState(_OnPlayerResetState value),
    @required Result saveTriggered(_OnPlayerSaveTriggered value),
    @required Result updatedState(_OnPlayerUpdatedState value),
    @required Result errorState(_OnPlayerErrorState value),
  }) {
    assert(initialState != null);
    assert(resetState != null);
    assert(saveTriggered != null);
    assert(updatedState != null);
    assert(errorState != null);
    return errorState(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initialState(_OnPlayerDetailState value),
    Result resetState(_OnPlayerResetState value),
    Result saveTriggered(_OnPlayerSaveTriggered value),
    Result updatedState(_OnPlayerUpdatedState value),
    Result errorState(_OnPlayerErrorState value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (errorState != null) {
      return errorState(this);
    }
    return orElse();
  }
}

abstract class _OnPlayerErrorState implements PlayerDetailState {
  factory _OnPlayerErrorState({String errorMessage}) = _$_OnPlayerErrorState;

  String get errorMessage;
  _$OnPlayerErrorStateCopyWith<_OnPlayerErrorState> get copyWith;
}
