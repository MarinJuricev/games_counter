import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../core/error/failure.dart';
import '../../core/usecase/base_usecase.dart';
import '../entities/game.dart';

class CreateGame implements BaseUseCase<Game, Params> {
  

  @override
  Future<Either<Failure, Game>> call(Params params) async {
    return await _createGame(
        params.gameTitle, params.numberOfPlayers, params.winningPoints);
  }

  Future<Either<Failure, Game>> _createGame(
      String gameTitle, int numberOfPlayers, int winningPoints) async {
    // TODO actually add the local / remote storage for creating a game
    
    return Future<Either<Failure, Game>>.value(
      Right(
        Game(
          name: gameTitle,
          pointsToWin: winningPoints,
          numberOfPlayers: numberOfPlayers,
        ),
      ),
    );
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
