import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'player.dart';

part 'game.freezed.dart';

@freezed
abstract class Game with _$Game {
  factory Game({
    @required List<Player> players,
    @required String name,
    @required int pointsToWin,
    @required int numberOfPlayers,
    @required String winner,
    @required String createdAt,
  }) = _Game;
}
