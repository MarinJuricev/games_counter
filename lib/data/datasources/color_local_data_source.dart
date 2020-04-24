import 'package:game_counter/core/error/exceptions.dart';

import '../../domain/entities/app_colors.dart';
import 'package:hive/hive.dart';
import '../models/local_app_colors.dart';

abstract class ColorLocalDataSource {
  Future<AppColors> getAppColors();
  Future<void> cacheAppColors(LocalAppColors appColors);
}

const APP_THEME = 'APP_THEME';

class ColorLocalDataSourceImpl implements ColorLocalDataSource {
  final Box<dynamic> hiveBox;

  ColorLocalDataSourceImpl({this.hiveBox});

  @override
  Future<void> cacheAppColors(LocalAppColors appColors) async {
    final positionInBox = await hiveBox.add(appColors);

    if (positionInBox > 0)
      return Future<void>.value();
    else
      throw CacheException();
  }

  @override
  Future<AppColors> getAppColors() async {
    final LocalAppColors localAppColors = await hiveBox.get(APP_THEME);

    if (localAppColors != null)
      return Future.value(localAppColors.toAppColors());
    else
      throw CacheException();
  }
}
