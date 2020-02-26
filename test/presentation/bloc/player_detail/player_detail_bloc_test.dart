import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:game_counter/domain/repositories/game_repository.dart';
import 'package:game_counter/presentation/bloc/player_detail/player_detail_bloc.dart';
import 'package:mockito/mockito.dart';

class MockGameRepository extends Mock implements GameRepository {}

void main() {
  MockGameRepository mockGameRepository;

  setUp(
    () {
      mockGameRepository = MockGameRepository();
    },
  );

  blocTest(
    'initialState should be [PlayerDetailInitialState] ',
    build: () => PlayerDetailBloc(gameRepository: mockGameRepository),
    expect: [PlayerDetailInitialState()],
  );
}
