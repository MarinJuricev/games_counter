part of 'add_player_bloc.dart';

abstract class AddPlayerState extends Equatable {
  const AddPlayerState();

  @override
  List<Object> get props => [];
}

class AddPlayerInitialState extends AddPlayerState {}

class AddPlayerGameNotCreatedState extends AddPlayerState {}

class AddPlayerCreationStartedState extends AddPlayerState {}

class AddPlayerCreationFinishedState extends AddPlayerState {
  final Player player;

  AddPlayerCreationFinishedState({@required this.player});

  @override
  List<Object> get props => [player];
}

class AddPlayerErrorState extends AddPlayerState {}
