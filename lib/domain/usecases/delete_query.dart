import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:game_counter/core/error/failure.dart';

import '../../core/usecase/base_usecase.dart';
import '../repositories/history_repository.dart';

class DeleteQuery implements BaseUseCase<void, int> {
  final HistoryRepository repository;

  DeleteQuery({@required this.repository});

  @override
  Future<Either<Failure, void>> call(int params) async {
    return await repository.deleteQuery(params);
  }
}
