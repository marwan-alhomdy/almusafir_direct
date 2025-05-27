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

  // @override
  // Future<String> uploadImagePofile({required String urlImage}) async {
  //   try {
  //     var headers = {
  //       'authority': 'api.cloudflare.com',
  //       'Authorization': 'Bearer -VvHgj2ssJyBfinWoTqjRFKVJz-QhC2qy83GSiR_',
  //       'Cookie':
  //           '__cflb=0H28vgHxwvgAQtjUGUFqYFDiSDreGJnUo8bRDejDeR3; __cfruid=bc96f8617b0a8f929f63d01e1f6a06090bb341db-1678111731'
  //     };
  //     var request = http.MultipartRequest(
  //         'POST',
  //         Uri.parse(
  //             'https://api.cloudflare.com/client/v4/accounts/d00fddfbe71a6bd4cbd1cfb12095d1a1/images/v1'));
  //     request.fields
  //         .addAll({'requireSignedURLs': 'false', 'metadata': '{"sdf":"sdf"}'});
  //     request.files.add(await http.MultipartFile.fromPath('file', urlImage));
  //     request.headers.addAll(headers);
  //     http.StreamedResponse response = await request.send();
  //     if (response.statusCode == 200 || response.statusCode == 201) {
  //       final resonseBody = await response.stream.bytesToString();
  //       final decodeJson = json.decode(resonseBody);
  //       return decodeJson["result"]["variants"][0];
  //     } else {
  //       throw ServerExecption();
  //     }
  //   } catch (e) {
  //     throw ServerExecption();
  //   }
  // }
}
