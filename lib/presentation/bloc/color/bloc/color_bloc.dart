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

enum ColorField { background, primary, accent, error }

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
      onScaffoldColorChange: (params) => _handleColorChangeEvent(
        params.newScaffoldColor,
        ColorField.background,
      ),
      onErrorColorChange: (params) => _handleColorChangeEvent(
        params.newErrorColor,
        ColorField.error,
      ),
      onPrimaryColorChange: (params) => _handleColorChangeEvent(
        params.newPrimaryColor,
        ColorField.primary,
      ),
      onAccentColorChange: (params) => _handleColorChangeEvent(
        params.newAccentColor,
        ColorField.accent,
      ),
      onGetCurrentAppColors: (_) => _handleOnGetCurrentAppColors(),
    );
  }

  Stream<ColorState> _handleColorChangeEvent(
      Color newColor, ColorField colorField) async* {
    final colorRepoResult = await colorRepository.getColor();
    final colorEither = colorRepoResult.unwrapResult();

    if (colorEither is AppColors) {
      AppColors updatedAppColors;
      switch (colorField) {
        case ColorField.background:
          {
            updatedAppColors =
                colorEither.copyWith(backGroundColor: newColor.toHex());
          }
          break;
        case ColorField.primary:
          {
            updatedAppColors =
                colorEither.copyWith(primaryColor: newColor.toHex());
          }
          break;
        case ColorField.accent:
          {
            updatedAppColors =
                colorEither.copyWith(accentColor: newColor.toHex());
          }
          break;
        case ColorField.error:
          {
            updatedAppColors =
                colorEither.copyWith(errorColor: newColor.toHex());
          }
          break;
      }

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
}
