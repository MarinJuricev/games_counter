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
  AddPlayerBloc addPlayerBloc;
  MockCreatePlayer mockCreatePlayer;
  MockInputConverter mockInputConverter;
  MockGameBloc mockGameBloc;

  setUp(
    () {
      mockCreatePlayer = MockCreatePlayer();
      mockInputConverter = MockInputConverter();
      mockGameBloc = MockGameBloc();

      addPlayerBloc = AddPlayerBloc(
        createPlayer: mockCreatePlayer,
        inputConverter: mockInputConverter,
        gameBloc: mockGameBloc,
      );
    },
  );

  void _setupGameBlocInitialState(){
      whenListen(mockGameBloc, Stream.fromIterable([GameInitialState()]));
    }

  // test('should emit [GameNotCreatedEvent] when gameBloc state is [GameInitialState]', () {
  //   whenListen(mockGameBloc, Stream.fromIterable([GameInitialState]));

  //   expectLater(addPlayerBloc.state, GameNotCreatedEvent);

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

  group('CreatePlayerEvent', () {
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
      );},
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

    test(
      'should emit [AddPlayerErrorState] when the usecase validation fails',
      () async {
        when(mockCreatePlayer.call(any))
            .thenAnswer((_) async => Left(ValidationFailure()));

        _setupMockInputConverterFail();

        final expectedState = [
          AddPlayerInitialState(),
          AddPlayerErrorState(),
        ];

        expectLater(addPlayerBloc, emitsInOrder(expectedState));

        addPlayerBloc.add(PlayerCreatedEvent(
            playerName: playerName,
            points: playerBonusPoints,
            bonusPoints: playerBonusPoints));
      },
    );

    test(
      'should emit [AddPlayerErrorState] when the player creation fails',
      () async {
        when(mockCreatePlayer.call(any))
            .thenAnswer((_) async => Left(ValidationFailure()));

        _setupMockInputConverterSuccess();

        final expectedState = [
          AddPlayerInitialState(),
          AddPlayerErrorState(),
        ];

        expectLater(addPlayerBloc, emitsInOrder(expectedState));

        addPlayerBloc.add(PlayerCreatedEvent(
            playerName: playerName,
            points: playerBonusPoints,
            bonusPoints: playerBonusPoints));
      },
    );

    test(
      'should emit [CreationFinishedState] when the player creation succeds',
      () async {
        when(mockCreatePlayer.call(any)).thenAnswer((_) async => Right(player));

        _setupMockInputConverterSuccess();

        final expectedState = [
          AddPlayerInitialState(),
          AddPlayerCreationFinishedState(player: player),
        ];

        expectLater(addPlayerBloc, emitsInOrder(expectedState));

        addPlayerBloc.add(PlayerCreatedEvent(
            playerName: playerName,
            points: playerBonusPoints,
            bonusPoints: playerBonusPoints));
      },
    );
  });

  group('InitiatePlayerCreationEvent', () {
    test(
        'should emit [PlayerCreationStartedState] when InitiatePlayerCreationEvent is called',
        () async {
      final expectedState = [
        AddPlayerInitialState(),
        AddPlayerCreationStartedState(),
      ];

      expectLater(addPlayerBloc, emitsInOrder(expectedState));

      addPlayerBloc.add(InitiatePlayerCreationEvent());
    });
  });
}
