import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:game_counter/core/constants/budget_constants.dart';
import 'package:game_counter/core/error/failure.dart';
import 'package:game_counter/core/util/input_converter.dart';
import 'package:game_counter/domain/usecases/create_game.dart';
import 'package:game_counter/domain/usecases/create_player.dart';
import 'package:game_counter/domain/usecases/delete_player.dart';
import 'package:game_counter/domain/usecases/end_game_sooner.dart';
import 'package:game_counter/domain/usecases/save_game_into_history.dart';
import 'package:game_counter/presentation/feature/core/game_bloc.dart';
import 'package:mockito/mockito.dart';
import '../../../test_data/test_data.dart';

class MockCreateGame extends Mock implements CreateGame {}

class MockDeletePlayer extends Mock implements DeletePlayer {}

class MockEndGameSooner extends Mock implements EndGameSooner {}

class MockCreatePlayer extends Mock implements CreatePlayer {}

class MockInputConverter extends Mock implements InputConverter {}

class MockSaveGameIntoHistory extends Mock implements SaveGameIntoHistory {}

void main() {
  MockCreateGame mockCreateGame;
  MockCreatePlayer mockCreatePlayer;
  MockDeletePlayer mockDeletePlayer;
  MockEndGameSooner mockEndGameSooner;
  MockInputConverter mockInputConverter;
  MockSaveGameIntoHistory mockSaveGameIntoHistory;

  setUp(
    () {
      mockCreatePlayer = MockCreatePlayer();
      mockCreateGame = MockCreateGame();
      mockDeletePlayer = MockDeletePlayer();
      mockEndGameSooner = MockEndGameSooner();
      mockInputConverter = MockInputConverter();
      mockSaveGameIntoHistory = MockSaveGameIntoHistory();
    },
  );
  //TODO separate by event...
  group(
    'GameBlocEvents',
    () {
      void _setupMockInputConverterSuccess() {
        when(mockInputConverter.stringToUnsignedInteger(TEST_POINTS_TO_WIN_1))
            .thenReturn(Right(TEST_POINTS_TO_WIN_PARSED_1));

        when(mockInputConverter
                .stringToUnsignedInteger(TEST_NUMBER_OF_PLAYERS_1))
            .thenReturn(Right(TEST_NUMBER_OF_PLAYERS_PARSED_1));

        when(mockInputConverter.stringToUnsignedInteger(TEST_PLAYER_1_POINTS))
            .thenReturn(Right(TEST_PLAYER_1_POINTS_PARSED));

        when(mockInputConverter
                .stringToUnsignedInteger(TEST_PLAYER_1_BONUS_POINTS))
            .thenReturn(Right(TEST_PLAYER_1_BONUS_POINTS_PARSED));
      }

      void _setupMockInputConverterFails() {
        when(mockInputConverter.stringToUnsignedInteger(TEST_POINTS_TO_WIN_1))
            .thenReturn(Left(ValidationFailure(INVALID_NUMBER_PROVIDED)));

        when(mockInputConverter
                .stringToUnsignedInteger(TEST_NUMBER_OF_PLAYERS_1))
            .thenReturn(Left(ValidationFailure(INVALID_NUMBER_PROVIDED)));
      }

      blocTest('should call createGame with correctly parsed arguments',
          build: () async {
            _setupMockInputConverterSuccess();
            when(mockCreateGame.call(any))
                .thenAnswer((_) async => Right(testGame));

            return GameBloc(
              createGame: mockCreateGame,
              deletePlayer: mockDeletePlayer,
              endGameSooner: mockEndGameSooner,
              inputConverter: mockInputConverter,
              createPlayer: mockCreatePlayer,
              saveGameIntoHistory: mockSaveGameIntoHistory,
            );
          },
          act: (GameBloc gameBloc) async => gameBloc.add(GameEvent.gameCreated(
                gameTitle: TEST_GAME_NAME_1,
                numberOfPlayers: TEST_NUMBER_OF_PLAYERS_1,
                pointsToWin: TEST_POINTS_TO_WIN_1,
              )),
          verify: (gameBloc) async {
            mockCreateGame(CreateGameParams(
                gameTitle: TEST_GAME_NAME_1,
                numberOfPlayers: TEST_NUMBER_OF_PLAYERS_PARSED_1,
                winningPoints: TEST_POINTS_TO_WIN_PARSED_1));
          },
          expect: [GameState.updatedState(game: testGame)]);

      blocTest(
        'should emit [ErrorState] when the usecase validation fails',
        build: () async {
          when(mockCreateGame.call(any)).thenAnswer(
              (_) async => Left(ValidationFailure(INVALID_NUMBER_PROVIDED)));

          _setupMockInputConverterFails();
          return GameBloc(
            createGame: mockCreateGame,
            deletePlayer: mockDeletePlayer,
            endGameSooner: mockEndGameSooner,
            inputConverter: mockInputConverter,
            createPlayer: mockCreatePlayer,
            saveGameIntoHistory: mockSaveGameIntoHistory,
          );
        },
        act: (gameBloc) => gameBloc.add(GameEvent.gameCreated(
          gameTitle: TEST_GAME_NAME_1,
          numberOfPlayers: TEST_NUMBER_OF_PLAYERS_1,
          pointsToWin: TEST_POINTS_TO_WIN_1,
        )),
        expect: [
          GameState.errorState(errorMessage: VALIDATION_ERROR),
        ],
      );

      blocTest('should emit [ErrorState] when the game creation fails',
          build: () async {
            when(mockCreateGame.call(any)).thenAnswer(
                (_) async => Left(ValidationFailure(INVALID_NUMBER_PROVIDED)));
            _setupMockInputConverterSuccess();

            return GameBloc(
              createGame: mockCreateGame,
              deletePlayer: mockDeletePlayer,
              endGameSooner: mockEndGameSooner,
              inputConverter: mockInputConverter,
              createPlayer: mockCreatePlayer,
              saveGameIntoHistory: mockSaveGameIntoHistory,
            );
          },
          act: (gameBloc) => gameBloc.add((GameEvent.gameCreated(
                gameTitle: TEST_GAME_NAME_1,
                numberOfPlayers: TEST_NUMBER_OF_PLAYERS_1,
                pointsToWin: TEST_POINTS_TO_WIN_1,
              ))),
          expect: [GameState.errorState(errorMessage: VALIDATION_ERROR)]);

      blocTest(
        'should emit [GameCreatedState] when the usecase validation succeeds',
        build: () async {
          when(mockCreateGame.call(any))
              .thenAnswer((_) async => Right(testGame));
          _setupMockInputConverterSuccess();

          return GameBloc(
            createGame: mockCreateGame,
            deletePlayer: mockDeletePlayer,
            endGameSooner: mockEndGameSooner,
            inputConverter: mockInputConverter,
            createPlayer: mockCreatePlayer,
            saveGameIntoHistory: mockSaveGameIntoHistory,
          );
        },
        act: (gameBloc) => gameBloc.add(GameEvent.gameCreated(
          gameTitle: TEST_GAME_NAME_1,
          numberOfPlayers: TEST_NUMBER_OF_PLAYERS_1,
          pointsToWin: TEST_POINTS_TO_WIN_1,
        )),
        expect: [
          GameState.updatedState(game: testGame),
        ],
      );

      blocTest(
        'should emit [GameUpdatedState] when [GameUpdatedEvent] is triggered',
        build: () async => GameBloc(
          createGame: mockCreateGame,
          deletePlayer: mockDeletePlayer,
          endGameSooner: mockEndGameSooner,
          inputConverter: mockInputConverter,
          createPlayer: mockCreatePlayer,
          saveGameIntoHistory: mockSaveGameIntoHistory,
        ),
        act: (gameBloc) =>
            gameBloc.add(GameEvent.gameUpdated(newGame: testGame.copyWith(winner: ''))),
        expect: [GameState.updatedState(game: testGame.copyWith(winner: ''))],
      );

      blocTest(
        'should emit [GameOverEvent] when [GameUpdatedEvent] is triggered with winner field different from null',
        build: () async => GameBloc(
          createGame: mockCreateGame,
          deletePlayer: mockDeletePlayer,
          endGameSooner: mockEndGameSooner,
          inputConverter: mockInputConverter,
          createPlayer: mockCreatePlayer,
          saveGameIntoHistory: mockSaveGameIntoHistory,
        ),
        act: (gameBloc) =>
            gameBloc.add(GameEvent.gameUpdated(newGame: testGame)),
        verify: (gameBloc) async {
          mockSaveGameIntoHistory(
              SaveGameIntoHistoryParams(gameToSave: testGame));
        },
        expect: [GameState.overState(player: testPlayer1)],
      );

      blocTest(
        'should call createPlayer with correctly parsed arguments',
        build: () async {
          _setupMockInputConverterSuccess();
          when(mockCreatePlayer.call(any))
              .thenAnswer((_) async => Right(testGame));

          return GameBloc(
            createGame: mockCreateGame,
            deletePlayer: mockDeletePlayer,
            endGameSooner: mockEndGameSooner,
            inputConverter: mockInputConverter,
            createPlayer: mockCreatePlayer,
            saveGameIntoHistory: mockSaveGameIntoHistory,
          );
        },
        act: (gameBloc) => gameBloc.add((GameEvent.playerCreated(
          playerName: TEST_PLAYER_1_NAME,
          points: TEST_PLAYER_1_POINTS,
          bonusPoints: TEST_PLAYER_1_BONUS_POINTS,
        ))),
        verify: (gameBloc) async => mockCreatePlayer(CreatePlayerParams(
          playerName: TEST_PLAYER_1_NAME,
          points: TEST_PLAYER_1_POINTS_PARSED,
          bonusPoints: TEST_PLAYER_1_BONUS_POINTS_PARSED,
        )),
        expect: [GameState.updatedState(game: testGame)],
      );

      blocTest(
        'should emit [GameErrorState] when the usecase validation fails',
        build: () async {
          _setupMockInputConverterSuccess();
          when(mockCreatePlayer.call(any)).thenAnswer(
              (_) async => Left(ValidationFailure(INVALID_NUMBER_PROVIDED)));

          return GameBloc(
            createGame: mockCreateGame,
            deletePlayer: mockDeletePlayer,
            endGameSooner: mockEndGameSooner,
            inputConverter: mockInputConverter,
            createPlayer: mockCreatePlayer,
            saveGameIntoHistory: mockSaveGameIntoHistory,
          );
        },
        act: (gameBloc) => gameBloc.add(GameEvent.playerCreated(
          playerName: TEST_PLAYER_1_NAME,
          points: TEST_PLAYER_1_POINTS,
          bonusPoints: TEST_PLAYER_1_BONUS_POINTS,
        )),
        expect: [
          GameState.errorState(errorMessage: INVALID_NUMBER_PROVIDED),
        ],
      );

      blocTest(
        'should emit [GameErrorState] when the player creation fails',
        build: () async {
          when(mockCreatePlayer.call(any)).thenAnswer(
              (_) async => Left(ValidationFailure(INVALID_NUMBER_PROVIDED)));
          _setupMockInputConverterSuccess();

          return GameBloc(
            createGame: mockCreateGame,
            deletePlayer: mockDeletePlayer,
            endGameSooner: mockEndGameSooner,
            inputConverter: mockInputConverter,
            createPlayer: mockCreatePlayer,
            saveGameIntoHistory: mockSaveGameIntoHistory,
          );
        },
        act: (gameBloc) => gameBloc.add((GameEvent.playerCreated(
          playerName: TEST_PLAYER_1_NAME,
          points: TEST_PLAYER_1_POINTS,
          bonusPoints: TEST_PLAYER_1_BONUS_POINTS,
        ))),
        expect: [
          GameState.errorState(errorMessage: INVALID_NUMBER_PROVIDED),
        ],
      );

      blocTest(
        'should emit [GameUpdatedEvent] when the player creation succeds',
        build: () async {
          when(mockCreatePlayer.call(any))
              .thenAnswer((_) async => Right(testGame));
          _setupMockInputConverterSuccess();

          return GameBloc(
            createGame: mockCreateGame,
            deletePlayer: mockDeletePlayer,
            endGameSooner: mockEndGameSooner,
            inputConverter: mockInputConverter,
            createPlayer: mockCreatePlayer,
            saveGameIntoHistory: mockSaveGameIntoHistory,
          );
        },
        act: (gameBloc) => gameBloc.add((GameEvent.playerCreated(
          playerName: TEST_PLAYER_1_NAME,
          points: TEST_PLAYER_1_POINTS,
          bonusPoints: TEST_PLAYER_1_BONUS_POINTS,
        ))),
        expect: [isA<GameState>()], // TODO Check how to compare freezed classed we need GameState.GameState.updatedState here
      );

      blocTest(
        'should emit [GameErrorState] when the createPlayer usecase returns a [CacheFailure]',
        build: () async {
          when(mockCreatePlayer.call(any)).thenAnswer(
              (_) async => Left(CacheFailure(ERROR_RETREVING_LOCAL_DATA)));

          _setupMockInputConverterSuccess();

          return GameBloc(
            createGame: mockCreateGame,
            deletePlayer: mockDeletePlayer,
            endGameSooner: mockEndGameSooner,
            inputConverter: mockInputConverter,
            createPlayer: mockCreatePlayer,
            saveGameIntoHistory: mockSaveGameIntoHistory,
          );
        },
        act: (gameBloc) => gameBloc.add((GameEvent.playerCreated(
          playerName: TEST_PLAYER_1_NAME,
          points: TEST_PLAYER_1_POINTS,
          bonusPoints: TEST_PLAYER_1_BONUS_POINTS,
        ))),
        expect: [
          GameState.errorState(errorMessage: ERROR_RETREVING_LOCAL_DATA),
        ],
      );

      blocTest(
        'should emit [GameErrorState] when [DeletePlayer] returns a failure',
        build: () async {
          when(mockDeletePlayer.call(any)).thenAnswer(
              (_) async => Left(CacheFailure(ERROR_RETREVING_LOCAL_DATA)));

          return GameBloc(
            createGame: mockCreateGame,
            deletePlayer: mockDeletePlayer,
            endGameSooner: mockEndGameSooner,
            inputConverter: mockInputConverter,
            createPlayer: mockCreatePlayer,
            saveGameIntoHistory: mockSaveGameIntoHistory,
          );
        },
        act: (gameBloc) => gameBloc.add(GameEvent.deletePlayer(
          playerToDelete: testPlayer1,
        )),
        expect: [
          GameState.errorState(errorMessage: ERROR_RETREVING_LOCAL_DATA),
        ],
      );

      blocTest(
        'should emit [GameErrorState] when [DeletePlayerGameEvent] delete player usecase returns a failure',
        build: () async {
          when(mockDeletePlayer.call(any))
              .thenAnswer((_) async => Left(NotImplementedFailure()));

          return GameBloc(
            createGame: mockCreateGame,
            deletePlayer: mockDeletePlayer,
            endGameSooner: mockEndGameSooner,
            inputConverter: mockInputConverter,
            createPlayer: mockCreatePlayer,
            saveGameIntoHistory: mockSaveGameIntoHistory,
          );
        },
        act: (gameBloc) => gameBloc.add(GameEvent.deletePlayer(
          playerToDelete: testPlayer1,
        )),
        expect: [
          GameState.errorState(errorMessage: ''),
        ],
      );

      blocTest(
        'should emit [GameUpdatedState] when [DeletePlayerGameEvent] delete player usecase succeds',
        build: () async {
          when(mockDeletePlayer.call(any))
              .thenAnswer((_) async => Right(testGame));

          return GameBloc(
            createGame: mockCreateGame,
            deletePlayer: mockDeletePlayer,
            endGameSooner: mockEndGameSooner,
            inputConverter: mockInputConverter,
            createPlayer: mockCreatePlayer,
            saveGameIntoHistory: mockSaveGameIntoHistory,
          );
        },
        act: (gameBloc) => gameBloc.add(GameEvent.deletePlayer(
          playerToDelete: testPlayer1,
        )),
        expect: [
          GameState.updatedState(game: testGame),
        ],
      );

      blocTest(
        'should emit [GameOverState] when endGameSoonerUseCase result succeds',
        build: () async {
          testGame.players.add(testPlayer1);

          when(mockEndGameSooner.call(any))
              .thenAnswer((_) async => Right(testPlayer1));

          return GameBloc(
            createGame: mockCreateGame,
            deletePlayer: mockDeletePlayer,
            endGameSooner: mockEndGameSooner,
            inputConverter: mockInputConverter,
            createPlayer: mockCreatePlayer,
            saveGameIntoHistory: mockSaveGameIntoHistory,
          );
        },
        act: (gameBloc) =>
            gameBloc.add(GameEvent.endGameSooner(currentGame: testGame)),
        verify: (gameBloc) async {
          mockSaveGameIntoHistory(
              SaveGameIntoHistoryParams(gameToSave: testGame));
        },
        expect: [
          GameState.overState(player: testPlayer1),
        ],
      );

      blocTest(
        'should emit [GameErrorState] when endGameSoonerUseCase result fails',
        build: () async {
          testGame.players.add(testPlayer1);

          when(mockEndGameSooner.call(any))
              .thenAnswer((_) async => Left(NotImplementedFailure()));

          return GameBloc(
            createGame: mockCreateGame,
            deletePlayer: mockDeletePlayer,
            endGameSooner: mockEndGameSooner,
            inputConverter: mockInputConverter,
            createPlayer: mockCreatePlayer,
            saveGameIntoHistory: mockSaveGameIntoHistory,
          );
        },
        act: (gameBloc) =>
            gameBloc.add(GameEvent.endGameSooner(currentGame: testGame)),
        expect: [
          GameState.errorState(errorMessage: ''),
        ],
      );
    },
  );
}
