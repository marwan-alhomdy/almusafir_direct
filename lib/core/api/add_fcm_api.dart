import 'dart:convert';
import 'dart:developer';
import 'dart:io' show Platform;

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:http/http.dart' as http;

import '../constants/config.dart';
import '../server/header_server.dart';

class AddFcmApi {
  static Future<void> addFcmToken() async {
    String? token;
    try {
      token = await FirebaseMessaging.instance.getToken();
      if (token == null) return;
    } catch (e) {
      return;
    }

    try {
      var response = await http.post(
          Uri.parse("${BASE_URL}delegate-api/add-fcm"),
          headers: HeaderServer.headerWithToken,
          body: json.encode(
              {"token": token, "type": Platform.isIOS ? "IOS" : "Android"}));

      if (response.statusCode == 200 || response.statusCode == 201) {
        log("FCM token added");
      }
    } catch (e) {/* */}
  }
}
