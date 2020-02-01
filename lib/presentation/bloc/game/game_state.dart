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

class ErrorState extends GameState {
  final String message;

  ErrorState({@required this.message});

  @override
  List<Object> get props => [message];
}
