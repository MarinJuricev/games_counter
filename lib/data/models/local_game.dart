import 'package:hive/hive.dart';

import '../../domain/entities/game.dart';
import '../../domain/entities/player.dart';

part 'local_game.g.dart';

@HiveType(typeId: 1)
class LocalGame extends HiveObject {
  @HiveField(0)
  final List<Player> players;
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

  LocalGame({
    this.players,
    this.name,
    this.pointsToWin,
    this.bonusPoints,
    this.numberOfPlayers,
    this.winner,
  });
}

extension GameMapper on Game {
  LocalGame toLocal() {
    return LocalGame(
        players: this.players,
        name: this.name,
        pointsToWin: this.pointsToWin,
        bonusPoints: this.bonusPoints,
        numberOfPlayers: this.numberOfPlayers,
        winner: this.winner);
  }
}

extension LocalGamemapper on LocalGame {
  Game toGame() {
    return Game(
        players: this.players,
        name: this.name,
        pointsToWin: this.pointsToWin,
        bonusPoints: this.bonusPoints,
        numberOfPlayers: this.numberOfPlayers,
        winner: this.winner);
  }
}
