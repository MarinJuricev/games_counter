import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:game_counter/core/util/input_converter.dart';
import 'package:game_counter/domain/usecases/create_player.dart';
import 'package:meta/meta.dart';

part 'add_player_event.dart';
part 'add_player_state.dart';

class AddPlayerBloc extends Bloc<AddPlayerEvent, AddPlayerState> {
  final CreatePlayer createPlayer;
  final InputConverter inputConverter;

  AddPlayerBloc({
    this.createPlayer,
    this.inputConverter,
  });

  @override
  AddPlayerState get initialState => AddPlayerInitialState();

  @override
  Stream<AddPlayerState> mapEventToState(
    AddPlayerEvent event,
  ) async* {
    // TODO: Add Logic
  }
}
