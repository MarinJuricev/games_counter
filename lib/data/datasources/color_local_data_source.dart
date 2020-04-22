import '../../domain/entities/app_colors.dart';
import 'package:hive/hive.dart';
import '../models/local_app_colors.dart';

abstract class ColorLocalDataSource {
  Future<AppColors> getAppColors();
  Future<void> cacheAppColors(AppColors appColors);
}

const APP_THEME = 'APP_THEME';

class ColorLocalDataSourceImpl implements ColorLocalDataSource {
  final HiveInterface hiveBox;

  ColorLocalDataSourceImpl({this.hiveBox});

  @override
  Future<void> cacheAppColors(AppColors appColors) async {
    final localAppColors = appColors.toLocal();

    final appThemeBox = await hiveBox.openBox(APP_THEME);
    final positionInBox = await appThemeBox.add(localAppColors);

    if (positionInBox != -1) return Future<void>.value();
  }

  @override
  Future<AppColors> getAppColors() async {
    return null;
  }
}
