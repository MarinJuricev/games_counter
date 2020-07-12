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

  group(
    'getOnboardingStatus',
    () {
      test(
        'should return value from localPersistenceProvider when the data is not null',
        () async {
          when(mockLocalPersistenceProvider.getFromKeyValuePair(
                  boxToGetDataFrom: ONBOARDING_BOX))
              .thenAnswer((_) async => true);

          final actualResult =
              await onboardingLocalDataSource.getOnboardingStatus();
          final expectedResult = true;

          expect(actualResult, expectedResult);

          verify(mockLocalPersistenceProvider.getFromKeyValuePair(
                  boxToGetDataFrom: ONBOARDING_BOX))
              .called(1);
        },
      );

      test(
        'should return false when localPersistenceProvider returns null',
        () async {
          when(mockLocalPersistenceProvider.getFromKeyValuePair(
                  boxToGetDataFrom: ONBOARDING_BOX))
              .thenAnswer((_) async => null);

          final actualResult =
              await onboardingLocalDataSource.getOnboardingStatus();
          final expectedResult = false;

          expect(actualResult, expectedResult);

          verify(mockLocalPersistenceProvider.getFromKeyValuePair(
                  boxToGetDataFrom: ONBOARDING_BOX))
              .called(1);
        },
      );

      test(
        'should return false when localPersistenceProvider returns false',
        () async {
          when(mockLocalPersistenceProvider.getFromKeyValuePair(
                  boxToGetDataFrom: ONBOARDING_BOX))
              .thenAnswer((_) async => false);

          final actualResult =
              await onboardingLocalDataSource.getOnboardingStatus();
          final expectedResult = false;

          expect(actualResult, expectedResult);

          verify(mockLocalPersistenceProvider.getFromKeyValuePair(
                  boxToGetDataFrom: ONBOARDING_BOX))
              .called(1);
        },
      );
    },
  );

  group(
    'setOnboardingStatus',
    () {
      test(
          'should trigger localPersistenceProvider saveKetValuePair with provided argument',
          () async {
        when(mockLocalPersistenceProvider.saveKeyValuePair(
                valueToSave: true, boxToSaveInto: ONBOARDING_BOX))
            .thenAnswer((_) async => null);

        await onboardingLocalDataSource.setOnboardingStatus(true);

        verify(mockLocalPersistenceProvider.saveKeyValuePair(
                valueToSave: true, boxToSaveInto: ONBOARDING_BOX))
            .called(1);
      });
    },
  );
}
