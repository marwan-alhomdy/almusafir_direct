import 'package:google_maps_flutter/google_maps_flutter.dart';

class PlaceDetailsModel {
  Geometry? geometry;

  PlaceDetailsModel({
    this.geometry,
  });

  factory PlaceDetailsModel.fromJson(Map<String, dynamic> json) =>
      PlaceDetailsModel(
        geometry: json['geometry'] == null
            ? null
            : Geometry.fromJson(json['geometry'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'geometry': geometry?.toJson(),
      };
}

class Geometry {
  Location? location;

  Geometry({this.location});

  factory Geometry.fromJson(Map<String, dynamic> json) => Geometry(
        location: json['location'] == null
            ? null
            : Location.fromJson(json['location'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'location': location?.toJson(),
      };
}

class Location {
  double? lat;
  double? lng;

  Location({this.lat, this.lng});

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        lat: (json['lat'] as num?)?.toDouble(),
        lng: (json['lng'] as num?)?.toDouble(),
      );
  LatLng toLatLng() => LatLng(lat ?? 0, lng ?? 0);

  Map<String, dynamic> toJson() => {
        'lat': lat,
        'lng': lng,
      };
}
