import 'dart:convert';
import 'dart:io' show Platform;

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../../../../core/constants/config.dart';
import '../../../../core/error/exception.dart';
import '../../../../core/server/error_token.dart';
import '../../../../core/server/header_server.dart';

abstract class ProfileRemoteDataSource {
  Future<Unit> updateUserProfile({required Map<String, dynamic> data});
  Future<Unit> logout();

  Future<Unit> changeCodeVehicle({required String code});
}

class ProfileRemoteImplWithHttp extends ProfileRemoteDataSource {
  final http.Client client;
  ProfileRemoteImplWithHttp({required this.client});

  @override
  Future<Unit> updateUserProfile({required Map<String, dynamic> data}) async {
    final response = await client.patch(
        Uri.parse("$BASE_URL/drivers_update_profile_data/index"),
        headers: HeaderServer.header,
        body: data);

    if (response.statusCode == 200 || response.statusCode == 201) {
      return Future.value(unit);
    } else if (response.statusCode == 401) {
      ErrorTokenAuth.logoutApp();
      throw ServerExecption();
    } else {
      throw ServerExecption();
    }
  }

  @override
  Future<Unit> logout() async {
    var response = await client.post(
      Uri.parse('${BASE_URL}delegate-api/logout'),
      headers: HeaderServer.headerWithToken,
      body: json.encode({"type": Platform.isIOS ? "IOS" : "Android"}),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      return Future.value(unit);
    } else {
      throw ServerExecption();
    }
  }

  @override
  Future<Unit> changeCodeVehicle({required String code}) async {
    final response = await client.post(
        Uri.parse("${BASE_URL}delegate-api/update-code"),
        headers: HeaderServer.headerWithToken,
        body: json.encode({"code": code}));

    if (response.statusCode == 200 || response.statusCode == 201) {
      return Future.value(unit);
    } else {
      final decodeJson = json.decode(response.body);
      throw ServerExecption(message: decodeJson["message"]);
    }
  }
}
