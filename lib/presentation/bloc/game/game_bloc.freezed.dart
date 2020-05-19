// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'game_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$GameEventTearOff {
  const _$GameEventTearOff();

  _OnGameCreated gameCreated(
      {String gameTitle, String numberOfPlayers, String pointsToWin}) {
    return _OnGameCreated(
      gameTitle: gameTitle,
      numberOfPlayers: numberOfPlayers,
      pointsToWin: pointsToWin,
    );
  }

  _OnGameUpdated gameUpdated({Game newGame}) {
    return _OnGameUpdated(
      newGame: newGame,
    );
  }

  _OnPlayerCreationStarted playerCreationStarted(
      {String playername, String points, String bonusPoints}) {
    return _OnPlayerCreationStarted(
      playername: playername,
      points: points,
      bonusPoints: bonusPoints,
    );
  }

  _OnPlayerCreatedEvent playerCreated(
      {String playerName, String points, String bonusPoints}) {
    return _OnPlayerCreatedEvent(
      playerName: playerName,
      points: points,
      bonusPoints: bonusPoints,
    );
  }

  _OnGameReset resetGame() {
    return _OnGameReset();
  }

  _OnDeletePlayer deletePlayer({Player playerToDelete}) {
    return _OnDeletePlayer(
      playerToDelete: playerToDelete,
    );
  }

  _OnEndGameSooner endGameSooner({Game currentGame}) {
    return _OnEndGameSooner(
      currentGame: currentGame,
    );
  }
}

// ignore: unused_element
const $GameEvent = _$GameEventTearOff();

mixin _$GameEvent {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required
        Result gameCreated(
            String gameTitle, String numberOfPlayers, String pointsToWin),
    @required Result gameUpdated(Game newGame),
    @required
        Result playerCreationStarted(
            String playername, String points, String bonusPoints),
    @required
        Result playerCreated(
            String playerName, String points, String bonusPoints),
    @required Result resetGame(),
    @required Result deletePlayer(Player playerToDelete),
    @required Result endGameSooner(Game currentGame),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result gameCreated(
        String gameTitle, String numberOfPlayers, String pointsToWin),
    Result gameUpdated(Game newGame),
    Result playerCreationStarted(
        String playername, String points, String bonusPoints),
    Result playerCreated(String playerName, String points, String bonusPoints),
    Result resetGame(),
    Result deletePlayer(Player playerToDelete),
    Result endGameSooner(Game currentGame),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result gameCreated(_OnGameCreated value),
    @required Result gameUpdated(_OnGameUpdated value),
    @required Result playerCreationStarted(_OnPlayerCreationStarted value),
    @required Result playerCreated(_OnPlayerCreatedEvent value),
    @required Result resetGame(_OnGameReset value),
    @required Result deletePlayer(_OnDeletePlayer value),
    @required Result endGameSooner(_OnEndGameSooner value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result gameCreated(_OnGameCreated value),
    Result gameUpdated(_OnGameUpdated value),
    Result playerCreationStarted(_OnPlayerCreationStarted value),
    Result playerCreated(_OnPlayerCreatedEvent value),
    Result resetGame(_OnGameReset value),
    Result deletePlayer(_OnDeletePlayer value),
    Result endGameSooner(_OnEndGameSooner value),
    @required Result orElse(),
  });
}

abstract class $GameEventCopyWith<$Res> {
  factory $GameEventCopyWith(GameEvent value, $Res Function(GameEvent) then) =
      _$GameEventCopyWithImpl<$Res>;
}

class _$GameEventCopyWithImpl<$Res> implements $GameEventCopyWith<$Res> {
  _$GameEventCopyWithImpl(this._value, this._then);

  final GameEvent _value;
  // ignore: unused_field
  final $Res Function(GameEvent) _then;
}

abstract class _$OnGameCreatedCopyWith<$Res> {
  factory _$OnGameCreatedCopyWith(
          _OnGameCreated value, $Res Function(_OnGameCreated) then) =
      __$OnGameCreatedCopyWithImpl<$Res>;
  $Res call({String gameTitle, String numberOfPlayers, String pointsToWin});
}

class __$OnGameCreatedCopyWithImpl<$Res> extends _$GameEventCopyWithImpl<$Res>
    implements _$OnGameCreatedCopyWith<$Res> {
  __$OnGameCreatedCopyWithImpl(
      _OnGameCreated _value, $Res Function(_OnGameCreated) _then)
      : super(_value, (v) => _then(v as _OnGameCreated));

  @override
  _OnGameCreated get _value => super._value as _OnGameCreated;

  @override
  $Res call({
    Object gameTitle = freezed,
    Object numberOfPlayers = freezed,
    Object pointsToWin = freezed,
  }) {
    return _then(_OnGameCreated(
      gameTitle: gameTitle == freezed ? _value.gameTitle : gameTitle as String,
      numberOfPlayers: numberOfPlayers == freezed
          ? _value.numberOfPlayers
          : numberOfPlayers as String,
      pointsToWin:
          pointsToWin == freezed ? _value.pointsToWin : pointsToWin as String,
    ));
  }
}

