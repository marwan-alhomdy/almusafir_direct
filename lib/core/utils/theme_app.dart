import 'package:flutter/material.dart';

import 'resource/color_app.dart';
import 'resource/text_style.dart';
import 'style/border_text_filed.dart';

final appTheme = ThemeData(
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.secondaryOneColor,
    centerTitle: true,
  ),
  brightness: Brightness.light,
  primaryColor: AppColors.secondaryOneColor,
  colorScheme: const ColorScheme.light(
    primary: AppColors.secondaryOneColor,
  ),
  progressIndicatorTheme:
      const ProgressIndicatorThemeData(color: AppColors.secondaryOneColor),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: AppColors.secondaryOneColor,
    foregroundColor: Colors.white,
  ),
  inputDecorationTheme: InputDecorationTheme(
    errorStyle: BorderTextFiled.errorStyle,
    labelStyle: AppTextStyles.getRegularStyle(),
    enabledBorder: BorderTextFiled.enabledBorder(true, 12),
    focusedBorder: BorderTextFiled.focusedBorder(true, 12),
    border: BorderTextFiled.border(true, 12),
    errorBorder: BorderTextFiled.errorBorder(true, 12),
    contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
  ),
);
