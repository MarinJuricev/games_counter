import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../core/constants/budget_constants.dart';
import '../../core/error/failure.dart';
import '../../core/usecase/base_usecase.dart';
import '../entities/game.dart';
import '../repositories/game_repository.dart';
import '../service/time_provider.dart';

class CreateGame implements BaseUseCase<Game, CreateGameParams> {
  final GameRepository repository;
  final TimeProvider timeProvider;

  CreateGame({@required this.repository, @required this.timeProvider});

  @override
  Future<Either<Failure, Game>> call(CreateGameParams params) async {
    final gameTitle = params.gameTitle;
    final winningPoints = params.winningPoints;
    final numberOfPlayers = params.numberOfPlayers;

    final game = Game(
        name: gameTitle,
        pointsToWin: winningPoints,
        numberOfPlayers: numberOfPlayers,
        bonusPoints: 0,
        winner: '',
        createdAt: timeProvider.provideCurrentTime(GAME_TIME_FORMAT),
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
