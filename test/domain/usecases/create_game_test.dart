import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:game_counter/core/error/failure.dart';
import 'package:game_counter/domain/entities/game.dart';
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
        'should return ValidationError when the provided gameTitle is empty',
        () async {
          final emptyGameTitle = '';
          final validNumberOfPlayers = 4;
          final validWinningPoints = 41;

          final actualResult = await createGame(
            Params(
              gameTitle: emptyGameTitle,
              numberOfPlayers: validNumberOfPlayers,
              winningPoints: validWinningPoints,
            ),
          );

          expect(actualResult, Left(ValidationFailure()));
        },
      );

      test(
        'should return ValidationError when the provided numberOfPlayers is a negative number',
        () async {
          final gameTitle = 'Treseta';
          final invalidNumberOfPlayers = -1;
          final validWinningPoints = 41;

          final actualResult = await createGame(
            Params(
              gameTitle: gameTitle,
              numberOfPlayers: invalidNumberOfPlayers,
              winningPoints: validWinningPoints,
            ),
          );

          expect(actualResult, Left(ValidationFailure()));
        },
      );

      test(
        'should return ValidationError when the provided winningPoints is a negative number',
        () async {
          final gameTitle = 'Treseta';
          final validNumberOfPlayers = 4;
          final invalidWinningPoints = -1;

          final actualResult = await createGame(
            Params(
              gameTitle: gameTitle,
              numberOfPlayers: validNumberOfPlayers,
              winningPoints: invalidWinningPoints,
            ),
          );

          expect(actualResult, Left(ValidationFailure()));
        },
      );

      test(
        'should return ValidationError when the provided numberOfPlayers is 0',
        () async {
          final gameTitle = 'Treseta';
          final invalidNumberOfPlayers = 0;
          final validWinningPoints = 41;

          final actualResult = await createGame(
            Params(
              gameTitle: gameTitle,
              numberOfPlayers: invalidNumberOfPlayers,
              winningPoints: validWinningPoints,
            ),
          );

          expect(actualResult, Left(ValidationFailure()));
        },
      );

      test(
        'should return ValidationError when the provided winningPoints is 0',
        () async {
          final gameTitle = 'Treseta';
          final validNumberOfPlayers = 4;
          final invalidWinningPoints = 0;

          final actualResult = await createGame(
            Params(
              gameTitle: gameTitle,
              numberOfPlayers: validNumberOfPlayers,
              winningPoints: invalidWinningPoints,
            ),
          );

          expect(actualResult, Left(ValidationFailure()));
        },
      );

      test(
        'should return valid Game object when all the parametars are valid',
        () async {
          final gameTitle = 'Treseta';
          final validNumberOfPlayers = 4;
          final validWinningPoints = 41;

          final actualResult = await createGame(
            Params(
              gameTitle: gameTitle,
              numberOfPlayers: validNumberOfPlayers,
              winningPoints: validWinningPoints,
            ),
          );

          final expectedResult = Right(
            Game(
                name: gameTitle,
                pointsToWin: validWinningPoints,
                numberOfPlayers: validNumberOfPlayers),
          );

          expect(actualResult, expectedResult);
        },
      );
    },
  );
}
