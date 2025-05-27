import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:location/location.dart' as loc;
import 'package:permission_handler/permission_handler.dart' as perm;
import '../../resource/color_app.dart';
import '../../resource/font_manager.dart';
import '../../resource/text_style.dart';

class CheckLocation {
  static Future<void> checkGpsAndPermissions(BuildContext context,
      {required VoidCallback onNext}) async {
    if (await _isGpsEnabled(context) && context.mounted) {
      if (await _isLocationPermissionGranted(context) && context.mounted) {
        onNext();
      }
    }
  }

  static Future<bool> _isGpsEnabled(BuildContext context) async {
    loc.Location location = loc.Location();
    bool serviceEnabled = await location.serviceEnabled();

    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        if (context.mounted) {
          _showServiceErrorDialog(context);
        }
        return false;
      }
    }
    return true;
  }

  static Future<bool> _isLocationPermissionGranted(BuildContext context) async {
    loc.Location location = loc.Location();
    loc.PermissionStatus permissionStatus = await location.hasPermission();
    if (permissionStatus == loc.PermissionStatus.denied ||
        permissionStatus == loc.PermissionStatus.deniedForever) {
      permissionStatus = await location.requestPermission();
      if (permissionStatus != loc.PermissionStatus.granted) {
        if (context.mounted) {
          _showPermissionDialog(context);
        }
        return false;
      }
    }

    // var status = await perm.Permission.location.status;
    // if (status.isDenied || status.isPermanentlyDenied) {
    //   var newStatus = await perm.Permission.location.request();
    //   if (newStatus.isDenied || newStatus.isPermanentlyDenied) {
    //     if (context.mounted) {
    //       _showPermissionDialog(context);
    //     }
    //     return false;
    //   }
    // }

    return true;
  }

  static Future<bool> isLocationServiceEnabled(BuildContext context) async {
    bool servicesEnabled = await Geolocator.isLocationServiceEnabled();
    if (!servicesEnabled) {
      if (context.mounted) {
        _showServiceErrorDialog(context);
      }
      return false;
    }

    LocationPermission locationPermission = await Geolocator.checkPermission();
    if (locationPermission == LocationPermission.denied) {
      locationPermission = await Geolocator.requestPermission();
    }

    if (locationPermission == LocationPermission.always ||
        locationPermission == LocationPermission.whileInUse) {
      return true;
    }

    return false;
  }

  static Future<Position?> getCurrentLocation() async {
    try {
      return await Geolocator.getCurrentPosition();
    } catch (e) {
      return null;
    }
  }

  static void _showPermissionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            "Location permission required".tr,
            style: AppTextStyles.getMediumStyle(fontSize: 16),
          ),
          content: Text(
            "Please allow the app to access your location to enable this feature."
                .tr,
            style: AppTextStyles.getRegularStyle(),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(
                'cancel'.tr,
                style: AppTextStyles.getRegularStyle(
                  color: AppColors.mainOneColor,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                perm.openAppSettings();
                Navigator.of(context).pop();
              },
              child: Text(
                "Open Settings".tr,
                style: AppTextStyles.getRegularStyle(
                  color: AppColors.mainOneColor,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  static void _showServiceErrorDialog(BuildContext context) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.error,
      title: "Please enable location services.".tr,
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 30),
        child: Text(
          "Please enable location services.".tr,
          style: AppTextStyles.getRegularStyle(
            fontSize: FontSizeManager.s16,
          ),
        ),
      ),
    ).show();
  }
}
