import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

extension PositionX on Position? {
  LatLng toLatLng() => LatLng(
        this?.latitude ?? 0,
        this?.longitude ?? 0,
      );
}

extension LocationDataX on LocationData? {
  LatLng toLatLng() => LatLng(
        this?.latitude ?? 0,
        this?.longitude ?? 0,
      );
}
