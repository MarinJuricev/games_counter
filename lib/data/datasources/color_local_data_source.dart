import 'package:game_counter/domain/entities/app_colors.dart';

abstract class ColorLocalDataSource {
  Future<AppColors> getAppColors();
  Future<void> cacheAppColors(AppColors appColors);
}

class ColorLocalDataSourceImpl implements ColorLocalDataSource {
  @override
  Future<void> cacheAppColors(AppColors appColors) {
    return null;
  }

  @override
  Future<AppColors> getAppColors() {
    return null;
  }
}
