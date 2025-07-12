import 'package:dio/dio.dart';

import '../../injection_container.dart' as di;
import '../constants/endpoint.dart';
import '../server/header_server.dart';
import '../services/api.service.dart';

class FavoriteApi {
  static Future<void> toggleFavorite({
    required String? objectType,
    required int? objectId,
  }) async {
    final client = di.sl<ApiService>();
    try {
      await client.post(
        endPoint: EndPointName.favoriteToggle,
        headers: HeaderServer.headerWithToken,
        data: {
          "object_id": objectId,
          "object_type": objectType,
        },
      );
    } catch (e) {
      if (e is DioException) print(e.response?.data.toString());
    }
  }
}
