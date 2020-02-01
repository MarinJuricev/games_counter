part of 'add_player_bloc.dart';

abstract class AddPlayerState extends Equatable {
  const AddPlayerState();

  @override
  List<Object> get props => [];
}

class InitialState extends AddPlayerState {}

class GameNotCreatedState extends AddPlayerState {}

class PlayerCreationStartedState extends AddPlayerState {}

class CreationFinishedState extends AddPlayerState {
  final Player player;

  CreationFinishedState({@required this.player});

  @override
  List<Object> get props => [player];
}

class ErrorState extends AddPlayerState {}
