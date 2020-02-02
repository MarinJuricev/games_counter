import 'package:bloc_test/bloc_test.dart';
import 'package:game_counter/core/error/failure.dart';
import 'package:game_counter/core/util/input_converter.dart';
import 'package:game_counter/domain/entities/player.dart';
import 'package:game_counter/domain/usecases/create_player.dart';
import 'package:game_counter/presentation/bloc/add_player/add_player_bloc.dart';
import 'package:game_counter/presentation/bloc/game/game_bloc.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';

class MockCreatePlayer extends Mock implements CreatePlayer {}

class MockInputConverter extends Mock implements InputConverter {}

class MockGameBloc extends MockBloc<GameEvent, GameState> implements GameBloc {}

void main() {
  MockCreatePlayer mockCreatePlayer;
  MockInputConverter mockInputConverter;
  MockGameBloc mockGameBloc;

  setUp(
    () {
      mockCreatePlayer = MockCreatePlayer();
      mockInputConverter = MockInputConverter();
      mockGameBloc = MockGameBloc();
    },
  );

  void _setupGameBlocInitialState() {
    whenListen(mockGameBloc, Stream.fromIterable([GameInitialState()]));
  }

  // test('should emit [GameNotCreatedEvent] when gameBloc state is [GameInitialState]', () {
  //   _setupGameBlocInitialState();

  //   expectLater(addPlayerBloc, emitsInOrder([AddPlayerInitialState(), GameNotCreatedEvent()]));
  // });

  blocTest(
    'initialState should be AddPlayerInitialState',
    build: () {
      _setupGameBlocInitialState();

      return AddPlayerBloc(
        createPlayer: mockCreatePlayer,
        inputConverter: mockInputConverter,
        gameBloc: mockGameBloc,
      );
    },
    expect: [AddPlayerInitialState()],
  );

  final playerName = 'validName';
  final playerPoints = '0';
  final playerBonusPoints = '0';
  final playerPointsParsed = 0;
  final playerBonusPointsParsed = 0;
  final player = Player(
    name: playerPoints,
    points: playerPointsParsed,
    bonusPoints: playerPointsParsed,
  );

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
            .thenReturn(Left(ValidationFailure()));

        when(mockInputConverter.stringToUnsignedInteger(playerBonusPoints))
            .thenReturn(Left(ValidationFailure()));
      }

      blocTest(
        'should call createPlayer with correctly parsed arguments',
        build: () {
          _setupGameBlocInitialState();

          return AddPlayerBloc(
            createPlayer: mockCreatePlayer,
            inputConverter: mockInputConverter,
            gameBloc: mockGameBloc,
          );
        },
        act: (addPlayerBloc) => addPlayerBloc.add((PlayerCreatedEvent(
            playerName: playerName,
            points: playerBonusPoints,
            bonusPoints: playerBonusPoints))),
        verify: () => (mockCreatePlayer(Params(
          playerName: playerName,
          points: playerPointsParsed,
          bonusPoints: playerBonusPointsParsed,
        ))),
        expect: [AddPlayerInitialState()],
      );

      // test('should call createPlayer with correctly parsed arguments', () {});

      blocTest(
        'should emit [AddPlayerErrorState] when the usecase validation fails',
        build: () {
          _setupGameBlocInitialState();
          _setupMockInputConverterFail();
          when(mockCreatePlayer.call(any))
              .thenAnswer((_) async => Left(ValidationFailure()));

          return AddPlayerBloc(
            createPlayer: mockCreatePlayer,
            inputConverter: mockInputConverter,
            gameBloc: mockGameBloc,
          );
        },
        act: (addPlayerBloc) => addPlayerBloc.add(PlayerCreatedEvent(
          playerName: playerName,
          points: playerBonusPoints,
          bonusPoints: playerBonusPoints,
        )),
        expect: [
          AddPlayerInitialState(),
          AddPlayerErrorState(),
        ],
      );

      blocTest(
        'should emit [AddPlayerErrorState] when the player creation fails',
        build: () {
          _setupGameBlocInitialState();
          when(mockCreatePlayer.call(any))
              .thenAnswer((_) async => Left(ValidationFailure()));
          _setupMockInputConverterSuccess();

          return AddPlayerBloc(
            createPlayer: mockCreatePlayer,
            inputConverter: mockInputConverter,
            gameBloc: mockGameBloc,
          );
        },
        act: (addPlayerBloc) => addPlayerBloc.add(PlayerCreatedEvent(
            playerName: playerName,
            points: playerBonusPoints,
            bonusPoints: playerBonusPoints)),
        expect: [
          AddPlayerInitialState(),
          AddPlayerErrorState(),
        ],
      );

      blocTest(
        'should emit [CreationFinishedState] when the player creation succeds',
        build: () {
          _setupGameBlocInitialState();
          when(mockCreatePlayer.call(any))
              .thenAnswer((_) async => Right(player));
          _setupMockInputConverterSuccess();

          return AddPlayerBloc(
            createPlayer: mockCreatePlayer,
            inputConverter: mockInputConverter,
            gameBloc: mockGameBloc,
          );
        },
        act: (addPlayerBloc) => addPlayerBloc.add(PlayerCreatedEvent(
            playerName: playerName,
            points: playerBonusPoints,
            bonusPoints: playerBonusPoints)),
        expect: [
          AddPlayerInitialState(),
          AddPlayerCreationFinishedState(player: player),
        ],
      );
    },
  );

  group(
    'InitiatePlayerCreationEvent',
    () {
      blocTest(
        'should emit [PlayerCreationStartedState] when InitiatePlayerCreationEvent is called',
        build: () {
          _setupGameBlocInitialState();

          return AddPlayerBloc(
            createPlayer: mockCreatePlayer,
            inputConverter: mockInputConverter,
            gameBloc: mockGameBloc,
          );
        },
        act: (addPlayerBloc) =>
            addPlayerBloc.add(InitiatePlayerCreationEvent()),
        expect: [
          AddPlayerInitialState(),
          AddPlayerCreationStartedState(),
        ],
      );
    },
  );
}
