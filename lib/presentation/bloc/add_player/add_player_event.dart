part of 'add_player_bloc.dart';

abstract class AddPlayerEvent extends Equatable {
  const AddPlayerEvent();

  @override
  List<Object> get props => [];
}

class InitiatePlayerCreationEvent extends AddPlayerEvent {
  
}

class PlayerCreated extends AddPlayerEvent {
  final String playerName;
  final String points;
  final String bonusPoints;

  PlayerCreated({
    @required this.playerName,
    @required this.points,
    @required this.bonusPoints,
  });

  @override
  List<Object> get props => [playerName, points, bonusPoints];
}

class AddPlayerGameNotCreatedEvent extends AddPlayerEvent {}

class AddPlayerGameCreatedEvent extends AddPlayerEvent {
  final Game game;

  AddPlayerGameCreatedEvent({@required this.game});

  @override
  List<Object> get props => [game];
}
