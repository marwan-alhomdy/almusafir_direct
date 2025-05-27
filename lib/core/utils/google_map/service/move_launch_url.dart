//! ==========================================================================
//?   Start Funtion Google Map
//! ==========================================================================
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../chach_location/cahck_location.dart';

void moveToCellPhone(String mobile) async {
  final url = "tel:$mobile";
  if (await canLaunchUrl(Uri.parse(url))) {
    await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
  }
}

void moveToWhatsApp(String mobile) async {
  final url = "https://wa.me/$mobile";
  if (await canLaunchUrl(Uri.parse(url))) {
    launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
  }
}

void moveToSms(String mobile) async {
  final url = 'sms:$mobile?body=hello';
  if (await canLaunchUrl(Uri.parse(url))) {
    launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
  }
}

void moveToEmail(String email, String subject) async {
  final url =
      "mailto:$email?subject=${Uri.encodeFull(subject)}&body=${Uri.encodeFull(subject)}";
  if (await canLaunchUrl(Uri.parse(url))) {
    await launchUrl(Uri.parse(url));
  }
}

void moveDirGoogleMapCustmer({required LatLng? otherSide}) async {
  Position? myPostion = await CheckLocation.getCurrentLocation();
  String url =
      "https://www.google.com/maps/dir/${myPostion?.latitude ?? 0},${myPostion?.longitude ?? 0}/${otherSide?.latitude ?? 0},${otherSide?.longitude ?? 0}";
  if (await canLaunchUrl(Uri.parse(url))) {
    await launchUrl(
      Uri.parse(url),
      webViewConfiguration: const WebViewConfiguration(),
      mode: LaunchMode.externalApplication,
    );
  }
}

void moveGoogleMapCustmer({required LatLng? latLng}) async {
  String url =
      'https://www.google.com/maps?q=${latLng?.latitude ?? 0},${latLng?.longitude ?? 0}';
  //if (await canLaunchUrl(Uri.parse(url))) {
  await launchUrl(
    Uri.parse(url),
    webViewConfiguration: const WebViewConfiguration(),
    mode: LaunchMode.externalApplication,
  );
  // }
}
