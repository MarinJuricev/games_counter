// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'history_recent_query_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$HistoryRecentQueryEventTearOff {
  const _$HistoryRecentQueryEventTearOff();

  _OnGetRecentQueries getRecentQuries() {
    return _OnGetRecentQueries();
  }

  _OnGameDeleted recentGameDeleted({Game gameToDelete}) {
    return _OnGameDeleted(
      gameToDelete: gameToDelete,
    );
  }

  _OnAllRecentGamesDeleted allRecentGamesDeleted() {
    return _OnAllRecentGamesDeleted();
  }
}

// ignore: unused_element
const $HistoryRecentQueryEvent = _$HistoryRecentQueryEventTearOff();

mixin _$HistoryRecentQueryEvent {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result getRecentQuries(),
    @required Result recentGameDeleted(Game gameToDelete),
    @required Result allRecentGamesDeleted(),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result getRecentQuries(),
    Result recentGameDeleted(Game gameToDelete),
    Result allRecentGamesDeleted(),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result getRecentQuries(_OnGetRecentQueries value),
    @required Result recentGameDeleted(_OnGameDeleted value),
    @required Result allRecentGamesDeleted(_OnAllRecentGamesDeleted value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result getRecentQuries(_OnGetRecentQueries value),
    Result recentGameDeleted(_OnGameDeleted value),
    Result allRecentGamesDeleted(_OnAllRecentGamesDeleted value),
    @required Result orElse(),
  });
}

abstract class $HistoryRecentQueryEventCopyWith<$Res> {
  factory $HistoryRecentQueryEventCopyWith(HistoryRecentQueryEvent value,
          $Res Function(HistoryRecentQueryEvent) then) =
      _$HistoryRecentQueryEventCopyWithImpl<$Res>;
}

class _$HistoryRecentQueryEventCopyWithImpl<$Res>
    implements $HistoryRecentQueryEventCopyWith<$Res> {
  _$HistoryRecentQueryEventCopyWithImpl(this._value, this._then);

  final HistoryRecentQueryEvent _value;
  // ignore: unused_field
  final $Res Function(HistoryRecentQueryEvent) _then;
}

abstract class _$OnGetRecentQueriesCopyWith<$Res> {
  factory _$OnGetRecentQueriesCopyWith(
          _OnGetRecentQueries value, $Res Function(_OnGetRecentQueries) then) =
      __$OnGetRecentQueriesCopyWithImpl<$Res>;
}

class __$OnGetRecentQueriesCopyWithImpl<$Res>
    extends _$HistoryRecentQueryEventCopyWithImpl<$Res>
    implements _$OnGetRecentQueriesCopyWith<$Res> {
  __$OnGetRecentQueriesCopyWithImpl(
      _OnGetRecentQueries _value, $Res Function(_OnGetRecentQueries) _then)
      : super(_value, (v) => _then(v as _OnGetRecentQueries));

  @override
  _OnGetRecentQueries get _value => super._value as _OnGetRecentQueries;
}

class _$_OnGetRecentQueries implements _OnGetRecentQueries {
  _$_OnGetRecentQueries();

