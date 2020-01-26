import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:game_counter/core/error/failure.dart';
import 'package:game_counter/domain/entities/game.dart';
import 'package:game_counter/domain/usecases/create_game.dart';
import 'package:game_counter/presentation/bloc/game/bloc/game_bloc.dart';
import 'package:mockito/mockito.dart';

class MockCreateGame extends Mock implements CreateGame {}

void main() {
  GameBloc gameBloc;
  MockCreateGame mockCreateGame;

  setUp(
    () {
      mockCreateGame = MockCreateGame();
      gameBloc = GameBloc(createGame: mockCreateGame);
    },
  );

  test(
    'initialState should be GameInitialState',
    () {
      expect(gameBloc.initialState, GameInitialState());
    },
  );

  group(
    'CreateGameEvent',
    () {
      final gameName = 'Treseta';
      final pointsToWin = 41;
      final numberOfPlayers = 4;
      final testGame = Game(
        name: gameName,
        pointsToWin: pointsToWin,
        numberOfPlayers: numberOfPlayers,
      );

      test(
        'should call createGame to validate the user input',
        () async {
          when(mockCreateGame.call(any))
              .thenAnswer((_) async => Right(testGame));

          gameBloc.add(CreateGameEvent(
            gameTitle: gameName,
            numberOfPlayers: numberOfPlayers,
            pointsToWin: pointsToWin,
          ));
          await untilCalled(mockCreateGame(any));

          verify(mockCreateGame(Params(
              gameTitle: gameName,
              numberOfPlayers: numberOfPlayers,
              winningPoints: pointsToWin)));
        },
      );

      test(
        'should emit [ErrorState] when the usecase validation fails',
        () async {
          when(mockCreateGame.call(any))
              .thenAnswer((_) async => Left(ValidationFailure()));

          final expectedState = [
            GameInitialState(),
            ErrorState(message: VALIDATION_ERROR),
          ];

          expectLater(gameBloc, emitsInOrder(expectedState));

          gameBloc.add(CreateGameEvent(
            gameTitle: gameName,
            numberOfPlayers: numberOfPlayers,
            pointsToWin: pointsToWin,
          ));
        },
      );

      test(
        'should emit [GameCreatedState] when the usecase validation succeeds',
        () async {
          when(mockCreateGame.call(any))
              .thenAnswer((_) async => Right(testGame));

          final expectedState = [
            GameInitialState(),
            GameCreatedState(game: testGame),
          ];

          expectLater(gameBloc, emitsInOrder(expectedState));

          gameBloc.add(CreateGameEvent(
            gameTitle: gameName,
            numberOfPlayers: numberOfPlayers,
            pointsToWin: pointsToWin,
          ));
        },
      );
    },
  );
}
