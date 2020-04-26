part of 'color_bloc.dart';

@immutable
abstract class ColorState {}

class ColorInitial extends ColorState {}

class ColorUpdated extends ColorState {
  final AppColors appColors;

  ColorUpdated({@required this.appColors});
}
