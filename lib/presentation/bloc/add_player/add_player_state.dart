part of 'add_player_bloc.dart';

abstract class AddPlayerState extends Equatable {
  const AddPlayerState();

  @override
  List<Object> get props => [];
}

class AddPlayerInitialState extends AddPlayerState {}

class AddPlayerGameNotCreateState extends AddPlayerState {}

class AddPlayerFabClicked extends AddPlayerState {}

class AddPlayerErrorState extends AddPlayerState {}
