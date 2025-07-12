import 'package:dio/dio.dart';

import '../../injection_container.dart' as di;
import '../constants/endpoint.dart';
import '../server/header_server.dart';
import '../services/api.service.dart';

class RatingApi {
  static Future<void> toggleRating(
      {required String? objectType,
      required int? objectId,
      required num? rating,
      String? comment}) async {
    final client = di.sl<ApiService>();
    try {
      await client.post(
        endPoint: EndPointName.ratingToggle,
        headers: HeaderServer.headerWithToken,
        data: {
          "object_id": objectId,
          "object_type": objectType,
          'rating': rating?.toInt() ?? 1,
          'title': comment,
        },
      );
    } catch (e) {
      if (e is DioException) print(e.response?.data.toString());
    }
  }
}
