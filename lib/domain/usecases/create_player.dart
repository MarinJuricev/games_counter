import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:game_counter/domain/repositories/game_repository.dart';
import 'package:meta/meta.dart';

import '../../core/error/failure.dart';
import '../../core/usecase/base_usecase.dart';
import '../entities/game.dart';
import '../entities/player.dart';

class CreatePlayer implements BaseUseCase<Game, Params> {
  final GameRepository repository;

  CreatePlayer({@required this.repository});

  @override
  Future<Either<Failure, Game>> call(Params params) async {
    final newPlayer = Player(
      name: params.playerName,
      points: params.points,
      bonusPoints: params.bonusPoints,
    );
    final currentGame = params.currentGame;

    if (checkIfPlayerWithThatNameAlreadyExists(
      newPlayer,
      currentGame.players,
    )) {
      return await Future<Either<Failure, Game>>.value(
          Left(PlayerAlreadyExistsFailure()));
    }

    if (pointsExceedPointsToWin(newPlayer, currentGame.pointsToWin)) {
      return await Future<Either<Failure, Game>>.value(
          Left(PointsToHighFailure()));
    }

    if (newPlayersExceedsGamesMaximumAllowedPlayerCount(
      currentGame.numberOfPlayers,
      currentGame.players.length,
    )) {
      return await Future<Either<Failure, Game>>.value(
          Left(CantAddMorePlayersFailure()));
    }

    currentGame.players.add(newPlayer);
    await repository.saveGame(currentGame);
    return await Future<Either<Failure, Game>>.value(Right(currentGame));
  }
}

bool newPlayersExceedsGamesMaximumAllowedPlayerCount(
  int numberOfAllowedPlayers,
  int currentNumberOfPlayers,
) {
  return currentNumberOfPlayers + 1 > numberOfAllowedPlayers;
}

bool pointsExceedPointsToWin(
  Player newPlayer,
  int pointsToWin,
) {
  if ((newPlayer.points + newPlayer.bonusPoints) >= pointsToWin ||
      newPlayer.points >= pointsToWin ||
      newPlayer.bonusPoints >= pointsToWin) {
    return true;
  } else {
    return false;
  }
}

bool checkIfPlayerWithThatNameAlreadyExists(
  Player newPlayer,
  List<Player> players,
) {
  final playerAlreadyExists = players.firstWhere(
      (itemToCheck) => itemToCheck.name == newPlayer.name,
      orElse: () => null);

  if (playerAlreadyExists != null) {
    return true;
  } else {
    return false;
  }
}

class Params extends Equatable {
  final String playerName;
  final int points;
  final int bonusPoints;
  final Game currentGame;

  Params({
    @required this.playerName,
    @required this.points,
    @required this.bonusPoints,
    @required this.currentGame,
  });

  @override
  List<Object> get props => [
        playerName,
        points,
        bonusPoints,
        currentGame,
      ];
}