  @override
  String toString() {
    return 'HistoryRecentQueryEvent.getRecentQuries()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _OnGetRecentQueries);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result getRecentQuries(),
    @required Result recentGameDeleted(Game gameToDelete),
    @required Result allRecentGamesDeleted(),
  }) {
    assert(getRecentQuries != null);
    assert(recentGameDeleted != null);
    assert(allRecentGamesDeleted != null);
    return getRecentQuries();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result getRecentQuries(),
    Result recentGameDeleted(Game gameToDelete),
    Result allRecentGamesDeleted(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (getRecentQuries != null) {
      return getRecentQuries();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result getRecentQuries(_OnGetRecentQueries value),
    @required Result recentGameDeleted(_OnGameDeleted value),
    @required Result allRecentGamesDeleted(_OnAllRecentGamesDeleted value),
  }) {
    assert(getRecentQuries != null);
    assert(recentGameDeleted != null);
    assert(allRecentGamesDeleted != null);
    return getRecentQuries(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result getRecentQuries(_OnGetRecentQueries value),
    Result recentGameDeleted(_OnGameDeleted value),
    Result allRecentGamesDeleted(_OnAllRecentGamesDeleted value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (getRecentQuries != null) {
      return getRecentQuries(this);
    }
    return orElse();
  }
}

abstract class _OnGetRecentQueries implements HistoryRecentQueryEvent {
  factory _OnGetRecentQueries() = _$_OnGetRecentQueries;
}

abstract class _$OnGameDeletedCopyWith<$Res> {
  factory _$OnGameDeletedCopyWith(
          _OnGameDeleted value, $Res Function(_OnGameDeleted) then) =
      __$OnGameDeletedCopyWithImpl<$Res>;
  $Res call({Game gameToDelete});

  $GameCopyWith<$Res> get gameToDelete;
}

class __$OnGameDeletedCopyWithImpl<$Res>
    extends _$HistoryRecentQueryEventCopyWithImpl<$Res>
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

  @override
  $GameCopyWith<$Res> get gameToDelete {
    if (_value.gameToDelete == null) {
      return null;
    }
    return $GameCopyWith<$Res>(_value.gameToDelete, (value) {
      return _then(_value.copyWith(gameToDelete: value));
    });
  }
}

class _$_OnGameDeleted implements _OnGameDeleted {
  _$_OnGameDeleted({this.gameToDelete});

  @override
  final Game gameToDelete;

  @override
  String toString() {
    return 'HistoryRecentQueryEvent.recentGameDeleted(gameToDelete: $gameToDelete)';
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
    @required Result getRecentQuries(),
    @required Result recentGameDeleted(Game gameToDelete),
    @required Result allRecentGamesDeleted(),
  }) {
    assert(getRecentQuries != null);
    assert(recentGameDeleted != null);
    assert(allRecentGamesDeleted != null);
    return recentGameDeleted(gameToDelete);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result getRecentQuries(),
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
    @required Result getRecentQuries(_OnGetRecentQueries value),
    @required Result recentGameDeleted(_OnGameDeleted value),
    @required Result allRecentGamesDeleted(_OnAllRecentGamesDeleted value),
  }) {
    assert(getRecentQuries != null);
    assert(recentGameDeleted != null);
    assert(allRecentGamesDeleted != null);
    return recentGameDeleted(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result getRecentQuries(_OnGetRecentQueries value),
    Result recentGameDeleted(_OnGameDeleted value),
    Result allRecentGamesDeleted(_OnAllRecentGamesDeleted value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (recentGameDeleted != null) {
      return recentGameDeleted(this);
    }
    return orElse();
  }
}

abstract class _OnGameDeleted implements HistoryRecentQueryEvent {
  factory _OnGameDeleted({Game gameToDelete}) = _$_OnGameDeleted;

  Game get gameToDelete;
  _$OnGameDeletedCopyWith<_OnGameDeleted> get copyWith;
}

abstract class _$OnAllRecentGamesDeletedCopyWith<$Res> {
  factory _$OnAllRecentGamesDeletedCopyWith(_OnAllRecentGamesDeleted value,
          $Res Function(_OnAllRecentGamesDeleted) then) =
      __$OnAllRecentGamesDeletedCopyWithImpl<$Res>;
}

class __$OnAllRecentGamesDeletedCopyWithImpl<$Res>
    extends _$HistoryRecentQueryEventCopyWithImpl<$Res>
    implements _$OnAllRecentGamesDeletedCopyWith<$Res> {
  __$OnAllRecentGamesDeletedCopyWithImpl(_OnAllRecentGamesDeleted _value,
      $Res Function(_OnAllRecentGamesDeleted) _then)
      : super(_value, (v) => _then(v as _OnAllRecentGamesDeleted));

  @override
  _OnAllRecentGamesDeleted get _value =>
      super._value as _OnAllRecentGamesDeleted;
}

class _$_OnAllRecentGamesDeleted implements _OnAllRecentGamesDeleted {
  _$_OnAllRecentGamesDeleted();

  @override
  String toString() {
    return 'HistoryRecentQueryEvent.allRecentGamesDeleted()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _OnAllRecentGamesDeleted);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result getRecentQuries(),
    @required Result recentGameDeleted(Game gameToDelete),
    @required Result allRecentGamesDeleted(),
  }) {
    assert(getRecentQuries != null);
    assert(recentGameDeleted != null);
    assert(allRecentGamesDeleted != null);
    return allRecentGamesDeleted();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result getRecentQuries(),
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
    @required Result getRecentQuries(_OnGetRecentQueries value),
    @required Result recentGameDeleted(_OnGameDeleted value),
    @required Result allRecentGamesDeleted(_OnAllRecentGamesDeleted value),
  }) {
    assert(getRecentQuries != null);
    assert(recentGameDeleted != null);
    assert(allRecentGamesDeleted != null);
    return allRecentGamesDeleted(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result getRecentQuries(_OnGetRecentQueries value),
    Result recentGameDeleted(_OnGameDeleted value),
    Result allRecentGamesDeleted(_OnAllRecentGamesDeleted value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (allRecentGamesDeleted != null) {
      return allRecentGamesDeleted(this);
    }
    return orElse();
  }
}

abstract class _OnAllRecentGamesDeleted implements HistoryRecentQueryEvent {
  factory _OnAllRecentGamesDeleted() = _$_OnAllRecentGamesDeleted;
}

class _$HistoryRecentQueryStateTearOff {
  const _$HistoryRecentQueryStateTearOff();

  _OnHistoryRecentInitialState initialState() {
    return _OnHistoryRecentInitialState();
  }

  _OnHistoryRecentUpdatedState updatedState({List<String> recentQueries}) {
    return _OnHistoryRecentUpdatedState(
      recentQueries: recentQueries,
    );
  }

  _OnHistoryRecentErrorState errorState({String errorMessage}) {
    return _OnHistoryRecentErrorState(
      errorMessage: errorMessage,
    );
  }
}

// ignore: unused_element
const $HistoryRecentQueryState = _$HistoryRecentQueryStateTearOff();

mixin _$HistoryRecentQueryState {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initialState(),
    @required Result updatedState(List<String> recentQueries),
    @required Result errorState(String errorMessage),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initialState(),
    Result updatedState(List<String> recentQueries),
    Result errorState(String errorMessage),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initialState(_OnHistoryRecentInitialState value),
    @required Result updatedState(_OnHistoryRecentUpdatedState value),
    @required Result errorState(_OnHistoryRecentErrorState value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initialState(_OnHistoryRecentInitialState value),
    Result updatedState(_OnHistoryRecentUpdatedState value),
    Result errorState(_OnHistoryRecentErrorState value),
    @required Result orElse(),
  });
}

