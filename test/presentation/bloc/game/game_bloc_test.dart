import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:game_counter/core/constants/budget_constants.dart';
import 'package:game_counter/core/error/failure.dart';
import 'package:game_counter/core/util/input_converter.dart';
import 'package:game_counter/domain/entities/game.dart';
import 'package:game_counter/domain/entities/player.dart';
import 'package:game_counter/domain/repositories/game_repository.dart';
import 'package:game_counter/domain/usecases/create_game.dart'
    as createGameUseCase;
import 'package:game_counter/domain/usecases/create_player.dart';
import 'package:game_counter/domain/usecases/delete_player.dart'
    as deletePlayerUseCase;
import 'package:game_counter/domain/usecases/end_game_sooner.dart'
    as endGameSoonerUseCase;
import 'package:game_counter/presentation/bloc/game/game_bloc.dart';
import 'package:mockito/mockito.dart';

class MockCreateGame extends Mock implements createGameUseCase.CreateGame {}

class MockDeletePlayer extends Mock
    implements deletePlayerUseCase.DeletePlayer {}

class MockEndGameSooner extends Mock
    implements endGameSoonerUseCase.EndGameSooner {}

class MockCreatePlayer extends Mock implements CreatePlayer {}

class MockGameRepository extends Mock implements GameRepository {}

class MockInputConverter extends Mock implements InputConverter {}

