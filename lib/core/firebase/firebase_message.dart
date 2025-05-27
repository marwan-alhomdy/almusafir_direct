import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';

import '../../helper/cache_helper.dart';
import '../../helper/public_infromation.dart';
import '../constants/cached/cached_name.dart';
import 'local_notification.dart';

abstract class AppFirebaseMessageGoogleMap {}

class AppFirebaseMessage extends AppFirebaseMessageGoogleMap {
  // FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
//  List<NotficationModel> dataNotficationModel = [];

  VoidCallback eventDelegate = () {};
  VoidCallback eventBackgroudAndIerninatedApp = () {};
  NotificationServices notificationServices = NotificationServices();

  ///! =============================================><==
  ///?  it operates the following function
  ///*  -  FirebaseMessaging.onBackgroundMessage(onBackgroundMessage);
  ///*   -  FirebaseMessaging.onMessage.listen(showFlutterNotification);
  ///*   -  FirebaseMessaging.onMessageOpenedApp.listen(onMessageOpenedApp);
  ///*   -  initalMessage();
  ///! =============================================><==

  AppFirebaseMessage() {
    FirebaseMessaging.onBackgroundMessage(onBackgroundMessage);
    FirebaseMessaging.onMessage.listen(showFlutterNotification);
    FirebaseMessaging.onMessageOpenedApp.listen(onMessageOpenedApp);
    notificationServices.initialisedNotifications();
    initalMessage();
  }

  ///! =============================================><==
  ///? g et Tocken
  ///* FirebaseMessaging.instance.getToken();
  ///! =============================================><==
  Future<String?> getToken() async {
    return await FirebaseMessaging.instance.getToken();
  }

  ///! =============================================><==
  ///? is state background when click in Notification
  ///* FirebaseMessaging.instance.getInitialMessage();
  ///! =============================================><==
  onMessageOpenedApp(RemoteMessage message) {
    changeNoitfcation();
    showNotification(message);
  }

  ///! =============================================><==
  ///?  if is  Appliction  opened form a Ierninated state
  ///*  FirebaseMessaging.instance.getInitialMessage();
  ///! =============================================><==
  initalMessage() async {
    var message = await FirebaseMessaging.instance.getInitialMessage();
    if (message != null) {
      changeNoitfcation();
      showNotification(message);
    }
  }

  ///! =============================================><==
  ///? Resave Notification in close (background or Ierninated) Aplication.
  ///* FirebaseMessaging.onBackgroundMessage(onBackgroundMessage);
  ///! =============================================><==

  @pragma('vm:entry-point')
  Future onBackgroundMessage(RemoteMessage message) async {
    changeNoitfcation();
    showNotification(message);
  }

  ///! =============================================><==
  ///? Resave Notification in Open (foregroun ) Aplication.
  ///* FirebaseMessaging.onMessage.listen(showFlutterNotification);
  ///! =============================================><==

  void showFlutterNotification(RemoteMessage message) {
    changeNoitfcation();
    showNotification(message);
  }

  ///! =============================================><==
  ///? Show method use disply Notification.
  ///* All back mehtod use this method
  ///! =============================================><==

  void showNotification(RemoteMessage message) async {
    debugPrint(message.data.toString());
    debugPrint(message.notification.toString());
    notificationServices.sendNotifications(
      id: 0,
      title:
          message.notification?.title ?? message.data["title"] ?? "not title",
      body: message.notification?.body ?? message.data["body"] ?? "not body",
    );
  }

  void changeNoitfcation() {
    Helper.notification = true;
    CacheHelper.setBool(CachedAppKey.isNotification, true);
    eventDelegate();
  }
}

Future backgroudMessage(RemoteMessage message) async {
  if (Helper.firebaseMessage != null) {
    Helper.firebaseMessage?.eventDelegate();
  }
}
