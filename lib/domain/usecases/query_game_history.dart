import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:game_counter/core/error/failure.dart';
import 'package:meta/meta.dart';
import 'package:game_counter/core/usecase/base_usecase.dart';
import 'package:game_counter/domain/entities/game.dart';

class QueryGameHistory implements BaseUseCase<List<Game>, QueryGameHistoryParams> {
  @override
  Future<Either<Failure, List<Game>>> call(QueryGameHistoryParams params) {
    
  }

} 

class QueryGameHistoryParams extends Equatable{
  final String query;

  QueryGameHistoryParams({@required this.query});

  @override
  List<Object> get props => [query];
}