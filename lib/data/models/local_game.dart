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
    List<LocalPlayer> mappedPlayers = [];
    if (this.players.length > 0) {
      mappedPlayers = this.players.map(
            (item) => LocalPlayer(
              name: item.name,
              points: item.points,
              bonusPoints: item.bonusPoints,
            ),
          ).toList();
    }

    return LocalGame(
        players: mappedPlayers,
        name: this.name,
        pointsToWin: this.pointsToWin,
        bonusPoints: this.bonusPoints,
        numberOfPlayers: this.numberOfPlayers,
        winner: this.winner);
  }
}

extension LocalGamemapper on LocalGame {
  Game toGame() {
    List<Player> mappedPlayers = [];
    if(this.players.length > 0){
      mappedPlayers = this.players.map(
              (item) => Player(
                name: item.name,
                points: item.points,
                bonusPoints: item.bonusPoints,
              ),
            ).toList();;
    }

    return Game(
        players: mappedPlayers,
        name: this.name,
        pointsToWin: this.pointsToWin,
        bonusPoints: this.bonusPoints,
        numberOfPlayers: this.numberOfPlayers,
        winner: this.winner);
  }
}
