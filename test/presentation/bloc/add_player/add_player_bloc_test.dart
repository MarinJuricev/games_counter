import 'package:bloc_test/bloc_test.dart';
import 'package:game_counter/core/constants/budget_constants.dart';
import 'package:game_counter/core/error/failure.dart';
import 'package:game_counter/core/util/input_converter.dart';
import 'package:game_counter/domain/entities/game.dart';
import 'package:game_counter/domain/repositories/game_repository.dart';
import 'package:game_counter/domain/usecases/create_player.dart';
import 'package:game_counter/presentation/bloc/add_player/add_player_bloc.dart';
import 'package:game_counter/presentation/bloc/game/game_bloc.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';

class MockCreatePlayer extends Mock implements CreatePlayer {}

class MockInputConverter extends Mock implements InputConverter {}

class MockGameRepository extends Mock implements GameRepository {}

class MockGameBloc extends MockBloc<GameEvent, GameState> implements GameBloc {}

void main() {
  MockCreatePlayer mockCreatePlayer;
  MockGameRepository mockGameRepository;
  MockInputConverter mockInputConverter;
  MockGameBloc mockGameBloc;
  Game testGame;

  setUp(
    () {
      mockCreatePlayer = MockCreatePlayer();
      mockGameRepository = MockGameRepository();
      mockInputConverter = MockInputConverter();
      mockGameBloc = MockGameBloc();
      testGame = Game(
        name: 'gameName',
        pointsToWin: 41,
        numberOfPlayers: 4,
        bonusPoints: 0,
        players: [],
        winner: 'noWinner',
      );
    },
  );

  void _setupGameBlocInitialState() {
    whenListen(mockGameBloc, Stream.fromIterable([GameInitialState()]));
  }

  void _setupGameBlocCreatedState() {
    whenListen(
        mockGameBloc, Stream.fromIterable([GameCreatedState(game: testGame)]));
  }

  void _setupRepositorySuccessCase() {
    when(mockGameRepository.getGame()).thenAnswer((_) async => Right(testGame));
  }

  void _setupRepositoryFailureCase() {
    when(mockGameRepository.getGame()).thenAnswer(
        (_) async => Left(CacheFailure(ERROR_RETREVING_LOCAL_DATA)));
  }

  blocTest(
    'should emit [AddPlayerGameNotCreatedState] when gameBloc state is [GameInitialState]',
    build: () async {
      _setupGameBlocInitialState();

      return AddPlayerBloc(
        createPlayer: mockCreatePlayer,
        inputConverter: mockInputConverter,
        gameBloc: mockGameBloc,
        gameRepository: mockGameRepository,
      );
    },
    expect: [AddPlayerGameNotCreatedState()],
  );

  blocTest(
    'should emit [AddPlayerGameCreatedState] when gameBloc state is [GameCreatedState]',
    build: () async {
      _setupGameBlocCreatedState();

      return AddPlayerBloc(
        createPlayer: mockCreatePlayer,
        inputConverter: mockInputConverter,
        gameBloc: mockGameBloc,
        gameRepository: mockGameRepository,
      );
    },
    expect: [
      isA<AddPlayerGameCreatedState>(),
    ],
  );

  blocTest(
    'initialState should be AddPlayerInitialState',
    build: () async {
      _setupGameBlocInitialState();

      return AddPlayerBloc(
        createPlayer: mockCreatePlayer,
        inputConverter: mockInputConverter,
        gameBloc: mockGameBloc,
        gameRepository: mockGameRepository,
      );
    },
    expect: [
      AddPlayerGameNotCreatedState(),
    ],
  );

  final playerName = 'validName';
  final playerPoints = '0';
  final playerBonusPoints = '0';
  final playerPointsParsed = 0;
  final playerBonusPointsParsed = 0;

  group(
    'CreatePlayerEvent',
    () {
      void _setupMockInputConverterSuccess() {
        when(mockInputConverter.stringToUnsignedInteger(playerPoints))
            .thenReturn(Right(playerPointsParsed));

        when(mockInputConverter.stringToUnsignedInteger(playerBonusPoints))
            .thenReturn(Right(playerBonusPointsParsed));
      }

      void _setupMockInputConverterFail() {
        when(mockInputConverter.stringToUnsignedInteger(playerPoints))
            .thenReturn(Left(ValidationFailure(INVALID_NUMBER_PROVIDED)));

        when(mockInputConverter.stringToUnsignedInteger(playerBonusPoints))
            .thenReturn(Left(ValidationFailure(INVALID_NUMBER_PROVIDED)));
      }

      blocTest(
        'should call createPlayer with correctly parsed arguments',
        build: () async {
          _setupGameBlocInitialState();

          return AddPlayerBloc(
            createPlayer: mockCreatePlayer,
            inputConverter: mockInputConverter,
            gameBloc: mockGameBloc,
            gameRepository: mockGameRepository,
          );
        },
        act: (addPlayerBloc) => addPlayerBloc.add((PlayerCreated(
          playerName: playerName,
          points: playerBonusPoints,
          bonusPoints: playerBonusPoints,
        ))),
        verify: (adPlayerBloc) async {
          mockCreatePlayer(Params(
            playerName: playerName,
            points: playerPointsParsed,
            bonusPoints: playerBonusPointsParsed,
            currentGame: testGame,
          ));
        },
        expect: [
          AddPlayerGameNotCreatedState(),
        ],
      );

      blocTest(
        'should emit [AddPlayerErrorState] when the usecase validation fails',
        build: () async {
          _setupGameBlocInitialState();
          _setupMockInputConverterFail();
          when(mockCreatePlayer.call(any)).thenAnswer(
              (_) async => Left(ValidationFailure(INVALID_NUMBER_PROVIDED)));

          return AddPlayerBloc(
            createPlayer: mockCreatePlayer,
            inputConverter: mockInputConverter,
            gameBloc: mockGameBloc,
            gameRepository: mockGameRepository,
          );
        },
        act: (addPlayerBloc) => addPlayerBloc.add(PlayerCreated(
          playerName: playerName,
          points: playerBonusPoints,
          bonusPoints: playerBonusPoints,
        )),
        expect: [
          AddPlayerGameNotCreatedState(),
          AddPlayerErrorState(errorMessage: INVALID_NUMBER_PROVIDED),
        ],
      );

      blocTest(
        'should emit [AddPlayerErrorState] when the player creation fails',
        build: () async {
          _setupGameBlocCreatedState();
          _setupRepositorySuccessCase();
          when(mockCreatePlayer.call(any)).thenAnswer(
              (_) async => Left(ValidationFailure(INVALID_NUMBER_PROVIDED)));
          _setupMockInputConverterSuccess();

          return AddPlayerBloc(
            createPlayer: mockCreatePlayer,
            inputConverter: mockInputConverter,
            gameBloc: mockGameBloc,
            gameRepository: mockGameRepository,
          );
        },
        act: (addPlayerBloc) => addPlayerBloc.add(PlayerCreated(
            playerName: playerName,
            points: playerBonusPoints,
            bonusPoints: playerBonusPoints)),
        expect: [
          isA<AddPlayerGameCreatedState>(),
          AddPlayerErrorState(errorMessage: INVALID_NUMBER_PROVIDED),
        ],
      );

      blocTest(
        'should emit [CreationFinishedState] when the player creation succeds',
        build: () async {
          _setupGameBlocCreatedState();
          _setupRepositorySuccessCase();
          when(mockCreatePlayer.call(any))
              .thenAnswer((_) async => Right(testGame));
          _setupMockInputConverterSuccess();

          return AddPlayerBloc(
            createPlayer: mockCreatePlayer,
            inputConverter: mockInputConverter,
            gameBloc: mockGameBloc,
            gameRepository: mockGameRepository,
          );
        },
        act: (addPlayerBloc) => addPlayerBloc.add(PlayerCreated(
            playerName: playerName,
            points: playerBonusPoints,
            bonusPoints: playerBonusPoints)),
        expect: [
          isA<AddPlayerGameCreatedState>(),
          isA<AddPlayerCreationFinishedState>(),
        ],
      );

      blocTest(
        'should emit [AddPlayerErrorState] when the repositry returns a [CacheFailure]',
        build: () async {
          _setupGameBlocCreatedState();
          _setupRepositoryFailureCase();
          when(mockCreatePlayer.call(any))
              .thenAnswer((_) async => Right(testGame));

          _setupMockInputConverterSuccess();

          return AddPlayerBloc(
            createPlayer: mockCreatePlayer,
            inputConverter: mockInputConverter,
            gameBloc: mockGameBloc,
            gameRepository: mockGameRepository,
          );
        },
        act: (addPlayerBloc) => addPlayerBloc.add(PlayerCreated(
            playerName: playerName,
            points: playerBonusPoints,
            bonusPoints: playerBonusPoints)),
        expect: [
          isA<AddPlayerGameCreatedState>(),
          AddPlayerErrorState(errorMessage: ERROR_RETREVING_LOCAL_DATA),
        ],
      );
    },
  );

  group(
    'InitiatePlayerCreationEvent',
    () {
      blocTest(
        'should emit [PlayerCreationStartedState] when InitiatePlayerCreationEvent is called',
        build: () async {
          _setupGameBlocInitialState();

          return AddPlayerBloc(
            createPlayer: mockCreatePlayer,
            inputConverter: mockInputConverter,
            gameBloc: mockGameBloc,
            gameRepository: mockGameRepository,
          );
        },
        act: (addPlayerBloc) =>
            addPlayerBloc.add(InitiatePlayerCreationEvent()),
        expect: [
          AddPlayerGameNotCreatedState(),

          AddPlayerCreationStartedState(),
        ],
      );
    },
  );
}
