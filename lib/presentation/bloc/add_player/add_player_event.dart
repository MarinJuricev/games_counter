part of 'add_player_bloc.dart';

abstract class AddPlayerEvent extends Equatable {
  const AddPlayerEvent();
}

class InitiatePlayerCreationEvent extends AddPlayerEvent {
  @override
  List<Object> get props => [];
}

class PlayerCreatedEvent extends AddPlayerEvent {
  final String playerName;
  final String points;
  final String bonusPoints;

  PlayerCreatedEvent({
    @required this.playerName,
    @required this.points,
    @required this.bonusPoints,
  });

  @override
  List<Object> get props => [playerName, points, bonusPoints];
}

class AddPlayerGameNotCreatedEvent extends AddPlayerEvent {
  @override
  List<Object> get props => [];
}

class AddPlayerGameCreatedEvent extends AddPlayerEvent {
  final Game game;

  AddPlayerGameCreatedEvent({@required this.game});

  @override
  List<Object> get props => [game];
}
