import 'package:game_counter/domain/entities/app_colors.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

@HiveType(typeId: 0)
class LocalAppColors extends HiveObject {
  @HiveField(0)
  final String backGroundColor;
  @HiveField(1)
  final String accentColor;
  @HiveField(2)
  final String errorColor;
  @HiveField(3)
  final String primaryColor;

  LocalAppColors({
    @required this.backGroundColor,
    @required this.accentColor,
    @required this.errorColor,
    @required this.primaryColor,
  });
}

extension ColorMapper on AppColors {
  LocalAppColors toLocal() {
    return LocalAppColors(
      backGroundColor: this.backGroundColor,
      accentColor: this.accentColor,
      errorColor: this.errorColor,
      primaryColor: this.primaryColor,
    );
  }
}

extension LocalColorMapper on LocalAppColors {
  AppColors toAppColors() {
    return AppColors(
      backGroundColor: this.backGroundColor,
      accentColor: this.accentColor,
      errorColor: this.errorColor,
      primaryColor: this.primaryColor,
    );
  }
}
