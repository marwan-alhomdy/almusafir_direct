import 'package:flutter/cupertino.dart';

import '../core/constants/cached/cached_name.dart';
import '../core/data/current_user/data.dart';
import '../core/firebase/firebase_message.dart';
import '../features/home/data/model/getalldata/primary_data.dart';
import '../features/home/presentation/view/home_view.dart';
import 'cache_helper.dart';

class Helper {
  static PrimaryData? primaryData;

  static int currentIndex = 0;

  static bool get isAuth => CacheHelper.getBool(CachedAppKey.isAuth) ?? false;

  static bool isNotification = false;

  static AppFirebaseMessage? firebaseMessage;

  static User? get user => primaryData?.data?.currentUser?.data;

  static GlobalKey<HomeViewState> homeKey = GlobalKey();
}