void main() {
  MockCreateGame mockCreateGame;
  MockCreatePlayer mockCreatePlayer;
  MockDeletePlayer mockDeletePlayer;
  MockEndGameSooner mockEndGameSooner;
  MockGameRepository mockGameRepository;
  MockInputConverter mockInputConverter;

  setUp(
    () {
      mockCreatePlayer = MockCreatePlayer();
      mockGameRepository = MockGameRepository();
      mockCreateGame = MockCreateGame();
      mockDeletePlayer = MockDeletePlayer();
      mockEndGameSooner = MockEndGameSooner();
      mockInputConverter = MockInputConverter();
    },
  );
  //TODO separate by event...
  group(
    'GameBlocEvents',
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

      final playerName = 'validName';
      final playerPoints = '0';
      final playerBonusPoints = '0';
      final playerPointsParsed = 0;
      final playerBonusPointsParsed = 0;

      final testPlayer = Player(
          name: playerName,
          points: playerPointsParsed,
          bonusPoints: playerBonusPointsParsed);

      final testGameOverGame = Game(
          name: gameName,
          pointsToWin: pointsToWinParsed,
          numberOfPlayers: numberOfPlayersParsed,
          winner: playerName,
          players: [testPlayer]);

      void _setupMockInputConverterSuccess() {
        when(mockInputConverter.stringToUnsignedInteger(pointsToWin))
            .thenReturn(Right(pointsToWinParsed));

        when(mockInputConverter.stringToUnsignedInteger(numberOfPlayers))
            .thenReturn(Right(numberOfPlayersParsed));

        when(mockInputConverter.stringToUnsignedInteger(playerPoints))
            .thenReturn(Right(playerPointsParsed));

        when(mockInputConverter.stringToUnsignedInteger(playerBonusPoints))
            .thenReturn(Right(playerBonusPointsParsed));
      }

      void _setupMockInputConverterFails() {
        when(mockInputConverter.stringToUnsignedInteger(pointsToWin))
            .thenReturn(Left(ValidationFailure(INVALID_NUMBER_PROVIDED)));

        when(mockInputConverter.stringToUnsignedInteger(numberOfPlayers))
            .thenReturn(Left(ValidationFailure(INVALID_NUMBER_PROVIDED)));
      }

      void _setupRepositorySuccessCase() {
        when(mockGameRepository.getGame())
            .thenAnswer((_) async => Right(testGame));
      }

      void _setupRepositoryFailureCase() {
        when(mockGameRepository.getGame()).thenAnswer(
            (_) async => Left(CacheFailure(ERROR_RETREVING_LOCAL_DATA)));
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
                gameRepository: mockGameRepository);
          },
          act: (gameBloc) => gameBloc.add(GameEvent.gameCreated(
                gameTitle: gameName,
                numberOfPlayers: numberOfPlayers,
                pointsToWin: pointsToWin,
              )),
          verify: (gameBloc) async {
            mockCreateGame(createGameUseCase.Params(
                gameTitle: gameName,
                numberOfPlayers: numberOfPlayersParsed,
                winningPoints: pointsToWinParsed));
          },
          expect: [GameCreatedState(game: testGame)]);

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
              gameRepository: mockGameRepository);
        },
        act: (gameBloc) => gameBloc.add(GameEvent.gameCreated(
          gameTitle: gameName,
          numberOfPlayers: numberOfPlayers,
          pointsToWin: pointsToWin,
        )),
        expect: [
          GameErrorState(errorMessage: VALIDATION_ERROR),
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
                gameRepository: mockGameRepository);
          },
          act: (gameBloc) => gameBloc.add((GameEvent.gameCreated(
                gameTitle: gameName,
                numberOfPlayers: numberOfPlayers,
                pointsToWin: pointsToWin,
              ))),
          expect: [GameErrorState(errorMessage: VALIDATION_ERROR)]);

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
              gameRepository: mockGameRepository);
        },
        act: (gameBloc) => gameBloc.add(GameEvent.gameCreated(
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
            createGame: mockCreateGame,
            deletePlayer: mockDeletePlayer,
            endGameSooner: mockEndGameSooner,
            inputConverter: mockInputConverter,
            createPlayer: mockCreatePlayer,
            gameRepository: mockGameRepository),
        act: (gameBloc) =>
            gameBloc.add(GameEvent.gameUpdated(newGame: testGame)),
        expect: [GameUpdatedState(game: testGame)],
      );

      blocTest(
        'should emit [GameOverEvent] when [GameUpdatedEvent] is triggered with winner field different from null',
        build: () async => GameBloc(
            createGame: mockCreateGame,
            deletePlayer: mockDeletePlayer,
            endGameSooner: mockEndGameSooner,
            inputConverter: mockInputConverter,
            createPlayer: mockCreatePlayer,
            gameRepository: mockGameRepository),
        act: (gameBloc) =>
            gameBloc.add(GameEvent.gameUpdated(newGame: testGameOverGame)),
        expect: [GameOverState(player: testPlayer)],
      );

      blocTest(
        'should call createPlayer with correctly parsed arguments',
        build: () async {
          _setupMockInputConverterSuccess();
          _setupRepositorySuccessCase();
          when(mockCreatePlayer.call(any))
              .thenAnswer((_) async => Right(testGame));

          return GameBloc(
              createGame: mockCreateGame,
              deletePlayer: mockDeletePlayer,
              endGameSooner: mockEndGameSooner,
              inputConverter: mockInputConverter,
              createPlayer: mockCreatePlayer,
              gameRepository: mockGameRepository);
        },
        act: (gameBloc) => gameBloc.add((GameEvent.playerCreated(
          playerName: playerName,
          points: playerBonusPoints,
          bonusPoints: playerBonusPoints,
        ))),
        verify: (gameBloc) async => mockCreatePlayer(Params(
          playerName: playerName,
          points: playerPointsParsed,
          bonusPoints: playerBonusPointsParsed,
          currentGame: testGame,
        )),
        expect: [GameUpdatedState(game: testGame)],
      );

      blocTest(
        'should emit [GameErrorState] when the usecase validation fails',
        build: () async {
          _setupMockInputConverterSuccess();
          _setupRepositorySuccessCase();
          when(mockCreatePlayer.call(any)).thenAnswer(
              (_) async => Left(ValidationFailure(INVALID_NUMBER_PROVIDED)));

          return GameBloc(
              createGame: mockCreateGame,
              deletePlayer: mockDeletePlayer,
              endGameSooner: mockEndGameSooner,
              inputConverter: mockInputConverter,
              createPlayer: mockCreatePlayer,
              gameRepository: mockGameRepository);
        },
        act: (gameBloc) => gameBloc.add(GameEvent.playerCreated(
          playerName: playerName,
          points: playerBonusPoints,
          bonusPoints: playerBonusPoints,
        )),
        expect: [
          GameErrorState(errorMessage: INVALID_NUMBER_PROVIDED),
        ],
      );

      blocTest(
        'should emit [GameErrorState] when the player creation fails',
        build: () async {
          _setupRepositorySuccessCase();
          when(mockCreatePlayer.call(any)).thenAnswer(
              (_) async => Left(ValidationFailure(INVALID_NUMBER_PROVIDED)));
          _setupMockInputConverterSuccess();

          return GameBloc(
              createGame: mockCreateGame,
              deletePlayer: mockDeletePlayer,
              endGameSooner: mockEndGameSooner,
              inputConverter: mockInputConverter,
              createPlayer: mockCreatePlayer,
              gameRepository: mockGameRepository);
        },
        act: (gameBloc) => gameBloc.add((GameEvent.playerCreated(
          playerName: playerName,
          points: playerBonusPoints,
          bonusPoints: playerBonusPoints,
        ))),
        expect: [
          GameErrorState(errorMessage: INVALID_NUMBER_PROVIDED),
        ],
      );

      blocTest(
        'should emit [GameUpdatedEvent] when the player creation succeds',
        build: () async {
          _setupRepositorySuccessCase();
          when(mockCreatePlayer.call(any))
              .thenAnswer((_) async => Right(testGame));
          _setupMockInputConverterSuccess();

          return GameBloc(
              createGame: mockCreateGame,
              deletePlayer: mockDeletePlayer,
              endGameSooner: mockEndGameSooner,
              inputConverter: mockInputConverter,
              createPlayer: mockCreatePlayer,
              gameRepository: mockGameRepository);
        },
        act: (gameBloc) => gameBloc.add((GameEvent.playerCreated(
          playerName: playerName,
          points: playerBonusPoints,
          bonusPoints: playerBonusPoints,
        ))),
        expect: [isA<GameUpdatedState>()],
      );

      blocTest(
        'should emit [GameErrorState] when the repositry returns a [CacheFailure]',
        build: () async {
          _setupRepositoryFailureCase();
          when(mockCreatePlayer.call(any))
              .thenAnswer((_) async => Right(testGame));

          _setupMockInputConverterSuccess();

          return GameBloc(
              createGame: mockCreateGame,
              deletePlayer: mockDeletePlayer,
              endGameSooner: mockEndGameSooner,
              inputConverter: mockInputConverter,
              createPlayer: mockCreatePlayer,
              gameRepository: mockGameRepository);
        },
        act: (gameBloc) => gameBloc.add((GameEvent.playerCreated(
          playerName: playerName,
          points: playerBonusPoints,
          bonusPoints: playerBonusPoints,
        ))),
        expect: [
          GameErrorState(errorMessage: ERROR_RETREVING_LOCAL_DATA),
        ],
      );

      blocTest(
        'should emit [GameErrorState] when [DeletePlayerGameEvent] game repo result doesn\t return a valid game instance',
        build: () async {
          _setupRepositoryFailureCase();

          return GameBloc(
              createGame: mockCreateGame,
              deletePlayer: mockDeletePlayer,
              endGameSooner: mockEndGameSooner,
              inputConverter: mockInputConverter,
              createPlayer: mockCreatePlayer,
              gameRepository: mockGameRepository);
        },
        act: (gameBloc) => gameBloc.add(GameEvent.deletePlayer(
          playerToDelete: testPlayer,
        )),
        expect: [
          GameErrorState(errorMessage: ERROR_RETREVING_LOCAL_DATA),
        ],
      );

      blocTest(
        'should emit [GameErrorState] when [DeletePlayerGameEvent] delete player usecase returns a failure',
        build: () async {
          _setupRepositorySuccessCase();
          when(mockDeletePlayer.call(any))
              .thenAnswer((_) async => Left(NotImplementedFailure()));

          return GameBloc(
              createGame: mockCreateGame,
              deletePlayer: mockDeletePlayer,
              endGameSooner: mockEndGameSooner,
              inputConverter: mockInputConverter,
              createPlayer: mockCreatePlayer,
              gameRepository: mockGameRepository);
        },
        act: (gameBloc) => gameBloc.add(GameEvent.deletePlayer(
          playerToDelete: testPlayer,
        )),
        expect: [
          GameErrorState(errorMessage: ''),
        ],
      );

      blocTest(
        'should emit [GameUpdatedState] when [DeletePlayerGameEvent] delete player usecase succeds',
        build: () async {
          _setupRepositorySuccessCase();
          when(mockDeletePlayer.call(any))
              .thenAnswer((_) async => Right(testGame));

          return GameBloc(
              createGame: mockCreateGame,
              deletePlayer: mockDeletePlayer,
              endGameSooner: mockEndGameSooner,
              inputConverter: mockInputConverter,
              createPlayer: mockCreatePlayer,
              gameRepository: mockGameRepository);
        },
        act: (gameBloc) => gameBloc.add(GameEvent.deletePlayer(
          playerToDelete: testPlayer,
        )),
        expect: [
          GameUpdatedState(game: testGame),
        ],
      );

      blocTest(
        'should emit [GameOverState] when endGameSoonerUseCase result succeds',
        build: () async {
          testGame.players.add(testPlayer);

          when(mockEndGameSooner.call(any))
              .thenAnswer((_) async => Right(testPlayer));

          return GameBloc(
              createGame: mockCreateGame,
              deletePlayer: mockDeletePlayer,
              endGameSooner: mockEndGameSooner,
              inputConverter: mockInputConverter,
              createPlayer: mockCreatePlayer,
              gameRepository: mockGameRepository);
        },
        act: (gameBloc) =>
            gameBloc.add(GameEvent.endGameSooner(currentGame: testGame)),
        expect: [
          GameOverState(player: testPlayer),
        ],
      );

      blocTest(
        'should emit [GameErrorState] when endGameSoonerUseCase result fails',
        build: () async {
          testGame.players.add(testPlayer);

          when(mockEndGameSooner.call(any))
              .thenAnswer((_) async => Left(NotImplementedFailure()));

          return GameBloc(
              createGame: mockCreateGame,
              deletePlayer: mockDeletePlayer,
              endGameSooner: mockEndGameSooner,
              inputConverter: mockInputConverter,
              createPlayer: mockCreatePlayer,
              gameRepository: mockGameRepository);
        },
        act: (gameBloc) =>
            gameBloc.add(GameEvent.endGameSooner(currentGame: testGame)),
        expect: [
          GameErrorState(errorMessage: ''),
        ],
      );
    },
  );
}
