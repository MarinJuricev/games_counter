import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:game_counter/core/constants/budget_constants.dart';
import 'package:game_counter/core/error/failure.dart';
import 'package:game_counter/domain/entities/game.dart';
import 'package:game_counter/domain/entities/player.dart';
import 'package:game_counter/domain/repositories/game_repository.dart';
import 'package:game_counter/domain/usecases/reset_player.dart';
import 'package:game_counter/domain/usecases/update_game.dart';
import 'package:game_counter/presentation/feature/core/game_bloc.dart';
import 'package:game_counter/presentation/feature/player_detail/bloc/player_detail_bloc.dart';
import 'package:mockito/mockito.dart';

import '../../../test_data/test_data.dart';

class MockGameRepository extends Mock implements GameRepository {}

class MockGameBloc extends MockBloc<GameEvent, GameState> implements GameBloc {}

class MockUpdateGame extends Mock implements UpdateGame {}

class MockResetPlayer extends Mock implements ResetPlayer {}

void main() {
  MockGameRepository mockGameRepository;
  MockGameBloc mockGameBloc;
  MockUpdateGame mockUpdateGame;
  MockResetPlayer mockResetPlayer;

  int newMainPoints = 15;
  int newBonusPoints = 10;
  Player currentPlayer = Player(
    name: TEST_PLAYER_1_NAME,
    points: 0,
    bonusPoints: 0,
  );

  final testGameWithPlayer0Points = Game(
    name: TEST_GAME_NAME_1,
    pointsToWin: TEST_POINTS_TO_WIN_PARSED_1,
    numberOfPlayers: TEST_NUMBER_OF_PLAYERS_PARSED_1,
    players: [currentPlayer],
    createdAt: TEST_CREATED_AT_1,
    winner: TEST_PLAYER_1_NAME
  );

  setUp(
    () {
      mockGameRepository = MockGameRepository();
      mockGameBloc = MockGameBloc();
      mockUpdateGame = MockUpdateGame();
      mockResetPlayer = MockResetPlayer();
    },
  );

  tearDown(() {
    mockGameBloc.close();
  });

  group(
    'DetailBlocEvents',
    () {
      void _setupRepositoryFailureCase() {
        when(mockGameRepository.getGame()).thenAnswer(
            (_) async => Left(CacheFailure(ERROR_RETREVING_LOCAL_DATA)));
      }

      void _setupRepositorySuccessCase() {
        when(mockGameRepository.getGame())
            .thenAnswer((_) async => Right(testGame));
      }

      void _setupUpdateGameFailureCase() {
        when(mockUpdateGame.call(any)).thenAnswer(
            (_) async => Left(UpdateGameFailure(UPDATE_GAME_ERROR)));
      }

      void _setupUpdateGameSuccessCase() {
        when(mockUpdateGame.call(any)).thenAnswer((_) async => Right(testGame));
      }

      void _setupResetPlayerFailureCase() {
        when(mockResetPlayer.call(any)).thenAnswer(
            (_) async => Left(UpdateGameFailure(UPDATE_GAME_ERROR)));
      }

      void _setupResetPlayerSuccessCase() {
        when(mockResetPlayer.call(any))
            .thenAnswer((_) async => Right(testGameWithPlayer0Points));
      }

      blocTest('initialState should be [PlayerDetailInitialState]',
          build: () async => PlayerDetailBloc(
                gameRepository: mockGameRepository,
                gameBloc: mockGameBloc,
                updateGame: mockUpdateGame,
                resetPlayer: mockResetPlayer,
              ));

      blocTest(
        'should emit [PlayerDetailErrorState] when game repository returns a failure',
        build: () async {
          _setupRepositoryFailureCase();

          return PlayerDetailBloc(
            gameRepository: mockGameRepository,
            gameBloc: mockGameBloc,
            updateGame: mockUpdateGame,
            resetPlayer: mockResetPlayer,
          );
        },
        act: (playerDetailBloc) =>
            playerDetailBloc.add(PlayerDetailEvent.saveClicked(
          currentPlayer: currentPlayer,
          newMainPoints: newMainPoints,
          newBonusPoints: newBonusPoints,
        )),
        expect: [
          PlayerDetailState.errorState(errorMessage: ERROR_RETREVING_LOCAL_DATA)
        ],
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
            resetPlayer: mockResetPlayer,
          );
        },
        act: (playerDetailBloc) =>
            playerDetailBloc.add(PlayerDetailEvent.saveClicked(
          currentPlayer: currentPlayer,
          newMainPoints: newMainPoints,
          newBonusPoints: newBonusPoints,
        )),
        expect: [PlayerDetailState.errorState(errorMessage: UPDATE_GAME_ERROR)],
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
            resetPlayer: mockResetPlayer,
          );
        },
        act: (playerDetailBloc) =>
            playerDetailBloc.add(PlayerDetailEvent.saveClicked(
          currentPlayer: testPlayer1,
          newMainPoints: newMainPoints,
          newBonusPoints: newBonusPoints,
        )),
        verify: (playerDetailBloc) async {
          mockGameBloc.add(GameEvent.gameUpdated(newGame: testGame));
        },
        expect: [PlayerDetailState.updatedState(player: currentPlayer)],
      );

      blocTest(
        'should emit [PlayerDetailErrorState] when game repository returns a failure in playerDetailResetClicked event',
        build: () async {
          _setupRepositoryFailureCase();

          return PlayerDetailBloc(
            gameRepository: mockGameRepository,
            gameBloc: mockGameBloc,
            updateGame: mockUpdateGame,
            resetPlayer: mockResetPlayer,
          );
        },
        act: (playerDetailBloc) => playerDetailBloc
            .add(PlayerDetailEvent.resetClicked(currentPlayer: currentPlayer)),
        verify: (playerDetailBloc) async {
          mockGameRepository.getGame();
        },
        expect: [
          PlayerDetailState.errorState(errorMessage: ERROR_RETREVING_LOCAL_DATA)
        ],
      );

      blocTest(
        'should emit [PlayerDetailErrorState] when [ResetPlayer] usecase is a failure',
        build: () async {
          _setupRepositorySuccessCase();
          _setupResetPlayerFailureCase();

          return PlayerDetailBloc(
            gameRepository: mockGameRepository,
            gameBloc: mockGameBloc,
            updateGame: mockUpdateGame,
            resetPlayer: mockResetPlayer,
          );
        },
        act: (playerDetailBloc) => playerDetailBloc
            .add(PlayerDetailEvent.resetClicked(currentPlayer: currentPlayer)),
        verify: (playerDetailBloc) async {
          mockGameRepository.getGame();
          mockResetPlayer(ResetPlayerParams(
              currentGame: testGame, currentPlayer: currentPlayer));
        },
        expect: [PlayerDetailState.errorState(errorMessage: UPDATE_GAME_ERROR)],
      );

      blocTest(
        'should emit [PlayerDetailUpdatedState] when [ResetPlayer] usecase is a success',
        build: () async {
          _setupRepositorySuccessCase();
          _setupResetPlayerSuccessCase();

          return PlayerDetailBloc(
            gameRepository: mockGameRepository,
            gameBloc: mockGameBloc,
            updateGame: mockUpdateGame,
            resetPlayer: mockResetPlayer,
          );
        },
        act: (playerDetailBloc) => playerDetailBloc
            .add(PlayerDetailEvent.resetClicked(currentPlayer: currentPlayer)),
        verify: (playerDetailBloc) async {
          mockGameRepository.getGame();
          mockResetPlayer(ResetPlayerParams(
              currentGame: testGame, currentPlayer: currentPlayer));
        },
        expect: [PlayerDetailState.updatedState(player: currentPlayer)],
      );
    },
  );
}
