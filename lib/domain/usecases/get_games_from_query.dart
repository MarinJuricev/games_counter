import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:game_counter/core/error/failure.dart';
import 'package:game_counter/data/datasources/local_persistence_provider.dart';
import 'package:game_counter/domain/repositories/game_repository.dart';
import 'package:meta/meta.dart';
import 'package:game_counter/core/usecase/base_usecase.dart';
import 'package:game_counter/domain/entities/game.dart';

class GetGamesFromQuery
    implements BaseUseCase<List<Game>, GetGamesFromQueryParams> {
    final LocalPersistenceProvider localPersistenceProvider;

  GetGamesFromQuery({@required this.localPersistenceProvider});

  @override
  Future<Either<Failure, List<Game>>> call(GetGamesFromQueryParams params) async {
    // Highly un-optimized there's no need to fetch ALL the games if it becomes a issue add
    // some kind of pagination.
    final allGames = localPersistenceProvider.getLatestFromPersistence();
  }
}

class GetGamesFromQueryParams extends Equatable {
  final String query;

  GetGamesFromQueryParams({@required this.query});

  @override
  List<Object> get props => [query];
}
