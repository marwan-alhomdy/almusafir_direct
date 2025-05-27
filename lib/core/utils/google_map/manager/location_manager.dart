import 'dart:async';
import '../../../constants/enum/to_latlng.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import '../../../../helper/public_infromation.dart';
import '../chach_location/cahck_location.dart';

class LocationManager {
  final Location location = Location();
  Position? _currentPosition;
  StreamSubscription<LocationData>? locationSubscription;

  LatLng get currentPosition => _currentPosition.toLatLng();

  Future<void> initializeLocation() async {
    _currentPosition = await CheckLocation.getCurrentLocation();
    Helper.setterMyLocation = _currentPosition;
  }

  Future<void> listenToLocationChanges(Function(LocationData) onData) async {
    locationSubscription = location.onLocationChanged.listen(onData);
  }

  void dispose() {
    locationSubscription?.cancel();
  }
}
