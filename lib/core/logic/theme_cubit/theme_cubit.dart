import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../helper/theme.helper.dart';

enum AppThemeMode { system, light, dark }

class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.system) {
    emit(ThemeHelper.themeMode);
  }

  void setTheme(AppThemeMode appThemeMode) {
    switch (appThemeMode) {
      case AppThemeMode.system:
        ThemeHelper.clearTheme();
        emit(ThemeMode.system);
        break;
      case AppThemeMode.light:
        ThemeHelper.setTheme(true);
        emit(ThemeMode.light);
        break;
      case AppThemeMode.dark:
        ThemeHelper.setTheme(false);
        emit(ThemeMode.dark);
        break;
    }
  }
}
