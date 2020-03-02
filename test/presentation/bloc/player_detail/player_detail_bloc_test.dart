import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:game_counter/core/constants/budget_constants.dart';
import 'package:game_counter/core/error/failure.dart';
import 'package:game_counter/domain/entities/game.dart';
import 'package:game_counter/domain/entities/player.dart';
import 'package:game_counter/domain/repositories/game_repository.dart';
import 'package:game_counter/domain/usecases/update_game.dart';
import 'package:game_counter/presentation/bloc/game/game_bloc.dart';
import 'package:game_counter/presentation/bloc/player_detail/player_detail_bloc.dart';
import 'package:mockito/mockito.dart';

class MockGameRepository extends Mock implements GameRepository {}

class MockGameBloc extends MockBloc<GameEvent, GameState> implements GameBloc {}

class MockUpdateGame extends Mock implements UpdateGame {}

void main() {
  MockGameRepository mockGameRepository;
  MockGameBloc mockGameBloc;
  MockUpdateGame mockUpdateGame;

  int newMainPoints = 15;
  int newBonusPoints = 10;
  Player currentPlayer = Player(
    name: 'Test',
    points: 0,
    bonusPoints: 0,
  );
  Player updatedPlayer = Player(
    name: 'Test',
    points: newMainPoints,
    bonusPoints: newBonusPoints,
  );

  final gameName = 'Treseta';
  final pointsToWinParsed = 41;
  final numberOfPlayersParsed = 4;
  final testGame = Game(
    name: gameName,
    pointsToWin: pointsToWinParsed,
    numberOfPlayers: numberOfPlayersParsed,
    players: [updatedPlayer],
  );

  setUp(
    () {
      mockGameRepository = MockGameRepository();
      mockGameBloc = MockGameBloc();
      mockUpdateGame = MockUpdateGame();
    },
  );

  void _setupRepositoryFailureCase() {
    when(mockGameRepository.getGame()).thenAnswer(
        (_) async => Left(CacheFailure(ERROR_RETREVING_LOCAL_DATA)));
  }

  void _setupRepositorySuccessCase() {
    when(mockGameRepository.getGame()).thenAnswer((_) async => Right(testGame));
  }

  void _setupUpdateGameFailureCase() {
    when(mockUpdateGame.call(any))
        .thenAnswer((_) async => Left(UpdateGameFailure(UPDATE_GAME_ERROR)));
  }

  void _setupUpdateGameSuccessCase() {
    when(mockUpdateGame.call(any)).thenAnswer((_) async => Right(testGame));
  }

  blocTest('initialState should be [PlayerDetailInitialState]',
      build: () async => PlayerDetailBloc(
            gameRepository: mockGameRepository,
            gameBloc: mockGameBloc,
            updateGame: mockUpdateGame,
          ));

  blocTest(
    'should emit [PlayerDetailErrorState] when game repository returns a failure',
    build: () async {
      _setupRepositoryFailureCase();

      return PlayerDetailBloc(
        gameRepository: mockGameRepository,
        gameBloc: mockGameBloc,
        updateGame: mockUpdateGame,
      );
    },
    act: (playerDetailBloc) =>
        playerDetailBloc.add(PlayerDetailSaveClickedEvent(
      currentPlayer: currentPlayer,
      newMainPoints: newMainPoints,
      newBonusPoints: newBonusPoints,
    )),
    expect: [PlayerDetailErrorState(errorMessage: ERROR_RETREVING_LOCAL_DATA)],
  );

  blocTest(
    'should emit [PlayerDetailErrorState] when updateGame usecase is a failure',
    build: () async {
      _setupRepositorySuccessCase();
      _setupUpdateGameFailureCase();

      return PlayerDetailBloc(
        gameRepository: mockGameRepository,
        gameBloc: mockGameBloc,
        updateGame: mockUpdateGame,
      );
    },
    act: (playerDetailBloc) =>
        playerDetailBloc.add(PlayerDetailSaveClickedEvent(
      currentPlayer: currentPlayer,
      newMainPoints: newMainPoints,
      newBonusPoints: newBonusPoints,
    )),
    expect: [PlayerDetailErrorState(errorMessage: UPDATE_GAME_ERROR)],
  );

  blocTest(
    'should emit [PlayerDetailUpdatedState] when updateGame usecase is a success',
    build: () async {
      _setupRepositorySuccessCase();
      _setupUpdateGameSuccessCase();

      return PlayerDetailBloc(
        gameRepository: mockGameRepository,
        gameBloc: mockGameBloc,
        updateGame: mockUpdateGame,
      );
    },
    act: (playerDetailBloc) =>
        playerDetailBloc.add(PlayerDetailSaveClickedEvent(
      currentPlayer: currentPlayer,
      newMainPoints: newMainPoints,
      newBonusPoints: newBonusPoints,
    )),
    verify: (playerDetailBloc) async {
      mockGameBloc.add(GameUpdatedEvent(newGame: testGame));
    },
    expect: [
      PlayerDetailUpdatedState(player: updatedPlayer)
    ],
  );
}
