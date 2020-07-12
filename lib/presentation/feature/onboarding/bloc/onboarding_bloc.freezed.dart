// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'onboarding_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$OnboardingEventTearOff {
  const _$OnboardingEventTearOff();

  _OnOnboardingFinished finished() {
    return _OnOnboardingFinished();
  }

  _OnOnboardingStarted started() {
    return _OnOnboardingStarted();
  }
}

// ignore: unused_element
const $OnboardingEvent = _$OnboardingEventTearOff();

mixin _$OnboardingEvent {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result finished(),
    @required Result started(),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result finished(),
    Result started(),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result finished(_OnOnboardingFinished value),
    @required Result started(_OnOnboardingStarted value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result finished(_OnOnboardingFinished value),
    Result started(_OnOnboardingStarted value),
    @required Result orElse(),
  });
}

abstract class $OnboardingEventCopyWith<$Res> {
  factory $OnboardingEventCopyWith(
          OnboardingEvent value, $Res Function(OnboardingEvent) then) =
      _$OnboardingEventCopyWithImpl<$Res>;
}

class _$OnboardingEventCopyWithImpl<$Res>
    implements $OnboardingEventCopyWith<$Res> {
  _$OnboardingEventCopyWithImpl(this._value, this._then);

  final OnboardingEvent _value;
  // ignore: unused_field
  final $Res Function(OnboardingEvent) _then;
}

abstract class _$OnOnboardingFinishedCopyWith<$Res> {
  factory _$OnOnboardingFinishedCopyWith(_OnOnboardingFinished value,
          $Res Function(_OnOnboardingFinished) then) =
      __$OnOnboardingFinishedCopyWithImpl<$Res>;
}

class __$OnOnboardingFinishedCopyWithImpl<$Res>
    extends _$OnboardingEventCopyWithImpl<$Res>
    implements _$OnOnboardingFinishedCopyWith<$Res> {
  __$OnOnboardingFinishedCopyWithImpl(
      _OnOnboardingFinished _value, $Res Function(_OnOnboardingFinished) _then)
      : super(_value, (v) => _then(v as _OnOnboardingFinished));

  @override
  _OnOnboardingFinished get _value => super._value as _OnOnboardingFinished;
}

