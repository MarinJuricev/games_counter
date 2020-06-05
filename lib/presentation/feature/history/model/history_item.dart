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
    @required String highlightedGameTitle,
    @required String nonHighlightedGameTitle,
    @required List<Player> playersSortedByPoints,
  }) = _HistoryItem;
}

extension HistoryMapper on Game {
  HistoryItem toHistoryItem(String query) {
    this.players.sort(
          (first, second) =>
              second.sumOfAllPoints.compareTo(first.sumOfAllPoints),
        );

    final firstPosition = this.name.toLowerCase().indexOf(query.toLowerCase());
    final lastPosition =
        this.name.toLowerCase().lastIndexOf(query.toLowerCase());

    var highlightText = '';
    var nonHighlightText = '';

    // In case where the whole string matches
    // EX Game name Mau, and you enter Mau as a query
    if (firstPosition != -1 && lastPosition == 0)
      highlightText = this.name;
    else if (firstPosition != -1 && lastPosition != -1) {
      highlightText = this.name.substring(firstPosition, lastPosition);
      nonHighlightText = this.name.substring(lastPosition, this.name.length);
    }

    return HistoryItem(
      isExpanded: false,
      createdAt: this.createdAt,
      gameTitle: this.name,
      highlightedGameTitle: highlightText,
      nonHighlightedGameTitle: nonHighlightText,
      playersSortedByPoints: this.players,
      gameWinner: this.winner,
    );
  }
}
