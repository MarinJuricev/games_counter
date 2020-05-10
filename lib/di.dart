import 'package:get_it/get_it.dart';

import 'core/util/input_converter.dart';
import 'data/datasources/color_local_data_source.dart';
import 'data/datasources/game_local_data_source.dart';
import 'data/datasources/history_local_data_source.dart';
import 'data/datasources/local_persistence_provider.dart';
import 'data/repositories/color_repository_impl.dart';
import 'data/repositories/game_repository_impl.dart';
import 'data/repositories/history_repository_impl.dart';
import 'domain/repositories/color_repository.dart';
import 'domain/repositories/game_repository.dart';
import 'domain/repositories/history_repository.dart';
import 'domain/usecases/create_game.dart';
import 'domain/usecases/create_player.dart';
import 'domain/usecases/delete_player.dart';
import 'domain/usecases/end_game_sooner.dart';
import 'domain/usecases/get_games_from_query.dart';
import 'domain/usecases/reset_player.dart';
import 'domain/usecases/save_game_into_history.dart';
import 'domain/usecases/update_game.dart';
import 'presentation/bloc/color/bloc/color_bloc.dart';
import 'presentation/bloc/game/game_bloc.dart';
import 'presentation/bloc/player_detail/player_detail_bloc.dart';

// sl for service locator, because of the constant sl invocation
final sl = GetIt.instance;

Future<void> init() async {
  // Bloc
  // TODO this really doesn't need to be a singleton
  sl.registerLazySingleton(() => GameBloc(
        createGame: sl<CreateGame>(),
        createPlayer: sl<CreatePlayer>(),
        deletePlayer: sl<DeletePlayer>(),
        endGameSooner: sl<EndGameSooner>(),
        inputConverter: sl<InputConverter>(),
        saveGameIntoHistory: sl<SaveGameIntoHistory>(),
      ));

  sl.registerFactory(() => PlayerDetailBloc(
        gameRepository: sl<GameRepository>(),
        gameBloc: sl<GameBloc>(),
        updateGame: sl<UpdateGame>(),
        resetPlayer: sl<ResetPlayer>(),
      ));

  sl.registerFactory(() => ColorBloc(colorRepository: sl<ColorRepository>()));

  // Use cases
  sl.registerFactory(() => CreateGame(repository: sl<GameRepository>()));
  sl.registerFactory(() => CreatePlayer(repository: sl<GameRepository>()));
  sl.registerFactory(() => UpdateGame(repository: sl<GameRepository>()));
  sl.registerFactory(() => ResetPlayer(repository: sl<GameRepository>()));
  sl.registerFactory(() => DeletePlayer(repository: sl<GameRepository>()));
  sl.registerFactory(() => EndGameSooner(repository: sl<GameRepository>()));
  sl.registerFactory(() => GetGamesFromQuery(
      localPersistenceProvider: sl<LocalPersistenceProvider>()));
  sl.registerFactory(
      () => SaveGameIntoHistory(repository: sl<HistoryRepository>()));

  // Repository
  sl.registerLazySingleton<GameRepository>(
      () => GameRepositoryImpl(gameLocalDataSource: sl()));

  sl.registerLazySingleton<ColorRepository>(
      () => ColorRepositoryImpl(colorLocalDataSource: sl()));

  sl.registerLazySingleton<HistoryRepository>(
      () => HistoryRepositoryImpl(historyLocalDataSource: sl()));

  // Data source
  sl.registerLazySingleton<GameLocalDataSource>(
      () => GameLocalDataSourceImpl(localPersistenceProvider: sl()));

  sl.registerLazySingleton<ColorLocalDataSource>(
      () => ColorLocalDataSourceImpl(localPersistenceProvider: sl()));

  sl.registerLazySingleton<HistoryLocalDataSource>(
      () => HistoryLocalDataSourceImpl(localPersistenceProvider: sl()));

  // Core
  sl.registerLazySingleton(() => InputConverter());

  // External
  sl.registerLazySingleton<LocalPersistenceProvider>(
      () => LocalPersistenceProviderImpl());
}
