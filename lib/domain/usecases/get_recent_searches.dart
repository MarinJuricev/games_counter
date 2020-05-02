import 'package:dartz/dartz.dart';

import '../../core/error/failure.dart';
import '../../core/usecase/base_usecase.dart';
import '../entities/game.dart';

class GetRecentSearches implements BaseUseCase<List<Game>, NoParams> {
  @override
  Future<Either<Failure, List<Game>>> call(NoParams params) {
    return null;
  }
}
