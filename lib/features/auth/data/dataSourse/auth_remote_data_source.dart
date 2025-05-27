import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../../../../core/constants/cached/cached_name.dart';
import '../../../../core/constants/config.dart';
import '../../../../core/data/models/user_model.module.dart';
import '../../../../core/error/exception.dart';
import '../../../../core/server/header_server.dart';
import '../../../../helper/cache_helper.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> login({required String username, required String password});
  Future<dynamic> verifyOtp({
    required String mobile,
    required String otp,
    required Map fcbTocken,
  });

  Future<Unit> resendOtp({required String mobile});
}

class AuthRemoteImplWithHttp extends AuthRemoteDataSource {
  final http.Client client;
  AuthRemoteImplWithHttp({required this.client});
  @override
  Future<UserModel> login(
      {required String username, required String password}) async {
    var parameters = {
      "username": username,
      "password": password,
    };

    final response = await client.post(
        Uri.parse("${BASE_URL}delegate-auth/login"),
        headers: HeaderServer.header,
        body: json.encode(parameters));

    log(response.body);
    log(response.statusCode.toString());

    if (response.statusCode == 200 || response.statusCode == 201) {
      final decodeJson = json.decode(response.body);
      return UserModel.fromJson(decodeJson);
    } else {
      final decodeJson = json.decode(response.body);
      throw ServerExecption(message: decodeJson["message"]);
    }
  }

  @override
  Future<dynamic> verifyOtp({
    required String mobile,
    required String otp,
    required Map fcbTocken,
  }) async {
    final response = await client.post(Uri.parse("${BASE_URL}verify-otp"),
        headers: HeaderServer.header,
        body: json.encode({
          "mobile": mobile,
          "otp": otp,
          "FCM_token": {"type": fcbTocken["type"], "token": fcbTocken["token"]}
        }));
    if (response.statusCode == 200 || response.statusCode == 201) {
      CacheHelper.removeAt(CachedAppKey.deleagete);
      CacheHelper.setString(CachedAppKey.deleagete, response.body);
      final decodeJson = json.decode(response.body);
      CacheHelper.setString(
          CachedAppKey.authToken, decodeJson["data"]["token"]);
      return decodeJson;
    } else if (response.statusCode == 401 || response.statusCode == 400) {
      throw OTPNotValiedExecption();
    } else {
      throw ServerExecption(message: json.decode(response.body)["message"]);
    }
  }

  @override
  Future<Unit> resendOtp({required String mobile}) async {
    final response = await client.post(Uri.parse("${BASE_URL}resend-otp"),
        headers: HeaderServer.header, body: json.encode({"mobile": mobile}));
    if (response.statusCode == 200 || response.statusCode == 201) {
      final decodeJson = json.decode(response.body);
      debugPrint(decodeJson['data']['otp']);
      return Future.value(unit);
    } else {
      throw ServerExecption(message: json.decode(response.body)["message"]);
    }
  }
}
