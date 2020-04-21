import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

// Pure dart class which holds Color values
// EXAMPLE : backgroundColor = 0xff249681
// Which can be consumed in th presentation layer
// with Color scaffoldColor = Color(backGroundColor)
class AppColors extends Equatable {
  final String backGroundColor;
  final String accentColor;
  final String errorColor;
  final String primaryColor;

  AppColors({
    @required this.backGroundColor,
    @required this.accentColor,
    @required this.errorColor,
    @required this.primaryColor,
  });

  @override
  List<Object> get props =>
      [backGroundColor, accentColor, errorColor, primaryColor];
}