class _$_OnOnboardingFinished
    with DiagnosticableTreeMixin
    implements _OnOnboardingFinished {
  _$_OnOnboardingFinished();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'OnboardingEvent.finished()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'OnboardingEvent.finished'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _OnOnboardingFinished);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result finished(),
    @required Result started(),
  }) {
    assert(finished != null);
    assert(started != null);
    return finished();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result finished(),
    Result started(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (finished != null) {
      return finished();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result finished(_OnOnboardingFinished value),
    @required Result started(_OnOnboardingStarted value),
  }) {
    assert(finished != null);
    assert(started != null);
    return finished(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result finished(_OnOnboardingFinished value),
    Result started(_OnOnboardingStarted value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (finished != null) {
      return finished(this);
    }
    return orElse();
  }
}

abstract class _OnOnboardingFinished implements OnboardingEvent {
  factory _OnOnboardingFinished() = _$_OnOnboardingFinished;
}

abstract class _$OnOnboardingStartedCopyWith<$Res> {
  factory _$OnOnboardingStartedCopyWith(_OnOnboardingStarted value,
          $Res Function(_OnOnboardingStarted) then) =
      __$OnOnboardingStartedCopyWithImpl<$Res>;
}

class __$OnOnboardingStartedCopyWithImpl<$Res>
    extends _$OnboardingEventCopyWithImpl<$Res>
    implements _$OnOnboardingStartedCopyWith<$Res> {
  __$OnOnboardingStartedCopyWithImpl(
      _OnOnboardingStarted _value, $Res Function(_OnOnboardingStarted) _then)
      : super(_value, (v) => _then(v as _OnOnboardingStarted));

  @override
  _OnOnboardingStarted get _value => super._value as _OnOnboardingStarted;
}

class _$_OnOnboardingStarted
    with DiagnosticableTreeMixin
    implements _OnOnboardingStarted {
  _$_OnOnboardingStarted();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'OnboardingEvent.started()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'OnboardingEvent.started'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _OnOnboardingStarted);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result finished(),
    @required Result started(),
  }) {
    assert(finished != null);
    assert(started != null);
    return started();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result finished(),
    Result started(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result finished(_OnOnboardingFinished value),
    @required Result started(_OnOnboardingStarted value),
  }) {
    assert(finished != null);
    assert(started != null);
    return started(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result finished(_OnOnboardingFinished value),
    Result started(_OnOnboardingStarted value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _OnOnboardingStarted implements OnboardingEvent {
  factory _OnOnboardingStarted() = _$_OnOnboardingStarted;
}

class _$OnboardingStateTearOff {
  const _$OnboardingStateTearOff();

  _OnOnboardingInitialState initialState() {
    return _OnOnboardingInitialState();
  }

  _OnOnboardingSkipState skipOnboardingState() {
    return _OnOnboardingSkipState();
  }

  _OnOnboardingStartState startOnboardingState() {
    return _OnOnboardingStartState();
  }
}

// ignore: unused_element
const $OnboardingState = _$OnboardingStateTearOff();

mixin _$OnboardingState {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initialState(),
    @required Result skipOnboardingState(),
    @required Result startOnboardingState(),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initialState(),
    Result skipOnboardingState(),
    Result startOnboardingState(),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initialState(_OnOnboardingInitialState value),
    @required Result skipOnboardingState(_OnOnboardingSkipState value),
    @required Result startOnboardingState(_OnOnboardingStartState value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initialState(_OnOnboardingInitialState value),
    Result skipOnboardingState(_OnOnboardingSkipState value),
    Result startOnboardingState(_OnOnboardingStartState value),
    @required Result orElse(),
  });
}

abstract class $OnboardingStateCopyWith<$Res> {
  factory $OnboardingStateCopyWith(
          OnboardingState value, $Res Function(OnboardingState) then) =
      _$OnboardingStateCopyWithImpl<$Res>;
}

class _$OnboardingStateCopyWithImpl<$Res>
    implements $OnboardingStateCopyWith<$Res> {
  _$OnboardingStateCopyWithImpl(this._value, this._then);

  final OnboardingState _value;
  // ignore: unused_field
  final $Res Function(OnboardingState) _then;
}

abstract class _$OnOnboardingInitialStateCopyWith<$Res> {
  factory _$OnOnboardingInitialStateCopyWith(_OnOnboardingInitialState value,
          $Res Function(_OnOnboardingInitialState) then) =
      __$OnOnboardingInitialStateCopyWithImpl<$Res>;
}

class __$OnOnboardingInitialStateCopyWithImpl<$Res>
    extends _$OnboardingStateCopyWithImpl<$Res>
    implements _$OnOnboardingInitialStateCopyWith<$Res> {
  __$OnOnboardingInitialStateCopyWithImpl(_OnOnboardingInitialState _value,
      $Res Function(_OnOnboardingInitialState) _then)
      : super(_value, (v) => _then(v as _OnOnboardingInitialState));

  @override
  _OnOnboardingInitialState get _value =>
      super._value as _OnOnboardingInitialState;
}

class _$_OnOnboardingInitialState
    with DiagnosticableTreeMixin
    implements _OnOnboardingInitialState {
  _$_OnOnboardingInitialState();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'OnboardingState.initialState()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'OnboardingState.initialState'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _OnOnboardingInitialState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initialState(),
    @required Result skipOnboardingState(),
    @required Result startOnboardingState(),
  }) {
    assert(initialState != null);
    assert(skipOnboardingState != null);
    assert(startOnboardingState != null);
    return initialState();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initialState(),
    Result skipOnboardingState(),
    Result startOnboardingState(),
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
    @required Result initialState(_OnOnboardingInitialState value),
    @required Result skipOnboardingState(_OnOnboardingSkipState value),
    @required Result startOnboardingState(_OnOnboardingStartState value),
  }) {
    assert(initialState != null);
    assert(skipOnboardingState != null);
    assert(startOnboardingState != null);
    return initialState(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initialState(_OnOnboardingInitialState value),
    Result skipOnboardingState(_OnOnboardingSkipState value),
    Result startOnboardingState(_OnOnboardingStartState value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (initialState != null) {
      return initialState(this);
    }
    return orElse();
  }
}

abstract class _OnOnboardingInitialState implements OnboardingState {
  factory _OnOnboardingInitialState() = _$_OnOnboardingInitialState;
}

abstract class _$OnOnboardingSkipStateCopyWith<$Res> {
  factory _$OnOnboardingSkipStateCopyWith(_OnOnboardingSkipState value,
          $Res Function(_OnOnboardingSkipState) then) =
      __$OnOnboardingSkipStateCopyWithImpl<$Res>;
}

class __$OnOnboardingSkipStateCopyWithImpl<$Res>
    extends _$OnboardingStateCopyWithImpl<$Res>
    implements _$OnOnboardingSkipStateCopyWith<$Res> {
  __$OnOnboardingSkipStateCopyWithImpl(_OnOnboardingSkipState _value,
      $Res Function(_OnOnboardingSkipState) _then)
      : super(_value, (v) => _then(v as _OnOnboardingSkipState));

  @override
  _OnOnboardingSkipState get _value => super._value as _OnOnboardingSkipState;
}

class _$_OnOnboardingSkipState
    with DiagnosticableTreeMixin
    implements _OnOnboardingSkipState {
  _$_OnOnboardingSkipState();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'OnboardingState.skipOnboardingState()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'OnboardingState.skipOnboardingState'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _OnOnboardingSkipState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initialState(),
    @required Result skipOnboardingState(),
    @required Result startOnboardingState(),
  }) {
    assert(initialState != null);
    assert(skipOnboardingState != null);
    assert(startOnboardingState != null);
    return skipOnboardingState();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initialState(),
    Result skipOnboardingState(),
    Result startOnboardingState(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (skipOnboardingState != null) {
      return skipOnboardingState();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initialState(_OnOnboardingInitialState value),
    @required Result skipOnboardingState(_OnOnboardingSkipState value),
    @required Result startOnboardingState(_OnOnboardingStartState value),
  }) {
    assert(initialState != null);
    assert(skipOnboardingState != null);
    assert(startOnboardingState != null);
    return skipOnboardingState(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initialState(_OnOnboardingInitialState value),
    Result skipOnboardingState(_OnOnboardingSkipState value),
    Result startOnboardingState(_OnOnboardingStartState value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (skipOnboardingState != null) {
      return skipOnboardingState(this);
    }
    return orElse();
  }
}

abstract class _OnOnboardingSkipState implements OnboardingState {
  factory _OnOnboardingSkipState() = _$_OnOnboardingSkipState;
}

abstract class _$OnOnboardingStartStateCopyWith<$Res> {
  factory _$OnOnboardingStartStateCopyWith(_OnOnboardingStartState value,
          $Res Function(_OnOnboardingStartState) then) =
      __$OnOnboardingStartStateCopyWithImpl<$Res>;
}

class __$OnOnboardingStartStateCopyWithImpl<$Res>
    extends _$OnboardingStateCopyWithImpl<$Res>
    implements _$OnOnboardingStartStateCopyWith<$Res> {
  __$OnOnboardingStartStateCopyWithImpl(_OnOnboardingStartState _value,
      $Res Function(_OnOnboardingStartState) _then)
      : super(_value, (v) => _then(v as _OnOnboardingStartState));

  @override
  _OnOnboardingStartState get _value => super._value as _OnOnboardingStartState;
}

class _$_OnOnboardingStartState
    with DiagnosticableTreeMixin
    implements _OnOnboardingStartState {
  _$_OnOnboardingStartState();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'OnboardingState.startOnboardingState()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(
          DiagnosticsProperty('type', 'OnboardingState.startOnboardingState'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _OnOnboardingStartState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initialState(),
    @required Result skipOnboardingState(),
    @required Result startOnboardingState(),
  }) {
    assert(initialState != null);
    assert(skipOnboardingState != null);
    assert(startOnboardingState != null);
    return startOnboardingState();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initialState(),
    Result skipOnboardingState(),
    Result startOnboardingState(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (startOnboardingState != null) {
      return startOnboardingState();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initialState(_OnOnboardingInitialState value),
    @required Result skipOnboardingState(_OnOnboardingSkipState value),
    @required Result startOnboardingState(_OnOnboardingStartState value),
  }) {
    assert(initialState != null);
    assert(skipOnboardingState != null);
    assert(startOnboardingState != null);
    return startOnboardingState(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initialState(_OnOnboardingInitialState value),
    Result skipOnboardingState(_OnOnboardingSkipState value),
    Result startOnboardingState(_OnOnboardingStartState value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (startOnboardingState != null) {
      return startOnboardingState(this);
    }
    return orElse();
  }
}

abstract class _OnOnboardingStartState implements OnboardingState {
  factory _OnOnboardingStartState() = _$_OnOnboardingStartState;
}
