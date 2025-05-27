import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

import '../../features/auth/persention/view/auth_view.dart';
import '../../helper/cache_helper.dart';
import '../constants/cached/cached_name.dart';

class ErrorTokenAuth {
  static bool scanTokenAuth(String resonseBody) {
    if (resonseBody == '"Not authorized, token failed"' ||
        resonseBody == "NOT AUTHORIZED, THE TOKEN FAILED" ||
        resonseBody == '"Not authorized, no token"') {
      logoutApp();
      return true;
    }
    return false;
  }

  static void logoutApp() {
    CacheHelper.removeAt(CachedAppKey.isAuth);
    CacheHelper.removeAt(CachedAppKey.dataApp);

    FirebaseMessaging.instance
        .unsubscribeFromTopic("drivers")
        .then((v) => log("Success"))
        .catchError((e) => log("$e"));
    Get.off(() => const AuthintcationView());
  }
}
