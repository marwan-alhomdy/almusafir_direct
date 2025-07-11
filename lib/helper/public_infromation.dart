import '../core/constants/cached/cached_name.dart';
import '../core/data/current_user/data.dart';
import '../core/firebase/firebase_message.dart';
import '../features/home/data/model/getalldata/primary_data.dart';
import 'cache_helper.dart';

class Helper {
  static PrimaryData? primaryData;

  static int currentIndex = 0;

  static bool get isAuth => CacheHelper.getBool(CachedAppKey.isAuth) ?? false;

  static bool isNotification = false;

  static AppFirebaseMessage? firebaseMessage;

  static User? get user => primaryData?.data?.currentUser?.data;

  static void init() async {
    await CacheHelper.init();
    isNotification = CacheHelper.getBool(CachedAppKey.isNotification) ?? false;
  }
}
