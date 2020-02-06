import 'package:dartz/dartz.dart';
import 'package:game_counter/core/error/failure.dart';
import 'package:game_counter/domain/entities/game.dart';
import 'package:game_counter/domain/repositories/game_repository.dart';

class GameRepositoryImpl implements GameRepository{
  @override
  Future<Either<Failure, Game>> getGame() {
    return null;
  }

}