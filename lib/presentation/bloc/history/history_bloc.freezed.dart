// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'history_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$HistoryEventTearOff {
  const _$HistoryEventTearOff();

  _OnScreenLoaded screenLoaded() {
    return _OnScreenLoaded();
  }

  _OnGameDeleted recentGameDeleted({Game gameToDelete}) {
    return _OnGameDeleted(
      gameToDelete: gameToDelete,
    );
  }

  _onAllRecentGamesDeleted allRecentGamesDeleted() {
    return _onAllRecentGamesDeleted();
  }
}

// ignore: unused_element
const $HistoryEvent = _$HistoryEventTearOff();

mixin _$HistoryEvent {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result screenLoaded(),
    @required Result recentGameDeleted(Game gameToDelete),
    @required Result allRecentGamesDeleted(),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result screenLoaded(),
    Result recentGameDeleted(Game gameToDelete),
    Result allRecentGamesDeleted(),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result screenLoaded(_OnScreenLoaded value),
    @required Result recentGameDeleted(_OnGameDeleted value),
    @required Result allRecentGamesDeleted(_onAllRecentGamesDeleted value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result screenLoaded(_OnScreenLoaded value),
    Result recentGameDeleted(_OnGameDeleted value),
    Result allRecentGamesDeleted(_onAllRecentGamesDeleted value),
    @required Result orElse(),
  });
}

abstract class $HistoryEventCopyWith<$Res> {
  factory $HistoryEventCopyWith(
          HistoryEvent value, $Res Function(HistoryEvent) then) =
      _$HistoryEventCopyWithImpl<$Res>;
}

class _$HistoryEventCopyWithImpl<$Res> implements $HistoryEventCopyWith<$Res> {
  _$HistoryEventCopyWithImpl(this._value, this._then);

  final HistoryEvent _value;
  // ignore: unused_field
  final $Res Function(HistoryEvent) _then;
}

abstract class _$OnScreenLoadedCopyWith<$Res> {
  factory _$OnScreenLoadedCopyWith(
          _OnScreenLoaded value, $Res Function(_OnScreenLoaded) then) =
      __$OnScreenLoadedCopyWithImpl<$Res>;
}

class __$OnScreenLoadedCopyWithImpl<$Res>
    extends _$HistoryEventCopyWithImpl<$Res>
    implements _$OnScreenLoadedCopyWith<$Res> {
  __$OnScreenLoadedCopyWithImpl(
      _OnScreenLoaded _value, $Res Function(_OnScreenLoaded) _then)
      : super(_value, (v) => _then(v as _OnScreenLoaded));

  @override
  _OnScreenLoaded get _value => super._value as _OnScreenLoaded;
}

class _$_OnScreenLoaded implements _OnScreenLoaded {
  _$_OnScreenLoaded();

