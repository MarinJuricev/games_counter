import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';

import '../../../../core/extensions/extensions.dart';
import '../../../../domain/entities/app_colors.dart';
import '../../../../domain/repositories/color_repository.dart';

part 'color_bloc.freezed.dart';
part 'color_event.dart';
part 'color_state.dart';

class ColorBloc extends Bloc<ColorEvent, ColorState> {
  final ColorRepository colorRepository;
  ColorBloc({@required this.colorRepository});

  @override
  ColorState get initialState => ColorInitial();

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
      onGetCurrentAppColors: (_) => _handleOnGetCurrentAppColors(),
    );
  }

  Stream<ColorState> _handleOnScaffoldChangeEvent(
      Color newScaffoldColor) async* {
    final colorRepoResult = await colorRepository.getColor();
    final colorEither = colorRepoResult.unwrapResult();

    if (colorEither is AppColors) {
      final updatedAppColors =
          colorEither.copyWith(backGroundColor: newScaffoldColor.toHex());

      await colorRepository.updateAppColors(updatedAppColors);

      yield ColorUpdated(appColors: updatedAppColors);
    }
  }

  Stream<ColorState> _handleOnGetCurrentAppColors() async* {
    final colorRepoResult = await colorRepository.getColor();
    final colorEither = colorRepoResult.unwrapResult();

    if (colorEither is AppColors) {
      yield ColorUpdated(appColors: colorEither);
    }
  }

  Stream<ColorState> _test() async* {
    yield null;
  }
}
