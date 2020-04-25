import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:game_counter/domain/repositories/color_repository.dart';
import 'package:meta/meta.dart';

part 'color_event.dart';
part 'color_state.dart';
part 'color_bloc.freezed.dart';

class ColorBloc extends Bloc<ColorEvent, ColorState> {
  final ColorRepository colorRepository;

  ColorBloc({@required this.colorRepository});

  @override
  ColorState get initialState => ColorInitial(
        backGroundColor: Color(0xff58C6B2),
        accentColor: Color(0xff34AB95),
        errorColor: Color(0xff00FFF0),
        primaryColor: Color(0xff249681),
      );

  @override
  Stream<ColorState> mapEventToState(
    ColorEvent event,
  ) async* {
    yield* event.map(
      onScaffoldColorChange: (params) =>
          _handleOnScaffoldChangeEvent(params.newScaffoldColor),
      onErrorColorChange: (params) => _test(),
      onPrimaryColorChange: (params) => _test(),
      onAccentColorChange: (params) => _test(),
    );
  }

  Stream<ColorState> _handleOnScaffoldChangeEvent(
      Color newScaffoldColor) async* {
    yield ColorInitial(
      backGroundColor: newScaffoldColor,
      accentColor: Color(0xff34AB95),
      errorColor: Color(0xff00FFF0),
      primaryColor: Color(0xff249681),
    );
  }

  Stream<ColorState> _test() async* {
    yield ColorInitial(
      backGroundColor: Color(0xff58C6B2),
      accentColor: Color(0xff34AB95),
      errorColor: Color(0xff00FFF0),
      primaryColor: Color(0xff249681),
    );
  }
}
