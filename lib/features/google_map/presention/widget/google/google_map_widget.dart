import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../../core/utils/google_map/marker_google_map/markart_google_map.dart';
import '../../logic/google_map_bloc/google_map_bloc.dart';
import '../../logic/google_map_cubit/controller_map_google_cubit.dart';

class GoogleMapWidget extends StatelessWidget {
  GoogleMapWidget({super.key, required this.markerGoogleMap});
  final MarkerGoogleMap? markerGoogleMap;
  final Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      mapType: MapType.normal,
      markers: markerGoogleMap?.markers ?? {},
      initialCameraPosition: const CameraPosition(
        target: LatLng(21.4225, 39.8262), // المركز الافتراضي
        zoom: 14.0,
      ),
      onCameraMove: (position) => _onCameraMove(context, position),
      onCameraIdle: () => _cameraIdle(context),
      compassEnabled: false,
      rotateGesturesEnabled: true,
      zoomControlsEnabled: true,
      liteModeEnabled: false,
      tiltGesturesEnabled: true,
      myLocationButtonEnabled: false,
      scrollGesturesEnabled: true,
      onMapCreated: (GoogleMapController controller) async {
        final mapStyle = await DefaultAssetBundle.of(context)
            .loadString('assets/json/map_style_with_google.json');
        controller.setMapStyle(mapStyle);
        _controller.complete(controller);
        context
            .read<ControllerMapGoogleCubit>()
            .markerManager
            .markerMap
            .mapController = controller;
        context.read<ControllerMapGoogleCubit>().initializeMyLocation(context);
      },
    );
  }

  void _onCameraMove(BuildContext context, CameraPosition position) {
    context.read<ControllerMapGoogleCubit>().currentPosition = position.target;
  }

  void _cameraIdle(BuildContext context) async {
    final mapGoogleCubit = context.read<ControllerMapGoogleCubit>();
    final mapController = mapGoogleCubit.markerManager.markerMap.mapController;
    // يتم استدعاء هذا الحدث عندما تتوقف الكاميرا عن الحركة
    if (mapController != null) {
      mapGoogleCubit.mapManager.checkMapCenterLocationChanged(mapController,
          (location) async {
        final bounds = await mapController.getVisibleRegion();
        context
            .read<GoogleMapBloc>()
            .add(FetchWashLocationEvent(bounds: bounds));
      });
    }
  }
}
