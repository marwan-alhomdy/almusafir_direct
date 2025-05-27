import '../core/constants/cached/cached_name.dart';
import 'cache_helper.dart';

class LanguageHelper {
  // اختيار النص المناسب بناءً على اللغة المحفوظة في التخزين المؤقت
  static String chooseLabelLanguage({
    String? arabic,
    String? english,
    String? error,
  }) {
    String? cachedLanguage = CacheHelper.getString(CachedAppKey.languageCode);

    if (cachedLanguage == null) {
      CacheHelper.setString(CachedAppKey.languageCode, "ar");
      return arabic ?? english ?? error ?? "";
    } else if (cachedLanguage == "ar") {
      return arabic ?? english ?? error ?? "";
    } else {
      return english ?? arabic ?? error ?? "";
    }
  }

  // اختيار القيمة المناسبة بناءً على اللغة المحفوظة في التخزين المؤقت
  static Type chooseLanguage<Type>({
    required Type arabic,
    required Type english,
  }) {
    String? cachedLanguage = CacheHelper.getString(CachedAppKey.languageCode);

    if (cachedLanguage == null) {
      CacheHelper.setString(CachedAppKey.languageCode, "ar");
      return arabic;
    } else if (cachedLanguage == "ar") {
      return arabic;
    } else {
      return english;
    }
  }

  static bool get isEnglish => !isArabic;

  static bool get isArabic =>
      (CacheHelper.getString(CachedAppKey.languageCode) ?? "ar") == "ar";
}
