import 'package:get_it/get_it.dart';

import 'core/util/input_converter.dart';
import 'data/datasources/game_local_data_source.dart';
import 'data/repositories/game_repository_impl.dart';
import 'domain/repositories/game_repository.dart';
import 'domain/usecases/create_game.dart';
import 'domain/usecases/create_player.dart';
import 'presentation/bloc/add_player/add_player_bloc.dart';
import 'presentation/bloc/game/game_bloc.dart';

// sl for service locator, because of the constant sl invocation
final sl = GetIt.instance;

Future<void> init() async {
  // Bloc
  sl.registerLazySingleton(() => GameBloc(
        createGame: sl(),
        inputConverter: sl(),
      ));
  sl.registerFactory(() => AddPlayerBloc(
        createPlayer: sl(),
        inputConverter: sl(),
        gameBloc: sl(),
        gameRepository: sl(),
      ));

  // Use cases
  sl.registerLazySingleton(() => CreateGame(repository: sl()));
  sl.registerLazySingleton(() => CreatePlayer(repository: sl()));

  // Repository
  sl.registerLazySingleton<GameRepository>(
      () => GameRepositoryImpl(gameLocalDataSource: sl()));

  // Data source
  sl.registerLazySingleton<GameLocalDataSource>(
      () => GameLocalDataSourceImpl());

  // Core
  sl.registerLazySingleton(() => InputConverter());
}
