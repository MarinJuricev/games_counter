part of 'player_detail_bloc.dart';

abstract class PlayerDetailEvent extends Equatable {
  const PlayerDetailEvent();

  @override
  List<Object> get props => [];
}

class PlayerDetailSaveClickedEvent extends PlayerDetailEvent {
  final int newMainPoints;
  final int newBonusPoints;
  final Player currentPlayer;

  PlayerDetailSaveClickedEvent({
    @required this.newMainPoints,
    @required this.newBonusPoints,
    @required this.currentPlayer,
  });

  @override
  List<Object> get props => [newMainPoints, newBonusPoints, currentPlayer];
}

class PlayerDetailResetClickedEvent extends PlayerDetailEvent {}
