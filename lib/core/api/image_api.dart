import 'package:http/http.dart' as http;
import '../constants/config.dart';
import '../server/header_server.dart';
import '../utils/function/get_id_image.dart';

class ImageApi {
  static Future<void> deleteImage({required String? url}) async {
    try {
      String? id = getIdProfileImage(url);
      if (id == null) return;
      var headers = HeaderServer.headerWithCloudflare;
      await http.delete(Uri.parse("$API_CLOUDFLARE/$id"), headers: headers);
    } catch (e) {
      return;
    }
  }
}
