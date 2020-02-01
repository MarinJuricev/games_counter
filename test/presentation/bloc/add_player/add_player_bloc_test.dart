import 'package:game_counter/core/error/failure.dart';
import 'package:game_counter/core/util/input_converter.dart';
import 'package:game_counter/domain/entities/player.dart';
import 'package:game_counter/domain/usecases/create_player.dart';
import 'package:game_counter/presentation/bloc/add_player/add_player_bloc.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';

class MockCreatePlayer extends Mock implements CreatePlayer {}

class MockInputConverter extends Mock implements InputConverter {}

void main() {
  AddPlayerBloc addPlayerBloc;
  MockCreatePlayer mockCreatePlayer;
  MockInputConverter mockInputConverter;

  setUp(
    () {
      mockCreatePlayer = MockCreatePlayer();
      mockInputConverter = MockInputConverter();

      addPlayerBloc = AddPlayerBloc(
        createPlayer: mockCreatePlayer,
        inputConverter: mockInputConverter,
      );
    },
  );

  test('initialState should be AddPlayerInitialState', () {
    expect(addPlayerBloc.initialState, InitialState());
  });

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

    test('should call createPlayer with correctly parsed arguments', () {});

    test(
      'should emit [AddPlayerErrorState] when the usecase validation fails',
      () async {
        when(mockCreatePlayer.call(any))
            .thenAnswer((_) async => Left(ValidationFailure()));

        _setupMockInputConverterFail();

        final expectedState = [
          InitialState(),
          ErrorState(),
        ];

        expectLater(addPlayerBloc, emitsInOrder(expectedState));

        addPlayerBloc.add(CreatePlayerEvent(
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
          InitialState(),
          ErrorState(),
        ];

        expectLater(addPlayerBloc, emitsInOrder(expectedState));

        addPlayerBloc.add(CreatePlayerEvent(
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
          InitialState(),
          CreationFinishedState(player: player),
        ];

        expectLater(addPlayerBloc, emitsInOrder(expectedState));

        addPlayerBloc.add(CreatePlayerEvent(
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
        InitialState(),
        PlayerCreationStartedState(),
      ];

      expectLater(addPlayerBloc, emitsInOrder(expectedState));

      addPlayerBloc.add(InitiatePlayerCreationEvent());
    });
  });
}
