import 'dart:ui';

import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:game_counter/domain/entities/app_colors.dart';
import 'package:game_counter/domain/repositories/color_repository.dart';
import 'package:game_counter/presentation/bloc/color/bloc/color_bloc.dart';
import 'package:mockito/mockito.dart';

class MockColorRepository extends Mock implements ColorRepository {}

void main() {
  MockColorRepository mockColorRepository;

  final testAppColor = AppColors(
    backGroundColor: 'ff58C6B2',
    accentColor: 'ff34AB95',
    errorColor: 'ff00FFF0',
    primaryColor: 'ff249681',
  );

  final newColor = Color(0xff0000000);

  final updatedScaffoldColor = AppColors(
    backGroundColor: 'ff0000000',
    accentColor: 'ff34AB95',
    errorColor: 'ff00FFF0',
    primaryColor: 'ff249681',
  );

  setUp(
    () {
      mockColorRepository = MockColorRepository();
    },
  );
  group(
    'onScaffoldColorChange',
    () {
      blocTest(
          'shoud emit [ColorUpdated] with newly added scaffold color when color repository returns appColors',
          build: () async {
            when(mockColorRepository.getColor())
                .thenAnswer((_) async => Right(testAppColor));
            return ColorBloc(colorRepository: mockColorRepository);
          },
          act: (ColorBloc colorBloc) async => colorBloc.add(ColorEvent.onScaffoldColorChange(newScaffoldColor: newColor)),
          expect: [
            ColorUpdated(
                appColors: testAppColor.copyWith(backGroundColor: 'ff0000000'))
          ]);
    },
  );
}
