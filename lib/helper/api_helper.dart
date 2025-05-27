import 'dart:io' show Platform;

import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'language.helper.dart';

class ApiHelper {
  // Properties
  static String deviceId = '';
  static String agent = '';
  static String? pushNotificationToken;

  /// Initializes API helper by setting up device info and other parameters.
  static Future<void> init() async {
    await _initializeDeviceInfo();
    pushNotificationToken = await _fetchPushNotificationToken();
  }

  /// Retrieves the necessary parameters for API requests.
  static Map<String, dynamic> get parameters => {
        "langId": LanguageHelper.isEnglish ? "1" : "2",
        "deviceId": deviceId,
        "agent": agent,
        "pnToken": pushNotificationToken,
      };

  /// Initializes device information (deviceId and agent).
  static Future<void> _initializeDeviceInfo() async {
    try {
      final deviceInfo = DeviceInfoPlugin();
      if (Platform.isIOS) {
        final iosInfo = await deviceInfo.iosInfo;
        deviceId = iosInfo.identifierForVendor ?? 'Unknown';
        agent = 'IOS Drivers - ${iosInfo.name} - ${iosInfo.systemVersion}';
      } else if (Platform.isAndroid) {
        final androidInfo = await deviceInfo.androidInfo;
        deviceId = androidInfo.id;
        agent =
            'Android Drivers - ${androidInfo.model} - ${androidInfo.version.release}';
      }
    } catch (e) {
      deviceId = 'Unknown';
      agent = 'Unknown';
    }
  }

  /// Fetches the push notification token.
  static Future<String> _fetchPushNotificationToken() async {
    try {
      return await FirebaseMessaging.instance.getToken() ?? "Unknown";
    } catch (e) {
      return "Unknown";
    }
  }
}
