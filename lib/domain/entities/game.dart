import 'package:equatable/equatable.dart';

import 'player.dart';
import 'package:meta/meta.dart';

class Game extends Equatable {
  final List<Player> players;
  final String name;
  final String winner;
  final int pointsToWin;
  final int bonusPoints;
  final int numberOfPlayers;

  Game({
    @required this.name,
    @required this.pointsToWin,
    @required this.numberOfPlayers,
    @required this.players,
    this.winner,
    this.bonusPoints,
  });

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
