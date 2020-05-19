import 'package:game_counter/data/models/local_game.dart';
import 'package:game_counter/data/models/local_player.dart';
import 'package:game_counter/domain/entities/game.dart';
import 'package:game_counter/domain/entities/player.dart';

// Player
const TEST_PLAYER_1_NAME = 'TEST_PLAYER_1';
const TEST_PLAYER_1_POINTS = '0';
const TEST_PLAYER_1_BONUS_POINTS = '0';
const TEST_PLAYER_1_POINTS_PARSED = 0;
const TEST_PLAYER_1_BONUS_POINTS_PARSED = 0;

final testPlayer1 = Player(
  name: TEST_PLAYER_1_NAME,
  points: TEST_PLAYER_1_POINTS_PARSED,
  bonusPoints: TEST_PLAYER_1_BONUS_POINTS_PARSED,
);

final testLocalPlayer1 = LocalPlayer(
  name: TEST_PLAYER_1_NAME,
  points: TEST_PLAYER_1_POINTS_PARSED,
  bonusPoints: TEST_PLAYER_1_BONUS_POINTS_PARSED,
);

const TEST_PLAYER_2_NAME = 'TEST_PLAYER_2';
const TEST_PLAYER_2_POINTS = 15;
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
const TEST_GAME_NAME_1 = 'Treseta';
const TEST_POINTS_TO_WIN_1 = '41';
const TEST_NUMBER_OF_PLAYERS_1 = '4';
const TEST_BONUS_POINTS_1 = '0';
const TEST_POINTS_TO_WIN_PARSED_1 = 41;
const TEST_NUMBER_OF_PLAYERS_PARSED_1 = 4;
const TEST_BONUS_POINTS_PARSED_1 = 0;
const TEST_CREATED_AT_1 = '15/12/2020';

const TEST_GAME_NAME_2 = 'MauMau';
const TEST_POINTS_TO_WIN_2 = '41';
const TEST_NUMBER_OF_PLAYERS_2 = '4';
const TEST_BONUS_POINTS_2 = '0';
const TEST_POINTS_TO_WIN_PARSED_2 = 41;
const TEST_NUMBER_OF_PLAYERS_PARSED_2 = 4;
const TEST_BONUS_POINTS_PARSED_2 = 0;
const TEST_CREATED_AT_2 = '15/12/2020';

final testGame = Game(
  name: TEST_GAME_NAME_1,
  bonusPoints: TEST_BONUS_POINTS_PARSED_1,
  createdAt: TEST_CREATED_AT_1,
  numberOfPlayers: TEST_NUMBER_OF_PLAYERS_PARSED_1,
  pointsToWin: TEST_POINTS_TO_WIN_PARSED_1,
  winner: TEST_PLAYER_1_NAME,
  players: [testPlayer1, testPlayer2],
);

final testLocalGame = LocalGame(
  name: TEST_GAME_NAME_1,
  bonusPoints: TEST_BONUS_POINTS_PARSED_1,
  createdAt: TEST_CREATED_AT_1,
  numberOfPlayers: TEST_NUMBER_OF_PLAYERS_PARSED_1,
  pointsToWin: TEST_POINTS_TO_WIN_PARSED_1,
  winner: TEST_PLAYER_1_NAME,
  players: [testLocalPlayer1, testLocalPlayer2],
);

final testGame2 = Game(
  name: TEST_GAME_NAME_2,
  bonusPoints: TEST_BONUS_POINTS_PARSED_2,
  createdAt: TEST_CREATED_AT_2,
  numberOfPlayers: TEST_NUMBER_OF_PLAYERS_PARSED_2,
  pointsToWin: TEST_POINTS_TO_WIN_PARSED_2,
  winner: TEST_PLAYER_2_NAME,
  players: [testPlayer1, testPlayer2],
);

final testLocalGame2 = LocalGame(
  name: TEST_GAME_NAME_2,
  bonusPoints: TEST_BONUS_POINTS_PARSED_2,
  createdAt: TEST_CREATED_AT_2,
  numberOfPlayers: TEST_NUMBER_OF_PLAYERS_PARSED_2,
  pointsToWin: TEST_POINTS_TO_WIN_PARSED_2,
  winner: TEST_PLAYER_2_NAME,
  players: [testLocalPlayer1, testLocalPlayer2],
);
