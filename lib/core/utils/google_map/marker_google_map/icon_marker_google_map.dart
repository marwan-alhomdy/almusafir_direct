import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/services.dart';
import 'dart:ui' as ui;
import 'dart:async';

import '../../../constants/enum/type_marker.dart';
import 'widget_to_bitmap_descriptor.dart';

class IconMarkerGoogleMap {
  static final IconMarkerGoogleMap _instance = IconMarkerGoogleMap._internal();
  late final Future<BitmapDescriptor> iconMyLocation;
  late final Future<BitmapDescriptor> iconCompany;

  factory IconMarkerGoogleMap() {
    return _instance;
  }

  IconMarkerGoogleMap._internal() {
    _initMarkerGoogle();
  }

  Future<void> _initMarkerGoogle() async {
    iconMyLocation =
        getBytesFromAsset(TypeMarker.ME_LOCATION.image, 120).then((bytes) {
      return BitmapDescriptor.fromBytes(bytes);
    });
    iconCompany =
        getBytesFromAsset(TypeMarker.COMPANY_LOCATION.image, 120).then((bytes) {
      return BitmapDescriptor.fromBytes(bytes);
    });
  }

  Future<BitmapDescriptor> getIconMarker(
      [TypeMarker typeMarker = TypeMarker.ME_LOCATION]) async {
    if (typeMarker == TypeMarker.ME_LOCATION) {
      return await iconMyLocation;
    } else {
      return await iconCompany;
    }
  }

  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  Future<BitmapDescriptor> countWidget(String count) async {
    return await CountWidget(
      count: count,
    ).toBitmapDescriptor(
        logicalSize: const Size(150, 150), imageSize: const Size(150, 150));
  }
}
