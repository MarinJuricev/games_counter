import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:game_counter/core/constants/budget_constants.dart';
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
          players: []);

      void _setupMockInputConverterSuccess() {
        when(mockInputConverter.stringToUnsignedInteger(pointsToWin))
            .thenReturn(Right(pointsToWinParsed));

        when(mockInputConverter.stringToUnsignedInteger(numberOfPlayers))
            .thenReturn(Right(numberOfPlayersParsed));
      }

      void _setupMockInputConverterFails() {
        when(mockInputConverter.stringToUnsignedInteger(pointsToWin))
            .thenReturn(Left(ValidationFailure(INVALID_NUMBER_PROVIDED)));

        when(mockInputConverter.stringToUnsignedInteger(numberOfPlayers))
            .thenReturn(Left(ValidationFailure(INVALID_NUMBER_PROVIDED)));
      }

      blocTest('should call createGame with correctly parsed arguments',
          build: () async => GameBloc(
              createGame: mockCreateGame, inputConverter: mockInputConverter),
          act: (gameBloc) => gameBloc.add(CreatedGameEvent(
                gameTitle: gameName,
                numberOfPlayers: numberOfPlayers,
                pointsToWin: pointsToWin,
              )),
          verify: (gameBloc) async {
            mockCreateGame(Params(
                gameTitle: gameName,
                numberOfPlayers: numberOfPlayersParsed,
                winningPoints: pointsToWinParsed));
          },
          expect: []);

      blocTest(
        'should emit [ErrorState] when the usecase validation fails',
        build: () async {
          when(mockCreateGame.call(any)).thenAnswer(
              (_) async => Left(ValidationFailure(INVALID_NUMBER_PROVIDED)));

          _setupMockInputConverterFails();
          return GameBloc(
              createGame: mockCreateGame, inputConverter: mockInputConverter);
        },
        act: (gameBloc) => gameBloc.add(CreatedGameEvent(
          gameTitle: gameName,
          numberOfPlayers: numberOfPlayers,
          pointsToWin: pointsToWin,
        )),
        expect: [
          GameErrorState(message: VALIDATION_ERROR),
        ],
      );

      blocTest('should emit [ErrorState] when the game creation fails',
          build: () async {
            when(mockCreateGame.call(any)).thenAnswer(
                (_) async => Left(ValidationFailure(INVALID_NUMBER_PROVIDED)));
            _setupMockInputConverterSuccess();

            return GameBloc(
                createGame: mockCreateGame, inputConverter: mockInputConverter);
          },
          act: (gameBloc) => gameBloc.add((CreatedGameEvent(
                gameTitle: gameName,
                numberOfPlayers: numberOfPlayers,
                pointsToWin: pointsToWin,
              ))),
          expect: [GameErrorState(message: VALIDATION_ERROR)]);

      blocTest(
        'should emit [GameCreatedState] when the usecase validation succeeds',
        build: () async {
          when(mockCreateGame.call(any))
              .thenAnswer((_) async => Right(testGame));
          _setupMockInputConverterSuccess();

          return GameBloc(
              createGame: mockCreateGame, inputConverter: mockInputConverter);
        },
        act: (gameBloc) => gameBloc.add(CreatedGameEvent(
          gameTitle: gameName,
          numberOfPlayers: numberOfPlayers,
          pointsToWin: pointsToWin,
        )),
        expect: [
          GameCreatedState(game: testGame),
        ],
      );

      blocTest(
        'should emit [GameUpdatedState] when [GameUpdatedEvent] is triggered',
        build: () async => GameBloc(
            createGame: mockCreateGame, inputConverter: mockInputConverter),
        act: (gameBloc) => gameBloc.add(GameUpdatedEvent(newGame: testGame)),
        expect: [GameUpdatedState(game: testGame)],
      );
    },
  );
}
