import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:game_counter/domain/entities/player.dart';
import 'package:game_counter/domain/repositories/game_repository.dart';
import 'package:meta/meta.dart';

part 'player_detail_event.dart';
part 'player_detail_state.dart';

class PlayerDetailBloc extends Bloc<PlayerDetailEvent, PlayerDetailState> {
  final GameRepository gameRepository;

  PlayerDetailBloc({@required this.gameRepository});

  @override
  PlayerDetailState get initialState => PlayerDetailInitialState();

  @override
  Stream<PlayerDetailState> mapEventToState(
    PlayerDetailEvent event,
  ) async* {
    if (event is PlayerDetailSaveClickedEvent) {}
  }
}
