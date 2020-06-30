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
}

// ignore: unused_element
const $OnboardingEvent = _$OnboardingEventTearOff();

mixin _$OnboardingEvent {}

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
}

abstract class _OnOnboardingFinished implements OnboardingEvent {
  factory _OnOnboardingFinished() = _$_OnOnboardingFinished;
}

class _$OnboardingStateTearOff {
  const _$OnboardingStateTearOff();

  _OnOnboardingInitialState initialState() {
    return _OnOnboardingInitialState();
  }

  _OnOnboardingSkipState skipState() {
    return _OnOnboardingSkipState();
  }

  _OnOnboardingStartState startState() {
    return _OnOnboardingStartState();
  }
}

// ignore: unused_element
const $OnboardingState = _$OnboardingStateTearOff();

mixin _$OnboardingState {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initialState(),
    @required Result skipState(),
    @required Result startState(),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initialState(),
    Result skipState(),
    Result startState(),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initialState(_OnOnboardingInitialState value),
    @required Result skipState(_OnOnboardingSkipState value),
    @required Result startState(_OnOnboardingStartState value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initialState(_OnOnboardingInitialState value),
    Result skipState(_OnOnboardingSkipState value),
    Result startState(_OnOnboardingStartState value),
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
    @required Result skipState(),
    @required Result startState(),
  }) {
    assert(initialState != null);
    assert(skipState != null);
    assert(startState != null);
    return initialState();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initialState(),
    Result skipState(),
    Result startState(),
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
    @required Result skipState(_OnOnboardingSkipState value),
    @required Result startState(_OnOnboardingStartState value),
  }) {
    assert(initialState != null);
    assert(skipState != null);
    assert(startState != null);
    return initialState(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initialState(_OnOnboardingInitialState value),
    Result skipState(_OnOnboardingSkipState value),
    Result startState(_OnOnboardingStartState value),
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
    return 'OnboardingState.skipState()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'OnboardingState.skipState'));
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
    @required Result skipState(),
    @required Result startState(),
  }) {
    assert(initialState != null);
    assert(skipState != null);
    assert(startState != null);
    return skipState();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initialState(),
    Result skipState(),
    Result startState(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (skipState != null) {
      return skipState();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initialState(_OnOnboardingInitialState value),
    @required Result skipState(_OnOnboardingSkipState value),
    @required Result startState(_OnOnboardingStartState value),
  }) {
    assert(initialState != null);
    assert(skipState != null);
    assert(startState != null);
    return skipState(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initialState(_OnOnboardingInitialState value),
    Result skipState(_OnOnboardingSkipState value),
    Result startState(_OnOnboardingStartState value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (skipState != null) {
      return skipState(this);
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
    return 'OnboardingState.startState()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'OnboardingState.startState'));
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
    @required Result skipState(),
    @required Result startState(),
  }) {
    assert(initialState != null);
    assert(skipState != null);
    assert(startState != null);
    return startState();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initialState(),
    Result skipState(),
    Result startState(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (startState != null) {
      return startState();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initialState(_OnOnboardingInitialState value),
    @required Result skipState(_OnOnboardingSkipState value),
    @required Result startState(_OnOnboardingStartState value),
  }) {
    assert(initialState != null);
    assert(skipState != null);
    assert(startState != null);
    return startState(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initialState(_OnOnboardingInitialState value),
    Result skipState(_OnOnboardingSkipState value),
    Result startState(_OnOnboardingStartState value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (startState != null) {
      return startState(this);
    }
    return orElse();
  }
}

abstract class _OnOnboardingStartState implements OnboardingState {
  factory _OnOnboardingStartState() = _$_OnOnboardingStartState;
}
