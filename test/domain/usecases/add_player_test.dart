import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:game_counter/core/error/failure.dart';
import 'package:game_counter/domain/usecases/add_player.dart';

void main() {
  AddPlayer addPlayer;

  setUp(
    () {
      addPlayer = AddPlayer();
    },
  );

  group('addPlayer', () {
    test(
      'should return ValidationFailure when the provided playerName is empty',
      () async {
        final emptyPlayerName = '';

        final actualResult =
            await addPlayer(Params(playerName: emptyPlayerName));

        expect(actualResult, Left(ValidationFailure()));
      },
    );
  });
}
