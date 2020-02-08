import 'package:dartz/dartz.dart';

import '../../core/error/failure.dart';
import '../entities/game.dart';

abstract class GameRepository {
  Future<Either<Failure, Game>> getGame();
  Future<Either<Failure, void>> saveGame(Game game);
}