import 'package:dartz/dartz.dart';

import '../../core/error/failure.dart';
import '../entities/game.dart';

abstract class GameRepository {
  Future<Either<Failure, Game>> getGame();
}