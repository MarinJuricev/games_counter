import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:game_counter/core/error/failure.dart';
import 'package:game_counter/domain/entities/game.dart';
import 'package:game_counter/domain/entities/player.dart';
import 'package:game_counter/domain/usecases/add_player.dart';

void main() {
  AddPlayer addPlayer;

  setUp(
    () {
      addPlayer = AddPlayer();
    },
  );

  group(
    'addPlayer',
    () {
      test(
        'should add a new player to the already existing game',
        () async {
          final newPlayer = Player(
            name: 'randomName',
            points: 0,
            bonusPoints: 0,
          );
          final gameInProgress = Game(
              name: 'Treseta',
              pointsToWin: 41,
              numberOfPlayers: 4,
              players: []);

          final actualResult = await addPlayer(Params(
            currentGame: gameInProgress,
            newPlayer: newPlayer,
          ));

          gameInProgress.players.add(newPlayer);
          final expectedResult = Right(gameInProgress);

          expect(actualResult, expectedResult);
        },
      );

      test(
        'should return a [PlayerAlreadyExistsFailure] if a player with the same name already exists',
        () async {
          final newPlayer = Player(
            name: 'randomName',
            points: 0,
            bonusPoints: 0,
          );
          final gameInProgress = Game(
              name: 'Treseta',
              pointsToWin: 41,
              numberOfPlayers: 4,
              players: [newPlayer]);

          final actualResult = await addPlayer(Params(
            currentGame: gameInProgress,
            newPlayer: newPlayer,
          ));

          gameInProgress.players.add(newPlayer);
          final expectedResult = Left(PlayerAlreadyExistsFailure());

          expect(actualResult, expectedResult);
        },
      );
    },
  );
}
