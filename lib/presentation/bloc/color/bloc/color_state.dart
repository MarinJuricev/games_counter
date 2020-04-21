part of 'color_bloc.dart';

@immutable
abstract class ColorState {}

class ColorInitial extends ColorState {
  final Color backGroundColor;
  final Color primaryColor;
  final Color accentColor;
  final Color errorColor;

  ColorInitial({
    @required this.backGroundColor,
    @required this.primaryColor,
    @required this.accentColor,
    @required this.errorColor,
  });
}
