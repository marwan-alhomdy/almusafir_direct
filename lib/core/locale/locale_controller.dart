import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

import '../../helper/cache_helper.dart';
import '../constants/cached/cached_name.dart';

class LocaleController extends GetxController {
  String languageCode = "";
  LocaleController() {
    initLocale = init();
  }
  late Locale initLocale;
  Locale init() {
    if (CacheHelper.getString(CachedAppKey.languageCode) == null) {
      languageCode = "ar";
      CacheHelper.setString(CachedAppKey.languageCode, 'ar');
      return const Locale("ar");

      //Get.deviceLocale!
    } else {
      languageCode = CacheHelper.getString(CachedAppKey.languageCode) ?? "ar";
      return Locale(languageCode);
    }
  }

  void chingeLanguage({required String languageCode}) {
    Locale locale = Locale(languageCode);
    this.languageCode = languageCode;
    CacheHelper.setString(CachedAppKey.languageCode, languageCode);
    Get.updateLocale(locale);
  }
}
