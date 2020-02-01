import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../core/error/failure.dart';
import '../../core/usecase/base_usecase.dart';
import '../entities/game.dart';
import '../entities/player.dart';

class AddPlayer implements BaseUseCase<Game, Params> {
  @override
  Future<Either<Failure, Game>> call(Params params) async {
    final currentGame = params.currentGame;
    final newPlayer = params.newPlayer;

    final playerAlreadyExists = currentGame.players.firstWhere(
        (itemToCheck) => itemToCheck.name == newPlayer.name,
        orElse: () => null);

    if (playerAlreadyExists != null) { 
      return await Future<Either<Failure, Game>>.value(
          Left(PlayerAlreadyExistsFailure()));
    }

    currentGame.players.add(newPlayer);
    return await Future<Either<Failure, Game>>.value(Right(currentGame));
  }
}

class Params extends Equatable {
  final Game currentGame;
  final Player newPlayer;

  Params({@required this.currentGame, @required this.newPlayer});

  @override
  List<Object> get props => [currentGame, newPlayer];
}
