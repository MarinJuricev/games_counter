import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../core/constants/budget_constants.dart';
import '../../core/error/failure.dart';
import '../../core/usecase/base_usecase.dart';
import '../entities/game.dart';
import '../entities/player.dart';
import '../repositories/game_repository.dart';
import '../../core/extensions/extensions.dart';

class CreatePlayer implements BaseUseCase<Game, CreatePlayerParams> {
  final GameRepository repository;

  CreatePlayer({@required this.repository});

  @override
  Future<Either<Failure, Game>> call(CreatePlayerParams params) async {
    final newPlayer = Player(
      name: params.playerName,
      points: params.points,
      bonusPoints: params.bonusPoints,
    );
    final currentGameEither = await repository.getGame();
    final currentGameResult = currentGameEither.unwrapResult();

    if (currentGameResult is Game) {
      if (checkIfPlayerWithThatNameAlreadyExists(
        newPlayer,
        currentGameResult.players,
      )) {
        return await Future<Either<Failure, Game>>.value(
            Left(PlayerAlreadyExistsFailure(PLAYER_ALREADY_EXISTS)));
      }

      if (pointsExceedPointsToWin(newPlayer, currentGameResult.pointsToWin)) {
        return await Future<Either<Failure, Game>>.value(
            Left(PointsToHighFailure(POINTS_TO_HIGH)));
      }

      if (newPlayersExceedsGamesMaximumAllowedPlayerCount(
        currentGameResult.numberOfPlayers,
        currentGameResult.players.length,
      )) {
        return await Future<Either<Failure, Game>>.value(
            Left(CantAddMorePlayersFailure(CANT_ADD_MORE_PLAYERS)));
      }

      currentGameResult.players.add(newPlayer);
      await repository.saveGame(currentGameResult);
      return await Future<Either<Failure, Game>>.value(
          Right(currentGameResult));
    } else {
      return await Future<Either<Failure, Game>>.value(
          Left(CacheFailure((ERROR_RETREVING_LOCAL_DATA))));
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
    return ((newPlayer.points + newPlayer.bonusPoints) >= pointsToWin ||
        newPlayer.points >= pointsToWin ||
        newPlayer.bonusPoints >= pointsToWin);
  }

  bool checkIfPlayerWithThatNameAlreadyExists(
    Player newPlayer,
    List<Player> players,
  ) {
    final playerAlreadyExists = players.firstWhere(
        (itemToCheck) => itemToCheck.name == newPlayer.name,
        orElse: () => null);

    return (playerAlreadyExists != null);
  }
}

class CreatePlayerParams extends Equatable {
  final String playerName;
  final int points;
  final int bonusPoints;

  CreatePlayerParams({
    @required this.playerName,
    @required this.points,
    @required this.bonusPoints,
  });

  @override
  List<Object> get props => [
        playerName,
        points,
        bonusPoints,
      ];
}
