import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../core/error/failure.dart';
import '../../core/usecase/base_usecase.dart';
import '../entities/game.dart';
import '../repositories/history_repository.dart';

class GetGamesFromQuery
    implements BaseUseCase<List<Game>, GetGamesFromQueryParams> {
  final HistoryRepository historyRepository;

  GetGamesFromQuery({@required this.historyRepository});

  @override
  Future<Either<Failure, List<Game>>> call(
      GetGamesFromQueryParams params) async {
    return await historyRepository.getMatchesByQuery(params.query);
  }
}

class GetGamesFromQueryParams extends Equatable {
  final String query;

  GetGamesFromQueryParams({@required this.query});

  @override
  List<Object> get props => [query];
}
