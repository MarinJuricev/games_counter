import 'package:flutter/foundation.dart';

import 'local_persistence_provider.dart';

abstract class OnboardingLocalDataSource {
  Future<bool> getOnboardingStatus();
  Future<void> setOnboardingStatus(bool shouldSkipOnBoarding);
}

const ONBOARDING_BOX = 'ONBOARDING_BOX';

class OnboardingLocalDataSourceImpl implements OnboardingLocalDataSource {
  final LocalPersistenceProvider localPersistenceProvider;

  OnboardingLocalDataSourceImpl({@required this.localPersistenceProvider});

  @override
  Future<bool> getOnboardingStatus() async {
    final bool shouldSkipOnboarding = await localPersistenceProvider
        .getFromKeyValuePair(boxToGetDataFrom: ONBOARDING_BOX);

    // In some cases we would be able just to return 
    // Future.value(shouldSkipOnboarding != null)
    // But we can reset the onboarding status to appear on
    // app launch inside settings screen, so in those cases
    // that condition wouldn't work
    if (shouldSkipOnboarding != null)
      return Future.value(shouldSkipOnboarding);
    else
      return Future.value(false);
  }

  @override
  Future<void> setOnboardingStatus(bool shouldSkipOnboarding) async {
    await localPersistenceProvider.saveKeyValuePair(
      valueToSave: shouldSkipOnboarding,
      boxToSaveInto: ONBOARDING_BOX,
    );

    return Future<void>.value();
  }
}
