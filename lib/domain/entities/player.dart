
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Player extends Equatable {
  final String name;
  final int points;
  final int bonusPoints;

  Player({
    @required this.name,
    @required this.points,
    @required this.bonusPoints,
  });

  int get sumOfAllPoints {
    return points + bonusPoints;
  }

  @override
  List<Object> get props => [name, points, bonusPoints];
}