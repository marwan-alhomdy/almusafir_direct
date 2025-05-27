import 'dart:math';

import 'package:google_maps_flutter/google_maps_flutter.dart';

class CameraGoogleMap {
  static Future<void> updateCameraToShowBothPoints(
    GoogleMapController? googleMapController, {
    required LatLng startPoint,
    required LatLng endPoint,
  }) async {
    final LatLng southwest = LatLng(
      min(startPoint.latitude, endPoint.latitude),
      min(startPoint.longitude, endPoint.longitude),
    );
    final LatLng northeast = LatLng(
      max(startPoint.latitude, endPoint.latitude),
      max(startPoint.longitude, endPoint.longitude),
    );
    LatLngBounds bounds = LatLngBounds(
      southwest: southwest,
      northeast: northeast,
    );
    await googleMapController!.animateCamera(
      CameraUpdate.newLatLngBounds(bounds, 100),
    );
  }

  static Future<void> updateCamera(GoogleMapController? googleMapController,
      {required LatLng startPoint, required LatLng endPoint}) async {
    LatLngBounds bound;
    if (startPoint.latitude >= endPoint.latitude) {
      LatLng temp = endPoint;
      endPoint = startPoint;
      startPoint = temp;
    }
    bound = LatLngBounds(southwest: startPoint, northeast: endPoint);
    CameraUpdate towPoints = CameraUpdate.newLatLngBounds(bound, 100);
    await googleMapController!.animateCamera(CameraUpdate.zoomTo(13));
    await googleMapController
        .animateCamera(towPoints)
        .then((value) => CameraGoogleMap.check(towPoints, googleMapController));
  }

  static void check(CameraUpdate u, GoogleMapController c) async {
    c.animateCamera(u);
    // googleMapController?.animateCamera(u);
    LatLngBounds l1 = await c.getVisibleRegion();
    LatLngBounds l2 = await c.getVisibleRegion();
    if (l1.southwest.latitude == -90 || l2.southwest.latitude == -90) {
      check(u, c);
    }
  }

  static void moveCameraToFitMarkers(
    List<LatLng> latLngs, // قائمة المواقع (LatLngs)
    GoogleMapController mapController, // وحدة تحكم الخرائط
  ) {
    if (latLngs.isEmpty) return;

    // إنشاء حدود تحتوي على جميع النقاط
    LatLngBounds bounds;
    if (latLngs.length == 1) {
      bounds = LatLngBounds(
        southwest: latLngs.first,
        northeast: latLngs.first,
      );
    } else {
      double south = latLngs.first.latitude;
      double north = latLngs.first.latitude;
      double west = latLngs.first.longitude;
      double east = latLngs.first.longitude;

      for (var latLng in latLngs) {
        if (latLng.latitude < south) south = latLng.latitude;
        if (latLng.latitude > north) north = latLng.latitude;
        if (latLng.longitude < west) west = latLng.longitude;
        if (latLng.longitude > east) east = latLng.longitude;
      }

      bounds = LatLngBounds(
        southwest: LatLng(south, west),
        northeast: LatLng(north, east),
      );
    }
    // تحريك الكاميرا لتلائم الحدود
    mapController.animateCamera(CameraUpdate.newLatLngBounds(bounds, 50));
  }
}
