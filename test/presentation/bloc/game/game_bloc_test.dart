import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:game_counter/core/error/failure.dart';
import 'package:game_counter/core/util/input_converter.dart';
import 'package:game_counter/domain/entities/game.dart';
import 'package:game_counter/domain/usecases/create_game.dart';
import 'package:game_counter/presentation/bloc/game/game_bloc.dart';
import 'package:mockito/mockito.dart';

class MockCreateGame extends Mock implements CreateGame {}

class MockInputConverter extends Mock implements InputConverter {}

void main() {
  MockCreateGame mockCreateGame;
  MockInputConverter mockInputConverter;

  setUp(
    () {
      mockCreateGame = MockCreateGame();
      mockInputConverter = MockInputConverter();
    },
  );

  blocTest('should emit [GameInitialState] as initial state',
      build: () => GameBloc(
          createGame: mockCreateGame, inputConverter: mockInputConverter),
      expect: [GameInitialState()]);

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

      void _setupMockInputConverterFails() {
        when(mockInputConverter.stringToUnsignedInteger(pointsToWin))
            .thenReturn(Left(ValidationFailure()));

        when(mockInputConverter.stringToUnsignedInteger(numberOfPlayers))
            .thenReturn(Left(ValidationFailure()));
      }

      blocTest('should call createGame with correctly parsed arguments',
          build: () => GameBloc(
              createGame: mockCreateGame, inputConverter: mockInputConverter),
          act: (gameBloc) => gameBloc.add(CreateGameEvent(
                gameTitle: gameName,
                numberOfPlayers: numberOfPlayers,
                pointsToWin: pointsToWin,
              )),
          verify: () => (mockCreateGame(Params(
              gameTitle: gameName,
              numberOfPlayers: numberOfPlayersParsed,
              winningPoints: pointsToWinParsed))),
          expect: [GameInitialState()]);

      blocTest(
        'should emit [ErrorState] when the usecase validation fails',
        build: () {
          when(mockCreateGame.call(any))
              .thenAnswer((_) async => Left(ValidationFailure()));

          _setupMockInputConverterFails();
          return GameBloc(
              createGame: mockCreateGame, inputConverter: mockInputConverter);
        },
        act: (gameBloc) => gameBloc.add(CreateGameEvent(
          gameTitle: gameName,
          numberOfPlayers: numberOfPlayers,
          pointsToWin: pointsToWin,
        )),
        expect: [
          GameInitialState(),
          GameErrorState(message: VALIDATION_ERROR),
        ],
      );

      blocTest('should emit [ErrorState] when the game creation fails',
          build: () {
            when(mockCreateGame.call(any))
                .thenAnswer((_) async => Left(ValidationFailure()));
            _setupMockInputConverterSuccess();

            return GameBloc(
                createGame: mockCreateGame, inputConverter: mockInputConverter);
          },
          act: (gameBloc) => gameBloc.add((CreateGameEvent(
                gameTitle: gameName,
                numberOfPlayers: numberOfPlayers,
                pointsToWin: pointsToWin,
              ))),
          expect: [
            GameInitialState(),
            GameErrorState(message: VALIDATION_ERROR)
          ]);

      blocTest(
        'should emit [GameCreatedState] when the usecase validation succeeds',
        build: () {
          when(mockCreateGame.call(any))
              .thenAnswer((_) async => Right(testGame));
          _setupMockInputConverterSuccess();

          return GameBloc(
              createGame: mockCreateGame, inputConverter: mockInputConverter);
        },
        act: (gameBloc) => gameBloc.add(CreateGameEvent(
          gameTitle: gameName,
          numberOfPlayers: numberOfPlayers,
          pointsToWin: pointsToWin,
        )),
        expect: [
          GameInitialState(),
          GameCreatedState(game: testGame),
        ],
      );
    },
  );
}