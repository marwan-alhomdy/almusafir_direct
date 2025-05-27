import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../../core/utils/google_map/chach_location/cahck_location.dart';
import '../../../../../core/utils/google_map/manager/location_manager.dart';
import '../../../../../core/utils/google_map/manager/map.manger.dart';
import '../../../../../core/utils/google_map/manager/marker_manager.dart';
import '../../../../../helper/public_infromation.dart';
import '../../../data/model/wash_location.dart';

part 'controller_map_google_state.dart';

class ControllerMapGoogleCubit extends Cubit<ControllerMapGoogleState> {
  ControllerMapGoogleCubit() : super(ControllerMapGoogleInitial());
  List<WashLocation> washLocations = [];

  final MarkerManager markerManager = MarkerManager();
  final LocationManager locationManager = LocationManager();

  LatLng currentPosition = const LatLng(21.422310185223573, 39.82620209718651);

  final mapManager = MapManager(
    initialCenter:
        const LatLng(21.422310185223573, 39.82620209718651), //  (مكة)
    googlePlaceRadius: 1000, // نصف القطر بالأمتار
  );
  bool _isDisposed = false;

  //!=============================
  //? METHODS
  //!=============================

  Future<void> displayOrderDetailsOnMap(
      BuildContext context, OnTapInMarker onTapInMarker) async {
    try {
      await markerManager.addMarkers(washLocations, onTap: onTapInMarker);
    } finally {
      _updateGoogleMapState();
    }
  }

  Future<void> addWashsLocationToMap(
      BuildContext context, OnTapInMarker onTapInMarker) async {
    try {
      await markerManager.addMarkers(washLocations, onTap: onTapInMarker);
    } finally {
      _updateGoogleMapState();
    }
  }

  Future<void> initializeMyLocation(BuildContext context) async {
    try {
      if (await CheckLocation.isLocationServiceEnabled(context)) {
        await locationManager.initializeLocation();
        final location = Helper.myLocation;
        await markerManager.addMarker(locationManager.currentPosition);
        await markerManager.updateCameraPosition(location);
      }
    } finally {
      _updateGoogleMapState();
    }
  }

  Future<void> moveToMyLocation(BuildContext context) async {
    try {
      if (await CheckLocation.isLocationServiceEnabled(context)) {
        await locationManager.initializeLocation();
        final location = Helper.myLocation;
        await markerManager.addMarker(locationManager.currentPosition);
        await markerManager.updateCameraPosition(location);
      }
    } finally {
      _updateGoogleMapState();
    }
  }

  Future<void> updateCameraPosition(LatLng latLng) async {
    await markerManager.updateCameraPosition(latLng);
  }

  //!=====================
  //? Update Google Map State
  //!======================

  void _updateGoogleMapState() {
    if (!_isDisposed) {
      emit(LoadingGoogleMapState());
      emit(GoogleMapState());
    }
  }

  //!=============================
  //? Dispose Method
  //!=============================

  @override
  Future<void> close() {
    _isDisposed = true;
    locationManager.dispose();
    markerManager.dispose();
    debugPrint("Disposed");
    return super.close();
  }
}