  @override
  String toString() {
    return 'HistoryEvent.screenLoaded()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _OnScreenLoaded);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result screenLoaded(),
    @required Result recentGameDeleted(Game gameToDelete),
    @required Result allRecentGamesDeleted(),
  }) {
    assert(screenLoaded != null);
    assert(recentGameDeleted != null);
    assert(allRecentGamesDeleted != null);
    return screenLoaded();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result screenLoaded(),
    Result recentGameDeleted(Game gameToDelete),
    Result allRecentGamesDeleted(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (screenLoaded != null) {
      return screenLoaded();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result screenLoaded(_OnScreenLoaded value),
    @required Result recentGameDeleted(_OnGameDeleted value),
    @required Result allRecentGamesDeleted(_onAllRecentGamesDeleted value),
  }) {
    assert(screenLoaded != null);
    assert(recentGameDeleted != null);
    assert(allRecentGamesDeleted != null);
    return screenLoaded(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result screenLoaded(_OnScreenLoaded value),
    Result recentGameDeleted(_OnGameDeleted value),
    Result allRecentGamesDeleted(_onAllRecentGamesDeleted value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (screenLoaded != null) {
      return screenLoaded(this);
    }
    return orElse();
  }
}

abstract class _OnScreenLoaded implements HistoryEvent {
  factory _OnScreenLoaded() = _$_OnScreenLoaded;
}

abstract class _$OnGameDeletedCopyWith<$Res> {
  factory _$OnGameDeletedCopyWith(
          _OnGameDeleted value, $Res Function(_OnGameDeleted) then) =
      __$OnGameDeletedCopyWithImpl<$Res>;
  $Res call({Game gameToDelete});
}

class __$OnGameDeletedCopyWithImpl<$Res>
    extends _$HistoryEventCopyWithImpl<$Res>
    implements _$OnGameDeletedCopyWith<$Res> {
  __$OnGameDeletedCopyWithImpl(
      _OnGameDeleted _value, $Res Function(_OnGameDeleted) _then)
      : super(_value, (v) => _then(v as _OnGameDeleted));

  @override
  _OnGameDeleted get _value => super._value as _OnGameDeleted;

  @override
  $Res call({
    Object gameToDelete = freezed,
  }) {
    return _then(_OnGameDeleted(
      gameToDelete:
          gameToDelete == freezed ? _value.gameToDelete : gameToDelete as Game,
    ));
  }
}

class _$_OnGameDeleted implements _OnGameDeleted {
  _$_OnGameDeleted({this.gameToDelete});

  @override
  final Game gameToDelete;

  @override
  String toString() {
    return 'HistoryEvent.recentGameDeleted(gameToDelete: $gameToDelete)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _OnGameDeleted &&
            (identical(other.gameToDelete, gameToDelete) ||
                const DeepCollectionEquality()
                    .equals(other.gameToDelete, gameToDelete)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(gameToDelete);

  @override
  _$OnGameDeletedCopyWith<_OnGameDeleted> get copyWith =>
      __$OnGameDeletedCopyWithImpl<_OnGameDeleted>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result screenLoaded(),
    @required Result recentGameDeleted(Game gameToDelete),
    @required Result allRecentGamesDeleted(),
  }) {
    assert(screenLoaded != null);
    assert(recentGameDeleted != null);
    assert(allRecentGamesDeleted != null);
    return recentGameDeleted(gameToDelete);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result screenLoaded(),
    Result recentGameDeleted(Game gameToDelete),
    Result allRecentGamesDeleted(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (recentGameDeleted != null) {
      return recentGameDeleted(gameToDelete);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result screenLoaded(_OnScreenLoaded value),
    @required Result recentGameDeleted(_OnGameDeleted value),
    @required Result allRecentGamesDeleted(_onAllRecentGamesDeleted value),
  }) {
    assert(screenLoaded != null);
    assert(recentGameDeleted != null);
    assert(allRecentGamesDeleted != null);
    return recentGameDeleted(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result screenLoaded(_OnScreenLoaded value),
    Result recentGameDeleted(_OnGameDeleted value),
    Result allRecentGamesDeleted(_onAllRecentGamesDeleted value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (recentGameDeleted != null) {
      return recentGameDeleted(this);
    }
    return orElse();
  }
}

abstract class _OnGameDeleted implements HistoryEvent {
  factory _OnGameDeleted({Game gameToDelete}) = _$_OnGameDeleted;

  Game get gameToDelete;
  _$OnGameDeletedCopyWith<_OnGameDeleted> get copyWith;
}

abstract class _$onAllRecentGamesDeletedCopyWith<$Res> {
  factory _$onAllRecentGamesDeletedCopyWith(_onAllRecentGamesDeleted value,
          $Res Function(_onAllRecentGamesDeleted) then) =
      __$onAllRecentGamesDeletedCopyWithImpl<$Res>;
}

class __$onAllRecentGamesDeletedCopyWithImpl<$Res>
    extends _$HistoryEventCopyWithImpl<$Res>
    implements _$onAllRecentGamesDeletedCopyWith<$Res> {
  __$onAllRecentGamesDeletedCopyWithImpl(_onAllRecentGamesDeleted _value,
      $Res Function(_onAllRecentGamesDeleted) _then)
      : super(_value, (v) => _then(v as _onAllRecentGamesDeleted));

  @override
  _onAllRecentGamesDeleted get _value =>
      super._value as _onAllRecentGamesDeleted;
}

class _$_onAllRecentGamesDeleted implements _onAllRecentGamesDeleted {
  _$_onAllRecentGamesDeleted();

  @override
  String toString() {
    return 'HistoryEvent.allRecentGamesDeleted()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _onAllRecentGamesDeleted);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result screenLoaded(),
    @required Result recentGameDeleted(Game gameToDelete),
    @required Result allRecentGamesDeleted(),
  }) {
    assert(screenLoaded != null);
    assert(recentGameDeleted != null);
    assert(allRecentGamesDeleted != null);
    return allRecentGamesDeleted();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result screenLoaded(),
    Result recentGameDeleted(Game gameToDelete),
    Result allRecentGamesDeleted(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (allRecentGamesDeleted != null) {
      return allRecentGamesDeleted();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result screenLoaded(_OnScreenLoaded value),
    @required Result recentGameDeleted(_OnGameDeleted value),
    @required Result allRecentGamesDeleted(_onAllRecentGamesDeleted value),
  }) {
    assert(screenLoaded != null);
    assert(recentGameDeleted != null);
    assert(allRecentGamesDeleted != null);
    return allRecentGamesDeleted(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result screenLoaded(_OnScreenLoaded value),
    Result recentGameDeleted(_OnGameDeleted value),
    Result allRecentGamesDeleted(_onAllRecentGamesDeleted value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (allRecentGamesDeleted != null) {
      return allRecentGamesDeleted(this);
    }
    return orElse();
  }
}

abstract class _onAllRecentGamesDeleted implements HistoryEvent {
  factory _onAllRecentGamesDeleted() = _$_onAllRecentGamesDeleted;
}
