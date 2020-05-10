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
