import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../core/constants/cached/cached_name.dart';
import '../core/data/models/wash.module.dart';
import '../core/firebase/firebase_message.dart';
import '../features/home/data/model/current_user/data.dart';
import '../features/home/data/model/getalldata/getalldata.dart';
import 'cache_helper.dart';

class Helper {
  static Getalldata? dataApp;

  static WashModule? washApp;

  static int currentIndex = 0;

  static bool isAuth = false;
  static bool notification = false;

  static AppFirebaseMessage? firebaseMessage;

  static LatLng myLocation = const LatLng(0, 0);

  static set setterMyLocation(Position? value) =>
      myLocation = LatLng(value?.latitude ?? 0, value?.longitude ?? 0);

  static LatLng get getterMyLocation => myLocation;

  static DataCurrentUser? get user => dataApp?.data?.currentUser?.data;

  static void init() async {
    await CacheHelper.init();
    notification = CacheHelper.getBool(CachedAppKey.isNotification) ?? false;
    isAuth = CacheHelper.getBool(CachedAppKey.isAuth) ?? false;
  }
}
