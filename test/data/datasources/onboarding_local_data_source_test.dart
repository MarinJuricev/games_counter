import 'package:flutter_test/flutter_test.dart';
import 'package:game_counter/data/datasources/local_persistence_provider.dart';
import 'package:game_counter/data/datasources/onboarding_local_data_source.dart';
import 'package:mockito/mockito.dart';

class MockLocalPersistenceProvider extends Mock
    implements LocalPersistenceProvider {}

void main() {
  MockLocalPersistenceProvider mockLocalPersistenceProvider;
  OnboardingLocalDataSource onboardingLocalDataSource;

  setUp(
    () {
      mockLocalPersistenceProvider = MockLocalPersistenceProvider();
      onboardingLocalDataSource = OnboardingLocalDataSourceImpl(
          localPersistenceProvider: mockLocalPersistenceProvider);
    },
  );
}
