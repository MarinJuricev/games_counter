import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:game_counter/domain/entities/game.dart';
import 'package:flutter/foundation.dart';
import 'package:game_counter/domain/entities/player.dart';

part 'history_item.freezed.dart';

@freezed
abstract class HistoryItem with _$HistoryItem {
  factory HistoryItem({
    @required bool isExpanded,
    @required String createdAt,
    @required String gameTitle,
    @required String gameWinner,
    @required List<Player> playersSortedByPoints,
  }) = _HistoryItem;
}

extension HistoryMapper on Game {
  HistoryItem toHistoryItem() {
    this.players.sort(
          (first, second) =>
              first.sumOfAllPoints.compareTo(second.sumOfAllPoints),
        );

    return HistoryItem(
      isExpanded: false,
      createdAt: this.createdAt,
      gameTitle: this.name,
      playersSortedByPoints: this.players,
      gameWinner: this.winner,
    );
  }
}
