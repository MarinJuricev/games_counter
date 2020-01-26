// sl for service locator, because of the constant sl invocation
import 'package:game_counter/domain/usecases/create_game.dart';
import 'package:game_counter/presentation/bloc/game/bloc/game_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Bloc
  sl.registerFactory(() => GameBloc(createGame: sl()));

  // Use cases
  sl.registerLazySingleton(() => CreateGame());
}
