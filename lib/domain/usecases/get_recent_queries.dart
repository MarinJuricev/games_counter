import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

import '../../core/error/failure.dart';
import '../../core/usecase/base_usecase.dart';
import '../repositories/history_repository.dart';

class GetRecentQueries implements BaseUseCase<List<String>, NoParams>{
  final HistoryRepository historyRepository;

  GetRecentQueries({@required this.historyRepository});

  @override
  Future<Either<Failure, List<String>>> call(NoParams params) async{
    return await historyRepository.getRecentQueries();
  }

}