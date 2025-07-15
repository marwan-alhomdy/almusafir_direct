import 'package:flutter/material.dart';

import '../core/constants/cached/cached_name.dart';
import 'cache_helper.dart';

class ThemeHelper {
  static bool? get _storedTheme => CacheHelper.getBool(CachedAppKey.themeType);

  /// هل الثيم محدد كنظام؟
  static bool get isSystem => _storedTheme == null;

  /// هل هو ثيم فاتح؟
  static bool get isLight => _storedTheme == true;

  /// هل هو ثيم مظلم؟
  static bool get isDark => _storedTheme == false;

  /// الوضع الحالي للتطبيق
  static ThemeMode get themeMode {
    if (_storedTheme == null) {
      return ThemeMode.system;
    } else if (_storedTheme == true) {
      return ThemeMode.light;
    } else {
      return ThemeMode.dark;
    }
  }

  static void setThemeMode(ThemeMode mode) {
    switch (mode) {
      case ThemeMode.light:
        CacheHelper.setBool(CachedAppKey.themeType, true);
        break;
      case ThemeMode.dark:
        CacheHelper.setBool(CachedAppKey.themeType, false);
        break;
      case ThemeMode.system:
        CacheHelper.removeAt(CachedAppKey.themeType);
        break;
    }
  }

  /// لتغيير الثيم
  static void setTheme(bool isLight) {
    CacheHelper.setBool(CachedAppKey.themeType, isLight);
  }

  /// حذف الثيم ليعود للوضع النظامي
  static void clearTheme() {
    CacheHelper.removeAt(CachedAppKey.themeType);
  }
}
