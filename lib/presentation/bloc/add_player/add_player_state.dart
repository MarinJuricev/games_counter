part of 'add_player_bloc.dart';

abstract class AddPlayerState extends Equatable {
  const AddPlayerState();

  List<Object> get props => [];
}

class AddPlayerInitialState extends AddPlayerState {}

class AddPlayerGameNotCreatedState extends AddPlayerState {}

class AddPlayerCreationStartedState extends AddPlayerState {}

class AddPlayerCreationFinishedState extends AddPlayerState {
  final Game game;

  AddPlayerCreationFinishedState({@required this.game});

  @override
  List<Object> get props => [game];
}

class AddPlayerErrorState extends AddPlayerState {}

class AddPlayerGameCreatedState extends AddPlayerState {
  final Game game;

  AddPlayerGameCreatedState({@required this.game});

  @override
  List<Object> get props => [game];
}
