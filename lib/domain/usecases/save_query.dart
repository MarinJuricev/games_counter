import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

import '../../core/error/failure.dart';
import '../../core/usecase/base_usecase.dart';
import '../repositories/history_repository.dart';

class SaveQuery implements BaseUseCase<void, String> {
  final HistoryRepository repository;

  SaveQuery({@required this.repository});

  @override
  Future<Either<Failure, void>> call(String params) async{
    return await repository.saveQuery(params);
  }
}
