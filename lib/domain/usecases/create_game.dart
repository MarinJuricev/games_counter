import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../core/error/failure.dart';
import '../../core/usecase/base_usecase.dart';
import '../entities/game.dart';
import '../repositories/game_repository.dart';

class CreateGame implements BaseUseCase<Game, Params> {
  final GameRepository repository;

  CreateGame({@required this.repository});

  @override
  Future<Either<Failure, Game>> call(Params params) async {
    final gameTitle = params.gameTitle;
    final winningPoints = params.winningPoints;
    final numberOfPlayers = params.numberOfPlayers;

    final game = Game(
        name: gameTitle,
        pointsToWin: winningPoints,
        numberOfPlayers: numberOfPlayers,
        players: []);

    await repository.saveGame(game);
    return await repository.getGame();
  }
}

class Params extends Equatable {
  final String gameTitle;
  final int numberOfPlayers;
  final int winningPoints;

  Params({
    @required this.gameTitle,
    @required this.numberOfPlayers,
    @required this.winningPoints,
  });

  @override
  List<Object> get props => [gameTitle, numberOfPlayers, winningPoints];
}
