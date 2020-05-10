import 'package:game_counter/domain/entities/player.dart';
import 'package:hive/hive.dart';

part 'local_player.g.dart';

@HiveType(typeId: 2)
class LocalPlayer extends HiveObject {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final int points;
  @HiveField(2)
  final int bonusPoints;

  LocalPlayer({
    this.name,
    this.points,
    this.bonusPoints,
  });
}

extension PlayerMapper on Player {
  LocalPlayer toLocal() {
    return LocalPlayer(
      name: name,
      points: points,
      bonusPoints: bonusPoints,
    );
  }
}

extension LocalGamemapper on LocalPlayer {
  Player toPlayer() {
    return Player(
      name: name,
      points: points,
      bonusPoints: bonusPoints,
    );
  }
}