abstract class $HistoryRecentQueryStateCopyWith<$Res> {
  factory $HistoryRecentQueryStateCopyWith(HistoryRecentQueryState value,
          $Res Function(HistoryRecentQueryState) then) =
      _$HistoryRecentQueryStateCopyWithImpl<$Res>;
}

class _$HistoryRecentQueryStateCopyWithImpl<$Res>
    implements $HistoryRecentQueryStateCopyWith<$Res> {
  _$HistoryRecentQueryStateCopyWithImpl(this._value, this._then);

  final HistoryRecentQueryState _value;
  // ignore: unused_field
  final $Res Function(HistoryRecentQueryState) _then;
}

abstract class _$OnHistoryRecentInitialStateCopyWith<$Res> {
  factory _$OnHistoryRecentInitialStateCopyWith(
          _OnHistoryRecentInitialState value,
          $Res Function(_OnHistoryRecentInitialState) then) =
      __$OnHistoryRecentInitialStateCopyWithImpl<$Res>;
}

class __$OnHistoryRecentInitialStateCopyWithImpl<$Res>
    extends _$HistoryRecentQueryStateCopyWithImpl<$Res>
    implements _$OnHistoryRecentInitialStateCopyWith<$Res> {
  __$OnHistoryRecentInitialStateCopyWithImpl(
      _OnHistoryRecentInitialState _value,
      $Res Function(_OnHistoryRecentInitialState) _then)
      : super(_value, (v) => _then(v as _OnHistoryRecentInitialState));

  @override
  _OnHistoryRecentInitialState get _value =>
      super._value as _OnHistoryRecentInitialState;
}

