import 'dart:io' show Platform;

import 'package:firebase_messaging/firebase_messaging.dart';

Future<Map> getfcbToken() async {
  try {
    return {
      "type": Platform.isIOS ? 'ios' : 'android',
      "token": await FirebaseMessaging.instance.getToken(),
    };
  } catch (e) {
    return {
      "type": Platform.isIOS ? 'ios' : 'android',
      "token": "",
    };
  }
}
