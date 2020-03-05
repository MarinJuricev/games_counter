part of 'game_bloc.dart';

abstract class GameState extends Equatable {
  const GameState();

  @override
  List<Object> get props => [];
}

class GameInitialState extends GameState {}

class GameCreatedState extends GameState {
  final Game game;

  GameCreatedState({@required this.game});

  @override
  List<Object> get props => [game];
}

class GameUpdatedState extends GameState {
  final Game game;

  GameUpdatedState({@required this.game});

  @override
  List<Object> get props => [game];
}

class GameErrorState extends GameState {
  final String errorMessage;

  GameErrorState({@required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}

class GamePlayerCreationState extends GameState {}
