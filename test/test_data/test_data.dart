import 'package:game_counter/data/models/local_game.dart';
import 'package:game_counter/data/models/local_player.dart';
import 'package:game_counter/domain/entities/game.dart';
import 'package:game_counter/domain/entities/player.dart';

// Player
const TEST_PLAYER_1_NAME = 'TEST_PLAYER_1';
const TEST_PLAYER_1_POINTS = 0;
const TEST_PLAYER_1_BONUS_POINTS = 0;

final testPlayer1 = Player(
  name: TEST_PLAYER_1_NAME,
  points: TEST_PLAYER_1_POINTS,
  bonusPoints: TEST_PLAYER_1_BONUS_POINTS,
);

final testLocalPlayer1 = LocalPlayer(
  name: TEST_PLAYER_1_NAME,
  points: TEST_PLAYER_1_POINTS,
  bonusPoints: TEST_PLAYER_1_BONUS_POINTS,
);

const TEST_PLAYER_2_NAME = 'TEST_PLAYER_2';
const TEST_PLAYER_2_POINTS = 0;
const TEST_PLAYER_2_BONUS_POINTS = 0;

final testPlayer2 = Player(
  name: TEST_PLAYER_2_NAME,
  points: TEST_PLAYER_2_POINTS,
  bonusPoints: TEST_PLAYER_2_BONUS_POINTS,
);

final testLocalPlayer2 = LocalPlayer(
  name: TEST_PLAYER_2_NAME,
  points: TEST_PLAYER_2_POINTS,
  bonusPoints: TEST_PLAYER_2_BONUS_POINTS,
);

// Game
const TEST_GAME_NAME = 'Treseta';
const TEST_POINTS_TO_WIN = '41';
const TEST_NUMBER_OF_PLAYERS = '4';
const TEST_BONUS_POINTS = '0';
const TEST_POINTS_TO_WIN_PARSED = 41;
const TEST_NUMBER_OF_PLAYERS_PARSED = 4;
const TEST_BONUS_POINTS_PARSED = 0;
const TEST_CREATED_AT = '15/12/2020';
const TEST_GAME_WINNER = 'GameWinner';

final testGame = Game(
  name: TEST_GAME_NAME,
  bonusPoints: TEST_BONUS_POINTS_PARSED,
  createdAt: TEST_CREATED_AT,
  numberOfPlayers: TEST_NUMBER_OF_PLAYERS_PARSED,
  pointsToWin: TEST_POINTS_TO_WIN_PARSED,
  winner: TEST_GAME_WINNER,
  players: [testPlayer1, testPlayer2],
);

final testLocalGame = LocalGame(
  name: TEST_GAME_NAME,
  bonusPoints: TEST_BONUS_POINTS_PARSED,
  createdAt: TEST_CREATED_AT,
  numberOfPlayers: TEST_NUMBER_OF_PLAYERS_PARSED,
  pointsToWin: TEST_POINTS_TO_WIN_PARSED,
  winner: TEST_GAME_WINNER,
  players: [testLocalPlayer1, testLocalPlayer2],
);
