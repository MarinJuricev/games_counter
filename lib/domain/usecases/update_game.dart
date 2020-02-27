import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:game_counter/core/error/failure.dart';
import 'package:game_counter/domain/entities/game.dart';
import 'package:game_counter/domain/entities/player.dart';
import 'package:meta/meta.dart';

import '../../core/usecase/base_usecase.dart';
import '../repositories/game_repository.dart';

class UpdateGame implements BaseUseCase<Game, Params> {
  final GameRepository repository;

  UpdateGame({@required this.repository});

  @override
  Future<Either<Failure, Game>> call(Params params) async {
    return await _updateGame(params.currentGame, params.currentPlayer,
        params.newPoints, params.newBonusPoints);
  }
}

Future<Either<Failure, Game>> _updateGame(
  Game currentGame,
  Player currentPlayer,
  int newPoints,
  int newBonusPoints,
) async {
  if (currentGame.players.contains(currentPlayer)) {
    final currentPlayerPosition = currentGame.players.indexOf(currentPlayer);

    final updatedPlayer = Player(
        name: currentPlayer.name,
        points: currentPlayer.points + newPoints,
        bonusPoints: currentPlayer.bonusPoints + newBonusPoints);

    currentGame.players[currentPlayerPosition] = updatedPlayer;

    return await Future<Either<Failure, Game>>.value(Right(currentGame));
  } else {}
}

class Params extends Equatable {
  final Game currentGame;
  final Player currentPlayer;
  final int newPoints;
  final int newBonusPoints;

  Params({
    @required this.currentGame,
    @required this.currentPlayer,
    @required this.newPoints,
    @required this.newBonusPoints,
  });

  @override
  List<Object> get props =>
      [currentGame, currentPlayer, newPoints, newBonusPoints];
}