class _$_OnGameCreated with DiagnosticableTreeMixin implements _OnGameCreated {
  _$_OnGameCreated({this.gameTitle, this.numberOfPlayers, this.pointsToWin});

  @override
  final String gameTitle;
  @override
  final String numberOfPlayers;
  @override
  final String pointsToWin;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'GameEvent.gameCreated(gameTitle: $gameTitle, numberOfPlayers: $numberOfPlayers, pointsToWin: $pointsToWin)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'GameEvent.gameCreated'))
      ..add(DiagnosticsProperty('gameTitle', gameTitle))
      ..add(DiagnosticsProperty('numberOfPlayers', numberOfPlayers))
      ..add(DiagnosticsProperty('pointsToWin', pointsToWin));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _OnGameCreated &&
            (identical(other.gameTitle, gameTitle) ||
                const DeepCollectionEquality()
                    .equals(other.gameTitle, gameTitle)) &&
            (identical(other.numberOfPlayers, numberOfPlayers) ||
                const DeepCollectionEquality()
                    .equals(other.numberOfPlayers, numberOfPlayers)) &&
            (identical(other.pointsToWin, pointsToWin) ||
                const DeepCollectionEquality()
                    .equals(other.pointsToWin, pointsToWin)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(gameTitle) ^
      const DeepCollectionEquality().hash(numberOfPlayers) ^
      const DeepCollectionEquality().hash(pointsToWin);

  @override
  _$OnGameCreatedCopyWith<_OnGameCreated> get copyWith =>
      __$OnGameCreatedCopyWithImpl<_OnGameCreated>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required
        Result gameCreated(
            String gameTitle, String numberOfPlayers, String pointsToWin),
    @required Result gameUpdated(Game newGame),
    @required
        Result playerCreationStarted(
            String playername, String points, String bonusPoints),
    @required
        Result playerCreated(
            String playerName, String points, String bonusPoints),
    @required Result resetGame(),
    @required Result deletePlayer(Player playerToDelete),
    @required Result endGameSooner(Game currentGame),
  }) {
    assert(gameCreated != null);
    assert(gameUpdated != null);
    assert(playerCreationStarted != null);
    assert(playerCreated != null);
    assert(resetGame != null);
    assert(deletePlayer != null);
    assert(endGameSooner != null);
    return gameCreated(gameTitle, numberOfPlayers, pointsToWin);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result gameCreated(
        String gameTitle, String numberOfPlayers, String pointsToWin),
    Result gameUpdated(Game newGame),
    Result playerCreationStarted(
        String playername, String points, String bonusPoints),
    Result playerCreated(String playerName, String points, String bonusPoints),
    Result resetGame(),
    Result deletePlayer(Player playerToDelete),
    Result endGameSooner(Game currentGame),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (gameCreated != null) {
      return gameCreated(gameTitle, numberOfPlayers, pointsToWin);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result gameCreated(_OnGameCreated value),
    @required Result gameUpdated(_OnGameUpdated value),
    @required Result playerCreationStarted(_OnPlayerCreationStarted value),
    @required Result playerCreated(_OnPlayerCreatedEvent value),
    @required Result resetGame(_OnGameReset value),
    @required Result deletePlayer(_OnDeletePlayer value),
    @required Result endGameSooner(_OnEndGameSooner value),
  }) {
    assert(gameCreated != null);
    assert(gameUpdated != null);
    assert(playerCreationStarted != null);
    assert(playerCreated != null);
    assert(resetGame != null);
    assert(deletePlayer != null);
    assert(endGameSooner != null);
    return gameCreated(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result gameCreated(_OnGameCreated value),
    Result gameUpdated(_OnGameUpdated value),
    Result playerCreationStarted(_OnPlayerCreationStarted value),
    Result playerCreated(_OnPlayerCreatedEvent value),
    Result resetGame(_OnGameReset value),
    Result deletePlayer(_OnDeletePlayer value),
    Result endGameSooner(_OnEndGameSooner value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (gameCreated != null) {
      return gameCreated(this);
    }
    return orElse();
  }
}

abstract class _OnGameCreated implements GameEvent {
  factory _OnGameCreated(
      {String gameTitle,
      String numberOfPlayers,
      String pointsToWin}) = _$_OnGameCreated;

  String get gameTitle;
  String get numberOfPlayers;
  String get pointsToWin;
  _$OnGameCreatedCopyWith<_OnGameCreated> get copyWith;
}

abstract class _$OnGameUpdatedCopyWith<$Res> {
  factory _$OnGameUpdatedCopyWith(
          _OnGameUpdated value, $Res Function(_OnGameUpdated) then) =
      __$OnGameUpdatedCopyWithImpl<$Res>;
  $Res call({Game newGame});

  $GameCopyWith<$Res> get newGame;
}

class __$OnGameUpdatedCopyWithImpl<$Res> extends _$GameEventCopyWithImpl<$Res>
    implements _$OnGameUpdatedCopyWith<$Res> {
  __$OnGameUpdatedCopyWithImpl(
      _OnGameUpdated _value, $Res Function(_OnGameUpdated) _then)
      : super(_value, (v) => _then(v as _OnGameUpdated));

  @override
  _OnGameUpdated get _value => super._value as _OnGameUpdated;

  @override
  $Res call({
    Object newGame = freezed,
  }) {
    return _then(_OnGameUpdated(
      newGame: newGame == freezed ? _value.newGame : newGame as Game,
    ));
  }

  @override
  $GameCopyWith<$Res> get newGame {
    if (_value.newGame == null) {
      return null;
    }
    return $GameCopyWith<$Res>(_value.newGame, (value) {
      return _then(_value.copyWith(newGame: value));
    });
  }
}

class _$_OnGameUpdated with DiagnosticableTreeMixin implements _OnGameUpdated {
  _$_OnGameUpdated({this.newGame});

  @override
  final Game newGame;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'GameEvent.gameUpdated(newGame: $newGame)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'GameEvent.gameUpdated'))
      ..add(DiagnosticsProperty('newGame', newGame));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _OnGameUpdated &&
            (identical(other.newGame, newGame) ||
                const DeepCollectionEquality().equals(other.newGame, newGame)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(newGame);

  @override
  _$OnGameUpdatedCopyWith<_OnGameUpdated> get copyWith =>
      __$OnGameUpdatedCopyWithImpl<_OnGameUpdated>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required
        Result gameCreated(
            String gameTitle, String numberOfPlayers, String pointsToWin),
    @required Result gameUpdated(Game newGame),
    @required
        Result playerCreationStarted(
            String playername, String points, String bonusPoints),
    @required
        Result playerCreated(
            String playerName, String points, String bonusPoints),
    @required Result resetGame(),
    @required Result deletePlayer(Player playerToDelete),
    @required Result endGameSooner(Game currentGame),
  }) {
    assert(gameCreated != null);
    assert(gameUpdated != null);
    assert(playerCreationStarted != null);
    assert(playerCreated != null);
    assert(resetGame != null);
    assert(deletePlayer != null);
    assert(endGameSooner != null);
    return gameUpdated(newGame);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result gameCreated(
        String gameTitle, String numberOfPlayers, String pointsToWin),
    Result gameUpdated(Game newGame),
    Result playerCreationStarted(
        String playername, String points, String bonusPoints),
    Result playerCreated(String playerName, String points, String bonusPoints),
    Result resetGame(),
    Result deletePlayer(Player playerToDelete),
    Result endGameSooner(Game currentGame),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (gameUpdated != null) {
      return gameUpdated(newGame);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result gameCreated(_OnGameCreated value),
    @required Result gameUpdated(_OnGameUpdated value),
    @required Result playerCreationStarted(_OnPlayerCreationStarted value),
    @required Result playerCreated(_OnPlayerCreatedEvent value),
    @required Result resetGame(_OnGameReset value),
    @required Result deletePlayer(_OnDeletePlayer value),
    @required Result endGameSooner(_OnEndGameSooner value),
  }) {
    assert(gameCreated != null);
    assert(gameUpdated != null);
    assert(playerCreationStarted != null);
    assert(playerCreated != null);
    assert(resetGame != null);
    assert(deletePlayer != null);
    assert(endGameSooner != null);
    return gameUpdated(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result gameCreated(_OnGameCreated value),
    Result gameUpdated(_OnGameUpdated value),
    Result playerCreationStarted(_OnPlayerCreationStarted value),
    Result playerCreated(_OnPlayerCreatedEvent value),
    Result resetGame(_OnGameReset value),
    Result deletePlayer(_OnDeletePlayer value),
    Result endGameSooner(_OnEndGameSooner value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (gameUpdated != null) {
      return gameUpdated(this);
    }
    return orElse();
  }
}

abstract class _OnGameUpdated implements GameEvent {
  factory _OnGameUpdated({Game newGame}) = _$_OnGameUpdated;

  Game get newGame;
  _$OnGameUpdatedCopyWith<_OnGameUpdated> get copyWith;
}

abstract class _$OnPlayerCreationStartedCopyWith<$Res> {
  factory _$OnPlayerCreationStartedCopyWith(_OnPlayerCreationStarted value,
          $Res Function(_OnPlayerCreationStarted) then) =
      __$OnPlayerCreationStartedCopyWithImpl<$Res>;
  $Res call({String playername, String points, String bonusPoints});
}

class __$OnPlayerCreationStartedCopyWithImpl<$Res>
    extends _$GameEventCopyWithImpl<$Res>
    implements _$OnPlayerCreationStartedCopyWith<$Res> {
  __$OnPlayerCreationStartedCopyWithImpl(_OnPlayerCreationStarted _value,
      $Res Function(_OnPlayerCreationStarted) _then)
      : super(_value, (v) => _then(v as _OnPlayerCreationStarted));

  @override
  _OnPlayerCreationStarted get _value =>
      super._value as _OnPlayerCreationStarted;

  @override
  $Res call({
    Object playername = freezed,
    Object points = freezed,
    Object bonusPoints = freezed,
  }) {
    return _then(_OnPlayerCreationStarted(
      playername:
          playername == freezed ? _value.playername : playername as String,
      points: points == freezed ? _value.points : points as String,
      bonusPoints:
          bonusPoints == freezed ? _value.bonusPoints : bonusPoints as String,
    ));
  }
}

class _$_OnPlayerCreationStarted
    with DiagnosticableTreeMixin
    implements _OnPlayerCreationStarted {
  _$_OnPlayerCreationStarted({this.playername, this.points, this.bonusPoints});

  @override
  final String playername;
  @override
  final String points;
  @override
  final String bonusPoints;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'GameEvent.playerCreationStarted(playername: $playername, points: $points, bonusPoints: $bonusPoints)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'GameEvent.playerCreationStarted'))
      ..add(DiagnosticsProperty('playername', playername))
      ..add(DiagnosticsProperty('points', points))
      ..add(DiagnosticsProperty('bonusPoints', bonusPoints));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _OnPlayerCreationStarted &&
            (identical(other.playername, playername) ||
                const DeepCollectionEquality()
                    .equals(other.playername, playername)) &&
            (identical(other.points, points) ||
                const DeepCollectionEquality().equals(other.points, points)) &&
            (identical(other.bonusPoints, bonusPoints) ||
                const DeepCollectionEquality()
                    .equals(other.bonusPoints, bonusPoints)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(playername) ^
      const DeepCollectionEquality().hash(points) ^
      const DeepCollectionEquality().hash(bonusPoints);

  @override
  _$OnPlayerCreationStartedCopyWith<_OnPlayerCreationStarted> get copyWith =>
      __$OnPlayerCreationStartedCopyWithImpl<_OnPlayerCreationStarted>(
          this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required
        Result gameCreated(
            String gameTitle, String numberOfPlayers, String pointsToWin),
    @required Result gameUpdated(Game newGame),
    @required
        Result playerCreationStarted(
            String playername, String points, String bonusPoints),
    @required
        Result playerCreated(
            String playerName, String points, String bonusPoints),
    @required Result resetGame(),
    @required Result deletePlayer(Player playerToDelete),
    @required Result endGameSooner(Game currentGame),
  }) {
    assert(gameCreated != null);
    assert(gameUpdated != null);
    assert(playerCreationStarted != null);
    assert(playerCreated != null);
    assert(resetGame != null);
    assert(deletePlayer != null);
    assert(endGameSooner != null);
    return playerCreationStarted(playername, points, bonusPoints);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result gameCreated(
        String gameTitle, String numberOfPlayers, String pointsToWin),
    Result gameUpdated(Game newGame),
    Result playerCreationStarted(
        String playername, String points, String bonusPoints),
    Result playerCreated(String playerName, String points, String bonusPoints),
    Result resetGame(),
    Result deletePlayer(Player playerToDelete),
    Result endGameSooner(Game currentGame),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (playerCreationStarted != null) {
      return playerCreationStarted(playername, points, bonusPoints);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result gameCreated(_OnGameCreated value),
    @required Result gameUpdated(_OnGameUpdated value),
    @required Result playerCreationStarted(_OnPlayerCreationStarted value),
    @required Result playerCreated(_OnPlayerCreatedEvent value),
    @required Result resetGame(_OnGameReset value),
    @required Result deletePlayer(_OnDeletePlayer value),
    @required Result endGameSooner(_OnEndGameSooner value),
  }) {
    assert(gameCreated != null);
    assert(gameUpdated != null);
    assert(playerCreationStarted != null);
    assert(playerCreated != null);
    assert(resetGame != null);
    assert(deletePlayer != null);
    assert(endGameSooner != null);
    return playerCreationStarted(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result gameCreated(_OnGameCreated value),
    Result gameUpdated(_OnGameUpdated value),
    Result playerCreationStarted(_OnPlayerCreationStarted value),
    Result playerCreated(_OnPlayerCreatedEvent value),
    Result resetGame(_OnGameReset value),
    Result deletePlayer(_OnDeletePlayer value),
    Result endGameSooner(_OnEndGameSooner value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (playerCreationStarted != null) {
      return playerCreationStarted(this);
    }
    return orElse();
  }
}

abstract class _OnPlayerCreationStarted implements GameEvent {
  factory _OnPlayerCreationStarted(
      {String playername,
      String points,
      String bonusPoints}) = _$_OnPlayerCreationStarted;

  String get playername;
  String get points;
  String get bonusPoints;
  _$OnPlayerCreationStartedCopyWith<_OnPlayerCreationStarted> get copyWith;
}

abstract class _$OnPlayerCreatedEventCopyWith<$Res> {
  factory _$OnPlayerCreatedEventCopyWith(_OnPlayerCreatedEvent value,
          $Res Function(_OnPlayerCreatedEvent) then) =
      __$OnPlayerCreatedEventCopyWithImpl<$Res>;
  $Res call({String playerName, String points, String bonusPoints});
}

class __$OnPlayerCreatedEventCopyWithImpl<$Res>
    extends _$GameEventCopyWithImpl<$Res>
    implements _$OnPlayerCreatedEventCopyWith<$Res> {
  __$OnPlayerCreatedEventCopyWithImpl(
      _OnPlayerCreatedEvent _value, $Res Function(_OnPlayerCreatedEvent) _then)
      : super(_value, (v) => _then(v as _OnPlayerCreatedEvent));

  @override
  _OnPlayerCreatedEvent get _value => super._value as _OnPlayerCreatedEvent;

  @override
  $Res call({
    Object playerName = freezed,
    Object points = freezed,
    Object bonusPoints = freezed,
  }) {
    return _then(_OnPlayerCreatedEvent(
      playerName:
          playerName == freezed ? _value.playerName : playerName as String,
      points: points == freezed ? _value.points : points as String,
      bonusPoints:
          bonusPoints == freezed ? _value.bonusPoints : bonusPoints as String,
    ));
  }
}

class _$_OnPlayerCreatedEvent
    with DiagnosticableTreeMixin
    implements _OnPlayerCreatedEvent {
  _$_OnPlayerCreatedEvent({this.playerName, this.points, this.bonusPoints});

  @override
  final String playerName;
  @override
  final String points;
  @override
  final String bonusPoints;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'GameEvent.playerCreated(playerName: $playerName, points: $points, bonusPoints: $bonusPoints)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'GameEvent.playerCreated'))
      ..add(DiagnosticsProperty('playerName', playerName))
      ..add(DiagnosticsProperty('points', points))
      ..add(DiagnosticsProperty('bonusPoints', bonusPoints));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _OnPlayerCreatedEvent &&
            (identical(other.playerName, playerName) ||
                const DeepCollectionEquality()
                    .equals(other.playerName, playerName)) &&
            (identical(other.points, points) ||
                const DeepCollectionEquality().equals(other.points, points)) &&
            (identical(other.bonusPoints, bonusPoints) ||
                const DeepCollectionEquality()
                    .equals(other.bonusPoints, bonusPoints)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(playerName) ^
      const DeepCollectionEquality().hash(points) ^
      const DeepCollectionEquality().hash(bonusPoints);

  @override
  _$OnPlayerCreatedEventCopyWith<_OnPlayerCreatedEvent> get copyWith =>
      __$OnPlayerCreatedEventCopyWithImpl<_OnPlayerCreatedEvent>(
          this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required
        Result gameCreated(
            String gameTitle, String numberOfPlayers, String pointsToWin),
    @required Result gameUpdated(Game newGame),
    @required
        Result playerCreationStarted(
            String playername, String points, String bonusPoints),
    @required
        Result playerCreated(
            String playerName, String points, String bonusPoints),
    @required Result resetGame(),
    @required Result deletePlayer(Player playerToDelete),
    @required Result endGameSooner(Game currentGame),
  }) {
    assert(gameCreated != null);
    assert(gameUpdated != null);
    assert(playerCreationStarted != null);
    assert(playerCreated != null);
    assert(resetGame != null);
    assert(deletePlayer != null);
    assert(endGameSooner != null);
    return playerCreated(playerName, points, bonusPoints);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result gameCreated(
        String gameTitle, String numberOfPlayers, String pointsToWin),
    Result gameUpdated(Game newGame),
    Result playerCreationStarted(
        String playername, String points, String bonusPoints),
    Result playerCreated(String playerName, String points, String bonusPoints),
    Result resetGame(),
    Result deletePlayer(Player playerToDelete),
    Result endGameSooner(Game currentGame),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (playerCreated != null) {
      return playerCreated(playerName, points, bonusPoints);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result gameCreated(_OnGameCreated value),
    @required Result gameUpdated(_OnGameUpdated value),
    @required Result playerCreationStarted(_OnPlayerCreationStarted value),
    @required Result playerCreated(_OnPlayerCreatedEvent value),
    @required Result resetGame(_OnGameReset value),
    @required Result deletePlayer(_OnDeletePlayer value),
    @required Result endGameSooner(_OnEndGameSooner value),
  }) {
    assert(gameCreated != null);
    assert(gameUpdated != null);
    assert(playerCreationStarted != null);
    assert(playerCreated != null);
    assert(resetGame != null);
    assert(deletePlayer != null);
    assert(endGameSooner != null);
    return playerCreated(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result gameCreated(_OnGameCreated value),
    Result gameUpdated(_OnGameUpdated value),
    Result playerCreationStarted(_OnPlayerCreationStarted value),
    Result playerCreated(_OnPlayerCreatedEvent value),
    Result resetGame(_OnGameReset value),
    Result deletePlayer(_OnDeletePlayer value),
    Result endGameSooner(_OnEndGameSooner value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (playerCreated != null) {
      return playerCreated(this);
    }
    return orElse();
  }
}

abstract class _OnPlayerCreatedEvent implements GameEvent {
  factory _OnPlayerCreatedEvent(
      {String playerName,
      String points,
      String bonusPoints}) = _$_OnPlayerCreatedEvent;

  String get playerName;
  String get points;
  String get bonusPoints;
  _$OnPlayerCreatedEventCopyWith<_OnPlayerCreatedEvent> get copyWith;
}

abstract class _$OnGameResetCopyWith<$Res> {
  factory _$OnGameResetCopyWith(
          _OnGameReset value, $Res Function(_OnGameReset) then) =
      __$OnGameResetCopyWithImpl<$Res>;
}

class __$OnGameResetCopyWithImpl<$Res> extends _$GameEventCopyWithImpl<$Res>
    implements _$OnGameResetCopyWith<$Res> {
  __$OnGameResetCopyWithImpl(
      _OnGameReset _value, $Res Function(_OnGameReset) _then)
      : super(_value, (v) => _then(v as _OnGameReset));

  @override
  _OnGameReset get _value => super._value as _OnGameReset;
}

class _$_OnGameReset with DiagnosticableTreeMixin implements _OnGameReset {
  _$_OnGameReset();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'GameEvent.resetGame()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'GameEvent.resetGame'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _OnGameReset);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required
        Result gameCreated(
            String gameTitle, String numberOfPlayers, String pointsToWin),
    @required Result gameUpdated(Game newGame),
    @required
        Result playerCreationStarted(
            String playername, String points, String bonusPoints),
    @required
        Result playerCreated(
            String playerName, String points, String bonusPoints),
    @required Result resetGame(),
    @required Result deletePlayer(Player playerToDelete),
    @required Result endGameSooner(Game currentGame),
  }) {
    assert(gameCreated != null);
    assert(gameUpdated != null);
    assert(playerCreationStarted != null);
    assert(playerCreated != null);
    assert(resetGame != null);
    assert(deletePlayer != null);
    assert(endGameSooner != null);
    return resetGame();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result gameCreated(
        String gameTitle, String numberOfPlayers, String pointsToWin),
    Result gameUpdated(Game newGame),
    Result playerCreationStarted(
        String playername, String points, String bonusPoints),
    Result playerCreated(String playerName, String points, String bonusPoints),
    Result resetGame(),
    Result deletePlayer(Player playerToDelete),
    Result endGameSooner(Game currentGame),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (resetGame != null) {
      return resetGame();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result gameCreated(_OnGameCreated value),
    @required Result gameUpdated(_OnGameUpdated value),
    @required Result playerCreationStarted(_OnPlayerCreationStarted value),
    @required Result playerCreated(_OnPlayerCreatedEvent value),
    @required Result resetGame(_OnGameReset value),
    @required Result deletePlayer(_OnDeletePlayer value),
    @required Result endGameSooner(_OnEndGameSooner value),
  }) {
    assert(gameCreated != null);
    assert(gameUpdated != null);
    assert(playerCreationStarted != null);
    assert(playerCreated != null);
    assert(resetGame != null);
    assert(deletePlayer != null);
    assert(endGameSooner != null);
    return resetGame(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result gameCreated(_OnGameCreated value),
    Result gameUpdated(_OnGameUpdated value),
    Result playerCreationStarted(_OnPlayerCreationStarted value),
    Result playerCreated(_OnPlayerCreatedEvent value),
    Result resetGame(_OnGameReset value),
    Result deletePlayer(_OnDeletePlayer value),
    Result endGameSooner(_OnEndGameSooner value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (resetGame != null) {
      return resetGame(this);
    }
    return orElse();
  }
}

abstract class _OnGameReset implements GameEvent {
  factory _OnGameReset() = _$_OnGameReset;
}

abstract class _$OnDeletePlayerCopyWith<$Res> {
  factory _$OnDeletePlayerCopyWith(
          _OnDeletePlayer value, $Res Function(_OnDeletePlayer) then) =
      __$OnDeletePlayerCopyWithImpl<$Res>;
  $Res call({Player playerToDelete});

  $PlayerCopyWith<$Res> get playerToDelete;
}

class __$OnDeletePlayerCopyWithImpl<$Res> extends _$GameEventCopyWithImpl<$Res>
    implements _$OnDeletePlayerCopyWith<$Res> {
  __$OnDeletePlayerCopyWithImpl(
      _OnDeletePlayer _value, $Res Function(_OnDeletePlayer) _then)
      : super(_value, (v) => _then(v as _OnDeletePlayer));

  @override
  _OnDeletePlayer get _value => super._value as _OnDeletePlayer;

  @override
  $Res call({
    Object playerToDelete = freezed,
  }) {
    return _then(_OnDeletePlayer(
      playerToDelete: playerToDelete == freezed
          ? _value.playerToDelete
          : playerToDelete as Player,
    ));
  }

  @override
  $PlayerCopyWith<$Res> get playerToDelete {
    if (_value.playerToDelete == null) {
      return null;
    }
    return $PlayerCopyWith<$Res>(_value.playerToDelete, (value) {
      return _then(_value.copyWith(playerToDelete: value));
    });
  }
}

class _$_OnDeletePlayer
    with DiagnosticableTreeMixin
    implements _OnDeletePlayer {
  _$_OnDeletePlayer({this.playerToDelete});

  @override
  final Player playerToDelete;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'GameEvent.deletePlayer(playerToDelete: $playerToDelete)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'GameEvent.deletePlayer'))
      ..add(DiagnosticsProperty('playerToDelete', playerToDelete));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _OnDeletePlayer &&
            (identical(other.playerToDelete, playerToDelete) ||
                const DeepCollectionEquality()
                    .equals(other.playerToDelete, playerToDelete)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(playerToDelete);

  @override
  _$OnDeletePlayerCopyWith<_OnDeletePlayer> get copyWith =>
      __$OnDeletePlayerCopyWithImpl<_OnDeletePlayer>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required
        Result gameCreated(
            String gameTitle, String numberOfPlayers, String pointsToWin),
    @required Result gameUpdated(Game newGame),
    @required
        Result playerCreationStarted(
            String playername, String points, String bonusPoints),
    @required
        Result playerCreated(
            String playerName, String points, String bonusPoints),
    @required Result resetGame(),
    @required Result deletePlayer(Player playerToDelete),
    @required Result endGameSooner(Game currentGame),
  }) {
    assert(gameCreated != null);
    assert(gameUpdated != null);
    assert(playerCreationStarted != null);
    assert(playerCreated != null);
    assert(resetGame != null);
    assert(deletePlayer != null);
    assert(endGameSooner != null);
    return deletePlayer(playerToDelete);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result gameCreated(
        String gameTitle, String numberOfPlayers, String pointsToWin),
    Result gameUpdated(Game newGame),
    Result playerCreationStarted(
        String playername, String points, String bonusPoints),
    Result playerCreated(String playerName, String points, String bonusPoints),
    Result resetGame(),
    Result deletePlayer(Player playerToDelete),
    Result endGameSooner(Game currentGame),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (deletePlayer != null) {
      return deletePlayer(playerToDelete);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result gameCreated(_OnGameCreated value),
    @required Result gameUpdated(_OnGameUpdated value),
    @required Result playerCreationStarted(_OnPlayerCreationStarted value),
    @required Result playerCreated(_OnPlayerCreatedEvent value),
    @required Result resetGame(_OnGameReset value),
    @required Result deletePlayer(_OnDeletePlayer value),
    @required Result endGameSooner(_OnEndGameSooner value),
  }) {
    assert(gameCreated != null);
    assert(gameUpdated != null);
    assert(playerCreationStarted != null);
    assert(playerCreated != null);
    assert(resetGame != null);
    assert(deletePlayer != null);
    assert(endGameSooner != null);
    return deletePlayer(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result gameCreated(_OnGameCreated value),
    Result gameUpdated(_OnGameUpdated value),
    Result playerCreationStarted(_OnPlayerCreationStarted value),
    Result playerCreated(_OnPlayerCreatedEvent value),
    Result resetGame(_OnGameReset value),
    Result deletePlayer(_OnDeletePlayer value),
    Result endGameSooner(_OnEndGameSooner value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (deletePlayer != null) {
      return deletePlayer(this);
    }
    return orElse();
  }
}

abstract class _OnDeletePlayer implements GameEvent {
  factory _OnDeletePlayer({Player playerToDelete}) = _$_OnDeletePlayer;

  Player get playerToDelete;
  _$OnDeletePlayerCopyWith<_OnDeletePlayer> get copyWith;
}

abstract class _$OnEndGameSoonerCopyWith<$Res> {
  factory _$OnEndGameSoonerCopyWith(
          _OnEndGameSooner value, $Res Function(_OnEndGameSooner) then) =
      __$OnEndGameSoonerCopyWithImpl<$Res>;
  $Res call({Game currentGame});

  $GameCopyWith<$Res> get currentGame;
}

class __$OnEndGameSoonerCopyWithImpl<$Res> extends _$GameEventCopyWithImpl<$Res>
    implements _$OnEndGameSoonerCopyWith<$Res> {
  __$OnEndGameSoonerCopyWithImpl(
      _OnEndGameSooner _value, $Res Function(_OnEndGameSooner) _then)
      : super(_value, (v) => _then(v as _OnEndGameSooner));

  @override
  _OnEndGameSooner get _value => super._value as _OnEndGameSooner;

  @override
  $Res call({
    Object currentGame = freezed,
  }) {
    return _then(_OnEndGameSooner(
      currentGame:
          currentGame == freezed ? _value.currentGame : currentGame as Game,
    ));
  }

  @override
  $GameCopyWith<$Res> get currentGame {
    if (_value.currentGame == null) {
      return null;
    }
    return $GameCopyWith<$Res>(_value.currentGame, (value) {
      return _then(_value.copyWith(currentGame: value));
    });
  }
}

class _$_OnEndGameSooner
    with DiagnosticableTreeMixin
    implements _OnEndGameSooner {
  _$_OnEndGameSooner({this.currentGame});

  @override
  final Game currentGame;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'GameEvent.endGameSooner(currentGame: $currentGame)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'GameEvent.endGameSooner'))
      ..add(DiagnosticsProperty('currentGame', currentGame));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _OnEndGameSooner &&
            (identical(other.currentGame, currentGame) ||
                const DeepCollectionEquality()
                    .equals(other.currentGame, currentGame)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(currentGame);

  @override
  _$OnEndGameSoonerCopyWith<_OnEndGameSooner> get copyWith =>
      __$OnEndGameSoonerCopyWithImpl<_OnEndGameSooner>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required
        Result gameCreated(
            String gameTitle, String numberOfPlayers, String pointsToWin),
    @required Result gameUpdated(Game newGame),
    @required
        Result playerCreationStarted(
            String playername, String points, String bonusPoints),
    @required
        Result playerCreated(
            String playerName, String points, String bonusPoints),
    @required Result resetGame(),
    @required Result deletePlayer(Player playerToDelete),
    @required Result endGameSooner(Game currentGame),
  }) {
    assert(gameCreated != null);
    assert(gameUpdated != null);
    assert(playerCreationStarted != null);
    assert(playerCreated != null);
    assert(resetGame != null);
    assert(deletePlayer != null);
    assert(endGameSooner != null);
    return endGameSooner(currentGame);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result gameCreated(
        String gameTitle, String numberOfPlayers, String pointsToWin),
    Result gameUpdated(Game newGame),
    Result playerCreationStarted(
        String playername, String points, String bonusPoints),
    Result playerCreated(String playerName, String points, String bonusPoints),
    Result resetGame(),
    Result deletePlayer(Player playerToDelete),
    Result endGameSooner(Game currentGame),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (endGameSooner != null) {
      return endGameSooner(currentGame);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result gameCreated(_OnGameCreated value),
    @required Result gameUpdated(_OnGameUpdated value),
    @required Result playerCreationStarted(_OnPlayerCreationStarted value),
    @required Result playerCreated(_OnPlayerCreatedEvent value),
    @required Result resetGame(_OnGameReset value),
    @required Result deletePlayer(_OnDeletePlayer value),
    @required Result endGameSooner(_OnEndGameSooner value),
  }) {
    assert(gameCreated != null);
    assert(gameUpdated != null);
    assert(playerCreationStarted != null);
    assert(playerCreated != null);
    assert(resetGame != null);
    assert(deletePlayer != null);
    assert(endGameSooner != null);
    return endGameSooner(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result gameCreated(_OnGameCreated value),
    Result gameUpdated(_OnGameUpdated value),
    Result playerCreationStarted(_OnPlayerCreationStarted value),
    Result playerCreated(_OnPlayerCreatedEvent value),
    Result resetGame(_OnGameReset value),
    Result deletePlayer(_OnDeletePlayer value),
    Result endGameSooner(_OnEndGameSooner value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (endGameSooner != null) {
      return endGameSooner(this);
    }
    return orElse();
  }
}

abstract class _OnEndGameSooner implements GameEvent {
  factory _OnEndGameSooner({Game currentGame}) = _$_OnEndGameSooner;

  Game get currentGame;
  _$OnEndGameSoonerCopyWith<_OnEndGameSooner> get copyWith;
}
