import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'player.freezed.dart';

@freezed
// Implements beacuse we want to provide a custom method
// Please reference:
// https://pub.dev/packages/freezed#custom-getters-and-methods
abstract class Player implements _$Player {
  Player._();
  factory Player({
    @required String name,
    @required int points,
    @required int bonusPoints,
  }) = _Player;

  int get sumOfAllPoints {
    return points + bonusPoints;
  }
}
