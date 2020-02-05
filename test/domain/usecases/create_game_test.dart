import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:game_counter/domain/entities/game.dart';
import 'package:game_counter/domain/entities/player.dart';
import 'package:game_counter/domain/usecases/create_game.dart';

void main() {
  CreateGame createGame;

  setUp(
    () {
      createGame = CreateGame();
    },
  );

  group(
    'createGame',
    () {
      test(
        'should return a valid game instance with valid parametars',
        () async {
          final validGameName = 'validGameName';
          final validPointsToWin = 0;
          final validBonusPoints = 0;
          final validNumberOfPlayers = 4;
          final validWinner = 'someone';
          List<Player> players = [];

          final actualResult = await createGame(
            Params(
              gameTitle: validGameName,
              numberOfPlayers: validNumberOfPlayers,
              winningPoints: validPointsToWin,
            ),
          );

          final expectedResult = Right(Game(
            name: validGameName,
            numberOfPlayers: validNumberOfPlayers,
            pointsToWin: validPointsToWin,
          ));

          expect(actualResult, expectedResult);
        },
      );
    },
  );
}