class _$_OnHistoryRecentInitialState implements _OnHistoryRecentInitialState {
  _$_OnHistoryRecentInitialState();

  @override
  String toString() {
    return 'HistoryRecentQueryState.initialState()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _OnHistoryRecentInitialState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initialState(),
    @required Result updatedState(List<String> recentQueries),
    @required Result errorState(String errorMessage),
  }) {
    assert(initialState != null);
    assert(updatedState != null);
    assert(errorState != null);
    return initialState();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initialState(),
    Result updatedState(List<String> recentQueries),
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
    @required Result initialState(_OnHistoryRecentInitialState value),
    @required Result updatedState(_OnHistoryRecentUpdatedState value),
    @required Result errorState(_OnHistoryRecentErrorState value),
  }) {
    assert(initialState != null);
    assert(updatedState != null);
    assert(errorState != null);
    return initialState(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initialState(_OnHistoryRecentInitialState value),
    Result updatedState(_OnHistoryRecentUpdatedState value),
    Result errorState(_OnHistoryRecentErrorState value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (initialState != null) {
      return initialState(this);
    }
    return orElse();
  }
}

abstract class _OnHistoryRecentInitialState implements HistoryRecentQueryState {
  factory _OnHistoryRecentInitialState() = _$_OnHistoryRecentInitialState;
}

abstract class _$OnHistoryRecentUpdatedStateCopyWith<$Res> {
  factory _$OnHistoryRecentUpdatedStateCopyWith(
          _OnHistoryRecentUpdatedState value,
          $Res Function(_OnHistoryRecentUpdatedState) then) =
      __$OnHistoryRecentUpdatedStateCopyWithImpl<$Res>;
  $Res call({List<String> recentQueries});
}

class __$OnHistoryRecentUpdatedStateCopyWithImpl<$Res>
    extends _$HistoryRecentQueryStateCopyWithImpl<$Res>
    implements _$OnHistoryRecentUpdatedStateCopyWith<$Res> {
  __$OnHistoryRecentUpdatedStateCopyWithImpl(
      _OnHistoryRecentUpdatedState _value,
      $Res Function(_OnHistoryRecentUpdatedState) _then)
      : super(_value, (v) => _then(v as _OnHistoryRecentUpdatedState));

  @override
  _OnHistoryRecentUpdatedState get _value =>
      super._value as _OnHistoryRecentUpdatedState;

  @override
  $Res call({
    Object recentQueries = freezed,
  }) {
    return _then(_OnHistoryRecentUpdatedState(
      recentQueries: recentQueries == freezed
          ? _value.recentQueries
          : recentQueries as List<String>,
    ));
  }
}

class _$_OnHistoryRecentUpdatedState implements _OnHistoryRecentUpdatedState {
  _$_OnHistoryRecentUpdatedState({this.recentQueries});

  @override
  final List<String> recentQueries;

  @override
  String toString() {
    return 'HistoryRecentQueryState.updatedState(recentQueries: $recentQueries)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _OnHistoryRecentUpdatedState &&
            (identical(other.recentQueries, recentQueries) ||
                const DeepCollectionEquality()
                    .equals(other.recentQueries, recentQueries)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(recentQueries);

  @override
  _$OnHistoryRecentUpdatedStateCopyWith<_OnHistoryRecentUpdatedState>
      get copyWith => __$OnHistoryRecentUpdatedStateCopyWithImpl<
          _OnHistoryRecentUpdatedState>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initialState(),
    @required Result updatedState(List<String> recentQueries),
    @required Result errorState(String errorMessage),
  }) {
    assert(initialState != null);
    assert(updatedState != null);
    assert(errorState != null);
    return updatedState(recentQueries);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initialState(),
    Result updatedState(List<String> recentQueries),
    Result errorState(String errorMessage),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (updatedState != null) {
      return updatedState(recentQueries);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initialState(_OnHistoryRecentInitialState value),
    @required Result updatedState(_OnHistoryRecentUpdatedState value),
    @required Result errorState(_OnHistoryRecentErrorState value),
  }) {
    assert(initialState != null);
    assert(updatedState != null);
    assert(errorState != null);
    return updatedState(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initialState(_OnHistoryRecentInitialState value),
    Result updatedState(_OnHistoryRecentUpdatedState value),
    Result errorState(_OnHistoryRecentErrorState value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (updatedState != null) {
      return updatedState(this);
    }
    return orElse();
  }
}

abstract class _OnHistoryRecentUpdatedState implements HistoryRecentQueryState {
  factory _OnHistoryRecentUpdatedState({List<String> recentQueries}) =
      _$_OnHistoryRecentUpdatedState;

  List<String> get recentQueries;
  _$OnHistoryRecentUpdatedStateCopyWith<_OnHistoryRecentUpdatedState>
      get copyWith;
}

abstract class _$OnHistoryRecentErrorStateCopyWith<$Res> {
  factory _$OnHistoryRecentErrorStateCopyWith(_OnHistoryRecentErrorState value,
          $Res Function(_OnHistoryRecentErrorState) then) =
      __$OnHistoryRecentErrorStateCopyWithImpl<$Res>;
  $Res call({String errorMessage});
}

class __$OnHistoryRecentErrorStateCopyWithImpl<$Res>
    extends _$HistoryRecentQueryStateCopyWithImpl<$Res>
    implements _$OnHistoryRecentErrorStateCopyWith<$Res> {
  __$OnHistoryRecentErrorStateCopyWithImpl(_OnHistoryRecentErrorState _value,
      $Res Function(_OnHistoryRecentErrorState) _then)
      : super(_value, (v) => _then(v as _OnHistoryRecentErrorState));

  @override
  _OnHistoryRecentErrorState get _value =>
      super._value as _OnHistoryRecentErrorState;

  @override
  $Res call({
    Object errorMessage = freezed,
  }) {
    return _then(_OnHistoryRecentErrorState(
      errorMessage: errorMessage == freezed
          ? _value.errorMessage
          : errorMessage as String,
    ));
  }
}

class _$_OnHistoryRecentErrorState implements _OnHistoryRecentErrorState {
  _$_OnHistoryRecentErrorState({this.errorMessage});

  @override
  final String errorMessage;

  @override
  String toString() {
    return 'HistoryRecentQueryState.errorState(errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _OnHistoryRecentErrorState &&
            (identical(other.errorMessage, errorMessage) ||
                const DeepCollectionEquality()
                    .equals(other.errorMessage, errorMessage)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(errorMessage);

  @override
  _$OnHistoryRecentErrorStateCopyWith<_OnHistoryRecentErrorState>
      get copyWith =>
          __$OnHistoryRecentErrorStateCopyWithImpl<_OnHistoryRecentErrorState>(
              this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initialState(),
    @required Result updatedState(List<String> recentQueries),
    @required Result errorState(String errorMessage),
  }) {
    assert(initialState != null);
    assert(updatedState != null);
    assert(errorState != null);
    return errorState(errorMessage);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initialState(),
    Result updatedState(List<String> recentQueries),
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
    @required Result initialState(_OnHistoryRecentInitialState value),
    @required Result updatedState(_OnHistoryRecentUpdatedState value),
    @required Result errorState(_OnHistoryRecentErrorState value),
  }) {
    assert(initialState != null);
    assert(updatedState != null);
    assert(errorState != null);
    return errorState(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initialState(_OnHistoryRecentInitialState value),
    Result updatedState(_OnHistoryRecentUpdatedState value),
    Result errorState(_OnHistoryRecentErrorState value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (errorState != null) {
      return errorState(this);
    }
    return orElse();
  }
}

abstract class _OnHistoryRecentErrorState implements HistoryRecentQueryState {
  factory _OnHistoryRecentErrorState({String errorMessage}) =
      _$_OnHistoryRecentErrorState;

  String get errorMessage;
  _$OnHistoryRecentErrorStateCopyWith<_OnHistoryRecentErrorState> get copyWith;
}
