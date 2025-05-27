import 'dart:async';
import 'dart:ui';
import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../constants/enum/type_marker.dart';
import 'camera_google_map.dart';
import 'controller_google_map.dart';
import 'icon_marker_google_map.dart';

// ignore: must_be_immutable
class MarkerGoogleMap extends Equatable {
  final IconMarkerGoogleMap iconMarker = IconMarkerGoogleMap();
  GoogleMapController? mapController;

  Set<Marker> markers = {};
  Set<String> addedWashIds = {}; // لتجنب تكرار العلامات

  Future<void> addNewMarker({
    required String markerId,
    required LatLng latLng,
    TypeMarker typeMarker = TypeMarker.ME_LOCATION,
  }) async {
    _updateMarkerAndCircle(markerId, latLng, typeMarker: typeMarker);
    await cameraUpdate(latLng: latLng);
  }

  Future<void> addCountMarker(
      {required String count,
      required LatLng latLng,
      VoidCallback? onTap}) async {
    markers.remove(Marker(markerId: MarkerId(count)));
    // final icon = await iconMarker.countWidget(count);

    markers.add(MarkerController.getMarker(
        count, latLng, await iconMarker.iconCompany,
        onTap: onTap));
    await cameraUpdate(latLng: latLng);
  }

  Future<void> cameraUpdate({required LatLng latLng}) async {
    await mapController?.animateCamera(CameraUpdate.newLatLngZoom(latLng, 12));
  }

  Future<void> updateCameraToShowBothPoints({
    required LatLng startPoint,
    required LatLng endPoint,
  }) async {
    await CameraGoogleMap.updateCameraToShowBothPoints(
      mapController,
      startPoint: startPoint,
      endPoint: endPoint,
    );
  }

  void _updateMarkerAndCircle(
    String markerId,
    LatLng latLng, {
    TypeMarker typeMarker = TypeMarker.ME_LOCATION,
  }) async {
    markers.remove(Marker(markerId: MarkerId(markerId)));

    markers.add(MarkerController.getMarker(
      markerId,
      latLng,
      await iconMarker.getIconMarker(typeMarker),
    ));
    // circles?.remove(Circle(circleId: CircleId(markerId)));
    // circles?.add(CircleController.getCircle(markerId, latLng));
  }

  @override
  List<Object?> get props => [mapController, markers];
}
