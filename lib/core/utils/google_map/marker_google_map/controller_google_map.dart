import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../resource/color_app.dart';
import 'package:flutter/services.dart';

class MarkerController {
  static Marker getMarker(String markerId, LatLng latLng, BitmapDescriptor icon,
      {VoidCallback? onTap}) {
    return Marker(
        markerId: MarkerId(markerId),
        position: latLng,
        onTap: onTap,
        anchor: const Offset(0.5, 0.5),
        icon: icon);
  }
}

class CircleController {
  static Circle getCircle(String markerId, LatLng latLng) {
    return Circle(
        circleId: CircleId(markerId),
        strokeWidth: 1,
        strokeColor: AppColors.mainOneColor.withOpacity(0.5),
        fillColor: AppColors.mainOneColor.withOpacity(0.3),
        center: latLng,
        radius: 80);
  }
}
