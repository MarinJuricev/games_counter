import 'player.dart';
import 'package:meta/meta.dart';

class Game {
  final List<Player> players;
  final String name;
  final String winner;
  final int pointsToWin;
  final int bonusPoints;

  Game({
    @required this.players,
    @required this.name,
    @required this.winner,
    @required this.pointsToWin,
    @required this.bonusPoints,
  });
}
