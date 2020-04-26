import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'app_colors.freezed.dart';

// Pure dart class which holds Color values
// EXAMPLE : backgroundColor = 0xff249681
// Which can be consumed in th presentation layer
// with Color scaffoldColor = Color(backGroundColor)
@freezed
abstract class AppColors with _$AppColors {
  factory AppColors({
    String backGroundColor,
    String accentColor,
    String errorColor,
    String primaryColor,
  }) = _AppColors;
}
