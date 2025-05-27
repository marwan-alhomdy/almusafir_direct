import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import '../../utils/function/message_box.dart';

class LocationUtils {
  static Future<bool> locationServiceEnabled(BuildContext context) async {
    LocationPermission locationPermission;
    bool services;
    services = await Geolocator.isLocationServiceEnabled();
    if (services == false) {
      // ignore: use_build_context_synchronously
      MessageBox.showError(context, "Please enable location".tr);

      return false;
    }
    locationPermission = await Geolocator.checkPermission();
    if (locationPermission == LocationPermission.denied ||
        locationPermission == LocationPermission.deniedForever) {
      locationPermission = await Geolocator.requestPermission();
    }
    locationPermission = await Geolocator.checkPermission();
    if (locationPermission == LocationPermission.denied ||
        locationPermission == LocationPermission.deniedForever) {
      // رسالة البرميشن في حالة عدم منح المستخدم للوصول إلى الموقع من قبل
      final message =
          "Access to location must be granted to use this feature".tr;
      // ignore: use_build_context_synchronously
      MessageBox.showWarning(context, message);
      return false;
    }
    if (locationPermission == LocationPermission.always ||
        locationPermission == LocationPermission.whileInUse) {
      return true;
    }
    return false;
  }

  static Future<Position?> getLatLog() async {
    try {
      return await Geolocator.getCurrentPosition().then((value) => value);
    } catch (e) {/** **/}
    return null;
  }
}
