part of 'add_player_bloc.dart';

abstract class AddPlayerEvent extends Equatable {
  const AddPlayerEvent();
}

class InitiatePlayerCreationEvent extends AddPlayerEvent{
  @override
  List<Object> get props => [];
}

class CreatePlayerEvent extends AddPlayerEvent {
  final String playerName;
  final String points;
  final String bonusPoints;

  CreatePlayerEvent({
    @required this.playerName,
    @required this.points,
    @required this.bonusPoints,
  });

  @override
  List<Object> get props => [playerName, points, bonusPoints];
}
