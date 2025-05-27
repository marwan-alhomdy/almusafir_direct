import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:math';

class MapManager {
  LatLng _lastMapCenter;
  final double _googlePlaceRadius; // نصف القطر بالأمتار

  MapManager({required LatLng initialCenter, required double googlePlaceRadius})
      : _lastMapCenter = initialCenter,
        _googlePlaceRadius = googlePlaceRadius;

  // تحقق مما إذا كان المركز قد تغير بشكل كبير
  Future<void> checkMapCenterLocationChanged(
      GoogleMapController mapController, Function(LatLng) onFetchPlaces) async {
    final newCenter = await _getMapCenter(mapController);

    final distance = _calculateDistance(_lastMapCenter, newCenter);

    if (distance > _googlePlaceRadius) {
      _lastMapCenter = newCenter; // تحديث المركز السابق
      onFetchPlaces(newCenter); // استدعاء الدالة لجلب الأماكن الجديدة
    }
  }

  // الحصول على المركز الحالي للخريطة
  Future<LatLng> _getMapCenter(GoogleMapController mapController) async {
    final bounds = await mapController.getVisibleRegion();
    return LatLng(
      (bounds.northeast.latitude + bounds.southwest.latitude) / 2,
      (bounds.northeast.longitude + bounds.southwest.longitude) / 2,
    );
  }

  // حساب المسافة بين موقعين باستخدام صيغة Haversine
  double _calculateDistance(LatLng start, LatLng end) {
    const double earthRadius = 6371000; // نصف قطر الأرض بالأمتار

    final lat1 = _toRadians(start.latitude);
    final lon1 = _toRadians(start.longitude);
    final lat2 = _toRadians(end.latitude);
    final lon2 = _toRadians(end.longitude);

    final dLat = lat2 - lat1;
    final dLon = lon2 - lon1;

    final a =
        pow(sin(dLat / 2), 2) + cos(lat1) * cos(lat2) * pow(sin(dLon / 2), 2);
    final c = 2 * atan2(sqrt(a), sqrt(1 - a));

    return earthRadius * c; // المسافة بالأمتار
  }

  // تحويل الدرجات إلى راديان
  double _toRadians(double degrees) {
    return degrees * (pi / 180);
  }
}
