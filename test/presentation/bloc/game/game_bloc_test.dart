import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:game_counter/core/error/failure.dart';
import 'package:game_counter/core/util/input_converter.dart';
import 'package:game_counter/domain/entities/game.dart';
import 'package:game_counter/domain/usecases/create_game.dart';
import 'package:game_counter/presentation/bloc/game/bloc/game_bloc.dart';
import 'package:mockito/mockito.dart';

class MockCreateGame extends Mock implements CreateGame {}

class MockInputConverter extends Mock implements InputConverter {}

void main() {
  GameBloc gameBloc;
  MockCreateGame mockCreateGame;
  MockInputConverter mockInputConverter;

  setUp(
    () {
      mockCreateGame = MockCreateGame();
      mockInputConverter = MockInputConverter();
      gameBloc = GameBloc(
          createGame: mockCreateGame, inputConverter: mockInputConverter);
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
      final pointsToWin = '41';
      final numberOfPlayers = '4';
      final pointsToWinParsed = 41;
      final numberOfPlayersParsed = 4;
      final testGame = Game(
        name: gameName,
        pointsToWin: pointsToWinParsed,
        numberOfPlayers: numberOfPlayersParsed,
      );

      void _setupMockInputConverterSuccess() {
        when(mockInputConverter.stringToUnsignedInteger(pointsToWin))
            .thenReturn(Right(pointsToWinParsed));

        when(mockInputConverter.stringToUnsignedInteger(numberOfPlayers))
            .thenReturn(Right(numberOfPlayersParsed));
      }

      test(
        'should call createGame to with correctly parsed arguments',
        () async {
          when(mockCreateGame.call(any))
              .thenAnswer((_) async => Right(testGame));

          _setupMockInputConverterSuccess();

          gameBloc.add(CreateGameEvent(
            gameTitle: gameName,
            numberOfPlayers: numberOfPlayers,
            pointsToWin: pointsToWin,
          ));
          await untilCalled(mockCreateGame(any));

          verify(mockCreateGame(Params(
              gameTitle: gameName,
              numberOfPlayers: numberOfPlayersParsed,
              winningPoints: pointsToWinParsed)));
        },
      );

      test(
        'should emit [ErrorState] when the usecase validation fails',
        () async {
          when(mockCreateGame.call(any))
              .thenAnswer((_) async => Left(ValidationFailure()));

              _setupMockInputConverterSuccess();

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

              _setupMockInputConverterSuccess();

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
