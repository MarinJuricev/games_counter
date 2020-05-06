import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../core/error/failure.dart';
import '../../core/usecase/base_usecase.dart';
import '../entities/game.dart';
import '../repositories/history_repository.dart';

class SaveGameIntoHistory
    implements BaseUseCase<void, SaveGameIntoHistoryParams> {
  final HistoryRepository repository;

  SaveGameIntoHistory({@required this.repository});

  @override
  Future<Either<Failure, void>> call(SaveGameIntoHistoryParams params) async {
    return await repository.saveGameIntoHistory(params.gameToSave);
  }
}

class SaveGameIntoHistoryParams extends Equatable {
  final Game gameToSave;

  SaveGameIntoHistoryParams({@required this.gameToSave});

  @override
  List<Object> get props => [gameToSave];
}
