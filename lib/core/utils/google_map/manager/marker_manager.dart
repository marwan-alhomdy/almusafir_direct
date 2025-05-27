import 'dart:ui';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../../features/google_map/data/model/wash_location.dart';
import '../../../constants/enum/type_marker.dart';
import '../marker_google_map/markart_google_map.dart';

typedef OnTapInMarker = Function(WashLocation location);

class MarkerManager {
  final markerMap = MarkerGoogleMap();

  Future<void> addMarkers(List<WashLocation> washs,
      {OnTapInMarker? onTap}) async {
    // setting icon for the marker
    final icon = await markerMap.iconMarker.iconCompany;
    // add the icon to the list of markers
    for (var wash in washs) {
      //if the icon is not selected then add the icon to the list of markers
      if (!markerMap.addedWashIds.contains(wash.id.toString())) {
        markerMap.addedWashIds.add(wash.id.toString());
        markerMap.markers.add(Marker(
            markerId: MarkerId(wash.id.toString()),
            icon: icon,
            anchor: const Offset(0.5, 0.5),
            position: wash.location ?? const LatLng(0, 0),
            onTap: () async {
              onTap != null ? onTap(wash) : null;
            }));
      }
    }
  }

  Future<void> addMarker(LatLng latLng, {bool isMe = true}) async {
    await markerMap.addNewMarker(
      markerId: _getTypeMarker(isMe).name,
      typeMarker: _getTypeMarker(isMe),
      latLng: latLng,
    );
  }

  Future<void> updateCameraPosition(LatLng latLng) async {
    await markerMap.cameraUpdate(latLng: latLng);
  }

  Future<void> showBothPoints(LatLng startPoint, LatLng endPoint) async {
    await markerMap.updateCameraToShowBothPoints(
        startPoint: startPoint, endPoint: endPoint);
  }

  void dispose() {
    markerMap.mapController?.dispose();
    markerMap.markers.clear();
  }

  TypeMarker _getTypeMarker(bool isMe) =>
      isMe ? TypeMarker.ME_LOCATION : TypeMarker.COMPANY_LOCATION;
}
