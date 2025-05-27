import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../../core/api/image_api.dart';
import '../../../../core/constants/config.dart';
import '../../../../core/data/models/cloudflare.module.dart';
import '../../../../core/error/exception.dart';
import '../../../../core/server/header_server.dart';
import '../../../../core/utils/function/get_id_image.dart';

abstract class UploadImageCloudinartDataSource {
  Future<Cloudflare> uploadImagePofile(
      {required String newImage,
      required String? currentImage,
      required String mobile});
}

class UploadImageCloudinartDataSourceImpCloudinary
    implements UploadImageCloudinartDataSource {
  const UploadImageCloudinartDataSourceImpCloudinary({required this.client});
  final http.Client client;

  @override
  Future<Cloudflare> uploadImagePofile(
      {required String newImage,
      required String? currentImage,
      required String mobile}) async {
    var headers = HeaderServer.headerWithCloudflare;
    var request = http.MultipartRequest('POST', Uri.parse(API_CLOUDFLARE));
    await ImageApi.deleteImage(url: currentImage);
    request.fields.addAll(createIdProfileImage(mobile));
    request.fields.addAll(REQUIRE_SIGNED_URLS);
    request.files.add(await http.MultipartFile.fromPath('file', newImage));
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200 || response.statusCode == 201) {
      final resonseBody = await response.stream.bytesToString();
      final decodeJson = json.decode(resonseBody);
      return Cloudflare.fromJson(decodeJson);
    } else {
      throw ServerExecption();
    }
  }
}
