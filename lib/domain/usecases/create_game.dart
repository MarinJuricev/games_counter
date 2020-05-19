import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

import '../../core/error/failure.dart';
import '../../core/usecase/base_usecase.dart';
import '../entities/game.dart';
import '../repositories/game_repository.dart';

class CreateGame implements BaseUseCase<Game, CreateGameParams> {
  final GameRepository repository;

  CreateGame({@required this.repository});

  @override
  Future<Either<Failure, Game>> call(CreateGameParams params) async {
    final gameTitle = params.gameTitle;
    final winningPoints = params.winningPoints;
    final numberOfPlayers = params.numberOfPlayers;

    //TODO WRAP THIS
    final now = new DateTime.now();
    String formattedDateTime = DateFormat('yMd').format(now);

    final game = Game(
        name: gameTitle,
        pointsToWin: winningPoints,
        numberOfPlayers: numberOfPlayers,
        bonusPoints: 0,
        winner: '',
        createdAt: formattedDateTime,
        players: []);

    await repository.saveGame(game);
    return await repository.getGame();
  }
}

class CreateGameParams extends Equatable {
  final String gameTitle;
  final int numberOfPlayers;
  final int winningPoints;

  CreateGameParams({
    @required this.gameTitle,
    @required this.numberOfPlayers,
    @required this.winningPoints,
  });

  @override
  List<Object> get props => [gameTitle, numberOfPlayers, winningPoints];
}
