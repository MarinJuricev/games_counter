import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'player.freezed.dart';

@freezed
abstract class Player with _$Player {
  factory Player({
    @required String name,
    @required int points,
    @required int bonusPoints,
  }) = _Player;
}
