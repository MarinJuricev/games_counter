import 'package:get_it/get_it.dart';

import 'core/util/input_converter.dart';
import 'domain/usecases/create_game.dart';
import 'domain/usecases/create_player.dart';
import 'presentation/bloc/add_player/add_player_bloc.dart';
import 'presentation/bloc/game/game_bloc.dart';

// sl for service locator, because of the constant sl invocation
final sl = GetIt.instance;

Future<void> init() async {
  // Bloc
  sl.registerLazySingleton(() => GameBloc(createGame: sl(), inputConverter: sl()));
  sl.registerFactory(() =>
      AddPlayerBloc(createPlayer: sl(), inputConverter: sl(), gameBloc: sl()));

  // Use cases
  sl.registerLazySingleton(() => CreateGame());
  sl.registerLazySingleton(() => CreatePlayer());

  // Core
  sl.registerLazySingleton(() => InputConverter());
}
