import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

import '../../domain/entities/game.dart';
import '../../domain/entities/player.dart';
import 'local_player.dart';

part 'local_game.g.dart';

@HiveType(typeId: 1)
class LocalGame extends HiveObject {
  @HiveField(0)
  final List<LocalPlayer> players;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final int pointsToWin;
  @HiveField(3)
  final int bonusPoints;
  @HiveField(4)
  final int numberOfPlayers;
  @HiveField(5)
  final String winner;
  @HiveField(6)
  final String createdAt;

  LocalGame({
    @required this.players,
    @required this.name,
    @required this.pointsToWin,
    @required this.bonusPoints,
    @required this.numberOfPlayers,
    @required this.winner,
    @required this.createdAt,
  });
}

extension GameMapper on Game {
  LocalGame toLocal() {
    List<LocalPlayer> mappedPlayers = [];
    if (this.players.length > 0) {
      mappedPlayers = this.players.map((item) => item.toLocal()).toList();
    }

    return LocalGame(
        players: mappedPlayers,
        name: this.name,
        pointsToWin: this.pointsToWin,
        bonusPoints: this.bonusPoints,
        numberOfPlayers: this.numberOfPlayers,
        winner: this.winner,
        createdAt: this.createdAt);
  }
}

extension LocalGamemapper on LocalGame {
  Game toGame() {
    List<Player> mappedPlayers = [];
    if (this.players.length > 0) {
      mappedPlayers = this.players.map((item) => item.toPlayer()).toList();
    }

    return Game(
        players: mappedPlayers,
        name: this.name,
        pointsToWin: this.pointsToWin,
        bonusPoints: this.bonusPoints,
        numberOfPlayers: this.numberOfPlayers,
        winner: this.winner,
        createdAt: this.createdAt);
  }
}
