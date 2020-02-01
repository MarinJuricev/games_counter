import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:game_counter/domain/entities/player.dart';
import 'package:game_counter/domain/usecases/create_player.dart';

void main() {
  CreatePlayer createPlayer;

  setUp(
    () {
      createPlayer = CreatePlayer();
    },
  );

  group('createPlayer', () {
    test('should return a valid player instance with valid parametars',
        () async {
      final validPlayerName = 'validName';
      final validPoints = 0;
      final validBonusPoints = 0;

      final actualResult = await createPlayer(Params(
        playerName: validPlayerName,
        points: validPoints,
        bonusPoints: validBonusPoints,
      ));

      final expectedResult = Right(Player(
        name: validPlayerName,
        points: validPoints,
        bonusPoints: validBonusPoints,
      ));

      expect(actualResult, expectedResult);
    });
  });
}
