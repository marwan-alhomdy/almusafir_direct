import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../constants/config.dart';
import 'place_autocomplet.module.dart';
import 'place_details.module.dart';

class GoogleMapsPlascesService {
  static Future<List<PlaceAutocompletModel>> getPredictions(
      {required String input, required String sessiontoken}) async {
    try {
      const baseURL = 'https://maps.googleapis.com/maps/api/place';
      String request =
          '$baseURL/autocomplete/json?input=$input&key=$GOOGLE_API_KEY&sessiontoken=$sessiontoken';
      var response = await http.get(Uri.parse(request));
      if (response.statusCode == 200) {
        final data = json.decode(response.body)['predictions'];
        List<PlaceAutocompletModel> places = [];
        for (var item in data) {
          places.add(PlaceAutocompletModel.fromJson(item));
        }
        return places;
      } else {
        throw Exception('Failed to load predictions');
      }
    } catch (e) {
      rethrow;
    }
  }

  static Future<PlaceDetailsModel> getPlacesDetails(
      {required String placeId}) async {
    try {
      const baseURL = 'https://maps.googleapis.com/maps/api/place';
      String request =
          '$baseURL/details/json?place_id=$placeId&key=$GOOGLE_API_KEY';
      var response = await http.get(Uri.parse(request));
      if (response.statusCode == 200) {
        final data = json.decode(response.body)['result'];
        return PlaceDetailsModel.fromJson(data);
      } else {
        throw Exception('Failed to load predictions');
      }
    } catch (e) {
      rethrow;
    }
  }
}
