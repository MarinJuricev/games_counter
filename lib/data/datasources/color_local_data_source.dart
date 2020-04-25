import 'package:meta/meta.dart';

import '../../core/error/exceptions.dart';
import '../../domain/entities/app_colors.dart';
import '../models/local_app_colors.dart';
import 'local_persistence_provider.dart';

abstract class ColorLocalDataSource {
  Future<AppColors> getAppColors();
  Future<void> cacheAppColors(LocalAppColors appColors);
}

const APP_THEME_BOX = 'APP_THEME_BOX';

class ColorLocalDataSourceImpl implements ColorLocalDataSource {
  final LocalPersistenceProvider localPersistenceProvider;

  ColorLocalDataSourceImpl({@required this.localPersistenceProvider});

  @override
  Future<AppColors> getAppColors() async {
    final LocalAppColors localAppColors = await localPersistenceProvider
        .getFromPersistence(boxToGetDataFrom: APP_THEME_BOX);

    if (localAppColors != null)
      return Future.value(localAppColors.toAppColors());
    else
      throw CacheException();
  }

  @override
  Future<void> cacheAppColors(LocalAppColors appColors) async {
    final positionInBox = await localPersistenceProvider.saveIntoPersistence(
      boxToSaveInto: APP_THEME_BOX,
      valueToSave: appColors,
    );

    if (positionInBox > 0)
      return Future<void>.value();
    else
      throw CacheException();
  }
}
