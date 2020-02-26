import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../core/error/failure.dart';
import '../../../core/extensions/functional.dart';
import '../../../domain/entities/game.dart';
import '../../../domain/entities/player.dart';
import '../../../domain/repositories/game_repository.dart';
import '../game/game_bloc.dart';

part 'player_detail_event.dart';
part 'player_detail_state.dart';

class PlayerDetailBloc extends Bloc<PlayerDetailEvent, PlayerDetailState> {
  final GameRepository gameRepository;
  final GameBloc gameBloc;

  PlayerDetailBloc({
    @required this.gameRepository,
    @required this.gameBloc,
  });

  @override
  PlayerDetailState get initialState => PlayerDetailInitialState();

  @override
  Stream<PlayerDetailState> mapEventToState(
    PlayerDetailEvent event,
  ) async* {
    if (event is PlayerDetailSaveClickedEvent) {
      final newPoints = event.newBonusPoints;
      final newBonusPoints = event.newBonusPoints;
      final currentPlayer = event.currentPlayer;

      final gameEither = await gameRepository.getGame();
      final gameRepoResult = gameEither.unwrapResult();

      if (gameRepoResult is Failure)
        yield PlayerDetailErrorState(errorMessage: gameRepoResult.message);
      else if (gameRepoResult is Game) {
        
      }
    }
  }
}
