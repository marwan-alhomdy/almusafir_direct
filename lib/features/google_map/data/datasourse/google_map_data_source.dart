import 'dart:convert';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

import '../../../../core/constants/config.dart';
import '../../../../core/error/exception.dart';
import '../../../../core/server/header_server.dart';
import '../../../../helper/api_helper.dart';
import '../../../../helper/public_infromation.dart';
import '../model/wash_location.dart';

abstract class GoogleMapDataSource {
  Future<List<WashLocation>> fetchWashLocation({required LatLngBounds bounds});
  Future<String> refreshDriverlocation(LatLng location);
  Future<WashLocation> fetchDetailslocation(int washId);
}

class GoogleMapDataSourceImplWithHttp extends GoogleMapDataSource {
  final http.Client client;
  GoogleMapDataSourceImplWithHttp({required this.client});

  @override
  Future<String> refreshDriverlocation(LatLng location) async {
    var parameters = ApiHelper.parameters;
    parameters.addAll({"userId": Helper.delegate?.id ?? ""});
    parameters.addAll({"lat": location.latitude.toString()});
    parameters.addAll({"lng": location.longitude.toString()});
    var response = await client.post(
      Uri.parse('${BASE_URL}Drivers_location_log'),
      headers: HeaderServer.header,
      body: parameters,
    );
    final decodeJson = json.decode(response.body);
    if (decodeJson["response"] == 0) {
      throw ServerExecption(message: decodeJson["message"]);
    } else {
      return decodeJson["message"];
    }
  }

  @override
  Future<List<WashLocation>> fetchWashLocation(
      {required LatLngBounds bounds}) async {
    final northeast = bounds.northeast;
    final southwest = bounds.southwest;

    final params =
        "northEastLat=${northeast.latitude}&northEastLng=${northeast.longitude}&southWestLat=${southwest.latitude}&southWestLng=${southwest.longitude}";
    var response = await client.get(
      Uri.parse('${BASE_URL}delegate-api/locations?$params'),
      headers: HeaderServer.headerWithToken,
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      final decodeJson = json.decode(response.body);
      return (decodeJson as List<dynamic>)
          .map((e) => WashLocation?.fromJson(e))
          .toList();
    } else {
      final decodeJson = json.decode(response.body);
      throw ServerExecption(message: decodeJson["message"]);
    }
  }

  @override
  Future<WashLocation> fetchDetailslocation(int washId) async {
    var response = await client.get(
        Uri.parse('${BASE_URL}delegate-api/location/$washId'),
        headers: HeaderServer.headerWithToken);

    if (response.statusCode == 200 || response.statusCode == 201) {
      final decodeJson = json.decode(response.body);
      return WashLocation.fromJson(decodeJson);
    } else {
      final decodeJson = json.decode(response.body);
      throw ServerExecption(message: decodeJson["message"]);
    }
  }
}
