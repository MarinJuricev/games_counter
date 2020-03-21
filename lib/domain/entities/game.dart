import 'package:equatable/equatable.dart';

import 'player.dart';
import 'package:meta/meta.dart';

class Game extends Equatable {
  final List<Player> players;
  final String name;
  final int pointsToWin;
  final int bonusPoints;
  final int numberOfPlayers;
  String winner;

  Game({
    @required this.name,
    @required this.pointsToWin,
    @required this.numberOfPlayers,
    @required this.players,
    this.winner,
    this.bonusPoints,
  });

  Game.clone(Game gameObject)
      : this(
            players: List.from(gameObject.players),
            name: gameObject.name,
            pointsToWin: gameObject.pointsToWin,
            bonusPoints: gameObject.bonusPoints,
            numberOfPlayers: gameObject.numberOfPlayers,
            winner: gameObject.winner);

  @override
  List<Object> get props => [
        players,
        name,
        winner,
        pointsToWin,
        bonusPoints,
        numberOfPlayers,
      ];
}
