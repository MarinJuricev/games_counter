import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:game_counter/domain/repositories/game_repository.dart';
import 'package:game_counter/domain/usecases/end_game_sooner.dart';
import 'package:mockito/mockito.dart';
import '../../test_data/test_data.dart';

class MockGameRepository extends Mock implements GameRepository {}

void main() {
  MockGameRepository mockGameRepository;
  EndGameSooner endGameSooner;

  setUp(
    () {
      mockGameRepository = MockGameRepository();
      endGameSooner = EndGameSooner(repository: mockGameRepository);
    },
  );

  test(
    'should update winner field in game object with the player with most points',
    () async {
      when(mockGameRepository.getGame())
          .thenAnswer((_) async => Right(testGame));

      final actualResult = await endGameSooner(EndGameSoonerParams());

      final expectedResult = Right(testPlayer2);

      expect(actualResult, expectedResult);
    },
  );

  test(
    'should return ',
    () async {
      when(mockGameRepository.getGame())
          .thenAnswer((_) async => Right(testGame));

      final actualResult = await endGameSooner(EndGameSoonerParams());

      final expectedResult = Right(testPlayer2);

      expect(actualResult, expectedResult);
    },
  );
}
