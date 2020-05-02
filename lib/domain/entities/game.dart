import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'player.dart';

part 'game.freezed.dart';

@freezed
abstract class Game with _$Game {
  factory Game({
    List<Player> players,
    String name,
    int pointsToWin,
    int bonusPoints,
    int numberOfPlayers,
    String winner,
  }) = _Game;
}
