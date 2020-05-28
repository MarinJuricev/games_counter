// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'history_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$HistoryEventTearOff {
  const _$HistoryEventTearOff();

  _OnQueryChanged queryChanged({String query}) {
    return _OnQueryChanged(
      query: query,
    );
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
const $HistoryEvent = _$HistoryEventTearOff();

mixin _$HistoryEvent {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result queryChanged(String query),
    @required Result recentGameDeleted(Game gameToDelete),
    @required Result allRecentGamesDeleted(),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result queryChanged(String query),
    Result recentGameDeleted(Game gameToDelete),
    Result allRecentGamesDeleted(),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result queryChanged(_OnQueryChanged value),
    @required Result recentGameDeleted(_OnGameDeleted value),
    @required Result allRecentGamesDeleted(_OnAllRecentGamesDeleted value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result queryChanged(_OnQueryChanged value),
    Result recentGameDeleted(_OnGameDeleted value),
    Result allRecentGamesDeleted(_OnAllRecentGamesDeleted value),
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

abstract class _$OnQueryChangedCopyWith<$Res> {
  factory _$OnQueryChangedCopyWith(
          _OnQueryChanged value, $Res Function(_OnQueryChanged) then) =
      __$OnQueryChangedCopyWithImpl<$Res>;
  $Res call({String query});
}

class __$OnQueryChangedCopyWithImpl<$Res>
    extends _$HistoryEventCopyWithImpl<$Res>
    implements _$OnQueryChangedCopyWith<$Res> {
  __$OnQueryChangedCopyWithImpl(
      _OnQueryChanged _value, $Res Function(_OnQueryChanged) _then)
      : super(_value, (v) => _then(v as _OnQueryChanged));

  @override
  _OnQueryChanged get _value => super._value as _OnQueryChanged;

  @override
  $Res call({
    Object query = freezed,
  }) {
    return _then(_OnQueryChanged(
      query: query == freezed ? _value.query : query as String,
    ));
  }
}

class _$_OnQueryChanged implements _OnQueryChanged {
  _$_OnQueryChanged({this.query});

  @override
  final String query;

  @override
  String toString() {
    return 'HistoryEvent.queryChanged(query: $query)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _OnQueryChanged &&
            (identical(other.query, query) ||
                const DeepCollectionEquality().equals(other.query, query)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(query);

  @override
  _$OnQueryChangedCopyWith<_OnQueryChanged> get copyWith =>
      __$OnQueryChangedCopyWithImpl<_OnQueryChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result queryChanged(String query),
    @required Result recentGameDeleted(Game gameToDelete),
    @required Result allRecentGamesDeleted(),
  }) {
    assert(queryChanged != null);
    assert(recentGameDeleted != null);
    assert(allRecentGamesDeleted != null);
    return queryChanged(query);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result queryChanged(String query),
    Result recentGameDeleted(Game gameToDelete),
    Result allRecentGamesDeleted(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (queryChanged != null) {
      return queryChanged(query);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result queryChanged(_OnQueryChanged value),
    @required Result recentGameDeleted(_OnGameDeleted value),
    @required Result allRecentGamesDeleted(_OnAllRecentGamesDeleted value),
  }) {
    assert(queryChanged != null);
    assert(recentGameDeleted != null);
    assert(allRecentGamesDeleted != null);
    return queryChanged(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result queryChanged(_OnQueryChanged value),
    Result recentGameDeleted(_OnGameDeleted value),
    Result allRecentGamesDeleted(_OnAllRecentGamesDeleted value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (queryChanged != null) {
      return queryChanged(this);
    }
    return orElse();
  }
}

abstract class _OnQueryChanged implements HistoryEvent {
  factory _OnQueryChanged({String query}) = _$_OnQueryChanged;

  String get query;
  _$OnQueryChangedCopyWith<_OnQueryChanged> get copyWith;
}

abstract class _$OnGameDeletedCopyWith<$Res> {
  factory _$OnGameDeletedCopyWith(
          _OnGameDeleted value, $Res Function(_OnGameDeleted) then) =
      __$OnGameDeletedCopyWithImpl<$Res>;
  $Res call({Game gameToDelete});

  $GameCopyWith<$Res> get gameToDelete;
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
    @required Result queryChanged(String query),
    @required Result recentGameDeleted(Game gameToDelete),
    @required Result allRecentGamesDeleted(),
  }) {
    assert(queryChanged != null);
    assert(recentGameDeleted != null);
    assert(allRecentGamesDeleted != null);
    return recentGameDeleted(gameToDelete);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result queryChanged(String query),
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
    @required Result queryChanged(_OnQueryChanged value),
    @required Result recentGameDeleted(_OnGameDeleted value),
    @required Result allRecentGamesDeleted(_OnAllRecentGamesDeleted value),
  }) {
    assert(queryChanged != null);
    assert(recentGameDeleted != null);
    assert(allRecentGamesDeleted != null);
    return recentGameDeleted(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result queryChanged(_OnQueryChanged value),
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

abstract class _OnGameDeleted implements HistoryEvent {
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
    extends _$HistoryEventCopyWithImpl<$Res>
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
    return 'HistoryEvent.allRecentGamesDeleted()';
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
    @required Result queryChanged(String query),
    @required Result recentGameDeleted(Game gameToDelete),
    @required Result allRecentGamesDeleted(),
  }) {
    assert(queryChanged != null);
    assert(recentGameDeleted != null);
    assert(allRecentGamesDeleted != null);
    return allRecentGamesDeleted();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result queryChanged(String query),
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
    @required Result queryChanged(_OnQueryChanged value),
    @required Result recentGameDeleted(_OnGameDeleted value),
    @required Result allRecentGamesDeleted(_OnAllRecentGamesDeleted value),
  }) {
    assert(queryChanged != null);
    assert(recentGameDeleted != null);
    assert(allRecentGamesDeleted != null);
    return allRecentGamesDeleted(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result queryChanged(_OnQueryChanged value),
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

abstract class _OnAllRecentGamesDeleted implements HistoryEvent {
  factory _OnAllRecentGamesDeleted() = _$_OnAllRecentGamesDeleted;
}

class _$HistoryStateTearOff {
  const _$HistoryStateTearOff();

  _OnHistoryInitialState initialState() {
    return _OnHistoryInitialState();
  }

  _OnHistoryUpdatedState updatedState({List<HistoryItem> historyItems}) {
    return _OnHistoryUpdatedState(
      historyItems: historyItems,
    );
  }

  _OnHistoryErrorState errorState({String errorMessage}) {
    return _OnHistoryErrorState(
      errorMessage: errorMessage,
    );
  }
}

// ignore: unused_element
const $HistoryState = _$HistoryStateTearOff();

mixin _$HistoryState {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initialState(),
    @required Result updatedState(List<HistoryItem> historyItems),
    @required Result errorState(String errorMessage),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initialState(),
    Result updatedState(List<HistoryItem> historyItems),
    Result errorState(String errorMessage),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initialState(_OnHistoryInitialState value),
    @required Result updatedState(_OnHistoryUpdatedState value),
    @required Result errorState(_OnHistoryErrorState value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initialState(_OnHistoryInitialState value),
    Result updatedState(_OnHistoryUpdatedState value),
    Result errorState(_OnHistoryErrorState value),
    @required Result orElse(),
  });
}

abstract class $HistoryStateCopyWith<$Res> {
  factory $HistoryStateCopyWith(
          HistoryState value, $Res Function(HistoryState) then) =
      _$HistoryStateCopyWithImpl<$Res>;
}

class _$HistoryStateCopyWithImpl<$Res> implements $HistoryStateCopyWith<$Res> {
  _$HistoryStateCopyWithImpl(this._value, this._then);

  final HistoryState _value;
  // ignore: unused_field
  final $Res Function(HistoryState) _then;
}

abstract class _$OnHistoryInitialStateCopyWith<$Res> {
  factory _$OnHistoryInitialStateCopyWith(_OnHistoryInitialState value,
          $Res Function(_OnHistoryInitialState) then) =
      __$OnHistoryInitialStateCopyWithImpl<$Res>;
}

class __$OnHistoryInitialStateCopyWithImpl<$Res>
    extends _$HistoryStateCopyWithImpl<$Res>
    implements _$OnHistoryInitialStateCopyWith<$Res> {
  __$OnHistoryInitialStateCopyWithImpl(_OnHistoryInitialState _value,
      $Res Function(_OnHistoryInitialState) _then)
      : super(_value, (v) => _then(v as _OnHistoryInitialState));

  @override
  _OnHistoryInitialState get _value => super._value as _OnHistoryInitialState;
}

class _$_OnHistoryInitialState implements _OnHistoryInitialState {
  _$_OnHistoryInitialState();

  @override
  String toString() {
    return 'HistoryState.initialState()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _OnHistoryInitialState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initialState(),
    @required Result updatedState(List<HistoryItem> historyItems),
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
    Result updatedState(List<HistoryItem> historyItems),
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
    @required Result initialState(_OnHistoryInitialState value),
    @required Result updatedState(_OnHistoryUpdatedState value),
    @required Result errorState(_OnHistoryErrorState value),
  }) {
    assert(initialState != null);
    assert(updatedState != null);
    assert(errorState != null);
    return initialState(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initialState(_OnHistoryInitialState value),
    Result updatedState(_OnHistoryUpdatedState value),
    Result errorState(_OnHistoryErrorState value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (initialState != null) {
      return initialState(this);
    }
    return orElse();
  }
}

abstract class _OnHistoryInitialState implements HistoryState {
  factory _OnHistoryInitialState() = _$_OnHistoryInitialState;
}

abstract class _$OnHistoryUpdatedStateCopyWith<$Res> {
  factory _$OnHistoryUpdatedStateCopyWith(_OnHistoryUpdatedState value,
          $Res Function(_OnHistoryUpdatedState) then) =
      __$OnHistoryUpdatedStateCopyWithImpl<$Res>;
  $Res call({List<HistoryItem> historyItems});
}

class __$OnHistoryUpdatedStateCopyWithImpl<$Res>
    extends _$HistoryStateCopyWithImpl<$Res>
    implements _$OnHistoryUpdatedStateCopyWith<$Res> {
  __$OnHistoryUpdatedStateCopyWithImpl(_OnHistoryUpdatedState _value,
      $Res Function(_OnHistoryUpdatedState) _then)
      : super(_value, (v) => _then(v as _OnHistoryUpdatedState));

  @override
  _OnHistoryUpdatedState get _value => super._value as _OnHistoryUpdatedState;

  @override
  $Res call({
    Object historyItems = freezed,
  }) {
    return _then(_OnHistoryUpdatedState(
      historyItems: historyItems == freezed
          ? _value.historyItems
          : historyItems as List<HistoryItem>,
    ));
  }
}

class _$_OnHistoryUpdatedState implements _OnHistoryUpdatedState {
  _$_OnHistoryUpdatedState({this.historyItems});

  @override
  final List<HistoryItem> historyItems;

  @override
  String toString() {
    return 'HistoryState.updatedState(historyItems: $historyItems)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _OnHistoryUpdatedState &&
            (identical(other.historyItems, historyItems) ||
                const DeepCollectionEquality()
                    .equals(other.historyItems, historyItems)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(historyItems);

  @override
  _$OnHistoryUpdatedStateCopyWith<_OnHistoryUpdatedState> get copyWith =>
      __$OnHistoryUpdatedStateCopyWithImpl<_OnHistoryUpdatedState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initialState(),
    @required Result updatedState(List<HistoryItem> historyItems),
    @required Result errorState(String errorMessage),
  }) {
    assert(initialState != null);
    assert(updatedState != null);
    assert(errorState != null);
    return updatedState(historyItems);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initialState(),
    Result updatedState(List<HistoryItem> historyItems),
    Result errorState(String errorMessage),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (updatedState != null) {
      return updatedState(historyItems);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initialState(_OnHistoryInitialState value),
    @required Result updatedState(_OnHistoryUpdatedState value),
    @required Result errorState(_OnHistoryErrorState value),
  }) {
    assert(initialState != null);
    assert(updatedState != null);
    assert(errorState != null);
    return updatedState(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initialState(_OnHistoryInitialState value),
    Result updatedState(_OnHistoryUpdatedState value),
    Result errorState(_OnHistoryErrorState value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (updatedState != null) {
      return updatedState(this);
    }
    return orElse();
  }
}

abstract class _OnHistoryUpdatedState implements HistoryState {
  factory _OnHistoryUpdatedState({List<HistoryItem> historyItems}) =
      _$_OnHistoryUpdatedState;

  List<HistoryItem> get historyItems;
  _$OnHistoryUpdatedStateCopyWith<_OnHistoryUpdatedState> get copyWith;
}

abstract class _$OnHistoryErrorStateCopyWith<$Res> {
  factory _$OnHistoryErrorStateCopyWith(_OnHistoryErrorState value,
          $Res Function(_OnHistoryErrorState) then) =
      __$OnHistoryErrorStateCopyWithImpl<$Res>;
  $Res call({String errorMessage});
}

class __$OnHistoryErrorStateCopyWithImpl<$Res>
    extends _$HistoryStateCopyWithImpl<$Res>
    implements _$OnHistoryErrorStateCopyWith<$Res> {
  __$OnHistoryErrorStateCopyWithImpl(
      _OnHistoryErrorState _value, $Res Function(_OnHistoryErrorState) _then)
      : super(_value, (v) => _then(v as _OnHistoryErrorState));

  @override
  _OnHistoryErrorState get _value => super._value as _OnHistoryErrorState;

  @override
  $Res call({
    Object errorMessage = freezed,
  }) {
    return _then(_OnHistoryErrorState(
      errorMessage: errorMessage == freezed
          ? _value.errorMessage
          : errorMessage as String,
    ));
  }
}

class _$_OnHistoryErrorState implements _OnHistoryErrorState {
  _$_OnHistoryErrorState({this.errorMessage});

  @override
  final String errorMessage;

  @override
  String toString() {
    return 'HistoryState.errorState(errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _OnHistoryErrorState &&
            (identical(other.errorMessage, errorMessage) ||
                const DeepCollectionEquality()
                    .equals(other.errorMessage, errorMessage)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(errorMessage);

  @override
  _$OnHistoryErrorStateCopyWith<_OnHistoryErrorState> get copyWith =>
      __$OnHistoryErrorStateCopyWithImpl<_OnHistoryErrorState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initialState(),
    @required Result updatedState(List<HistoryItem> historyItems),
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
    Result updatedState(List<HistoryItem> historyItems),
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
    @required Result initialState(_OnHistoryInitialState value),
    @required Result updatedState(_OnHistoryUpdatedState value),
    @required Result errorState(_OnHistoryErrorState value),
  }) {
    assert(initialState != null);
    assert(updatedState != null);
    assert(errorState != null);
    return errorState(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initialState(_OnHistoryInitialState value),
    Result updatedState(_OnHistoryUpdatedState value),
    Result errorState(_OnHistoryErrorState value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (errorState != null) {
      return errorState(this);
    }
    return orElse();
  }
}

abstract class _OnHistoryErrorState implements HistoryState {
  factory _OnHistoryErrorState({String errorMessage}) = _$_OnHistoryErrorState;

  String get errorMessage;
  _$OnHistoryErrorStateCopyWith<_OnHistoryErrorState> get copyWith;
}
