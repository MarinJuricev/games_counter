// sl for service locator, because of the constant sl invocation
import 'package:game_counter/domain/usecases/create_game.dart';
import 'package:get_it/get_it.dart';

import 'core/util/input_converter.dart';
import 'presentation/bloc/game/game_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Bloc
  sl.registerFactory(() => GameBloc(createGame: sl(), inputConverter: sl()));

  // Use cases
  sl.registerLazySingleton(() => CreateGame());

  // Core
  sl.registerLazySingleton(() => InputConverter());
}
