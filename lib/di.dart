import 'package:game_counter/domain/usecases/delete_player.dart';
import 'package:game_counter/domain/usecases/reset_player.dart';
import 'package:get_it/get_it.dart';

import 'core/util/input_converter.dart';
import 'data/datasources/game_local_data_source.dart';
import 'data/repositories/game_repository_impl.dart';
import 'domain/repositories/game_repository.dart';
import 'domain/usecases/create_game.dart';
import 'domain/usecases/create_player.dart';
import 'domain/usecases/update_game.dart';
import 'presentation/bloc/game/game_bloc.dart';
import 'presentation/bloc/player_detail/player_detail_bloc.dart';

// sl for service locator, because of the constant sl invocation
final sl = GetIt.instance;

Future<void> init() async {
  // Bloc
  sl.registerLazySingleton(() => GameBloc(
        createGame: sl<CreateGame>(),
        createPlayer: sl<CreatePlayer>(),
        deletePlayer: sl<DeletePlayer>(),
        inputConverter: sl<InputConverter>(),
        gameRepository: sl<GameRepository>(),
      ));

  sl.registerFactory(() => PlayerDetailBloc(
        gameRepository: sl<GameRepository>(),
        gameBloc: sl<GameBloc>(),
        updateGame: sl<UpdateGame>(),
        resetPlayer: sl<ResetPlayer>(),
      ));

  // Use cases
  sl.registerFactory(() => CreateGame(
        repository: sl<GameRepository>(),
      ));
  sl.registerFactory(
      () => CreatePlayer(repository: sl<GameRepository>()));

  sl.registerFactory(() => UpdateGame(repository: sl<GameRepository>()));
  sl.registerFactory(() => ResetPlayer(repository: sl<GameRepository>()));
  sl.registerFactory(() => DeletePlayer(repository: sl<GameRepository>()));

  // Repository
  sl.registerLazySingleton<GameRepository>(
      () => GameRepositoryImpl(gameLocalDataSource: sl()));

  // Data source
  sl.registerLazySingleton<GameLocalDataSource>(
      () => GameLocalDataSourceImpl());

  // Core
  sl.registerLazySingleton(() => InputConverter());
}
