part of 'player_detail_bloc.dart';

abstract class PlayerDetailState extends Equatable {
  const PlayerDetailState();

  @override
  List<Object> get props => [];
}

class PlayerDetailInitialState extends PlayerDetailState {}

class PlayerDetailUpdatedState extends PlayerDetailState {
  final Player player;

  PlayerDetailUpdatedState({@required this.player});
}

class PlayerDetailResetState extends PlayerDetailState {}

class PlayerDetailSaveTriggeredState extends PlayerDetailState {}

class PlayerDetailErrorState extends PlayerDetailState {
  final String errorMessage;

  PlayerDetailErrorState({@required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
