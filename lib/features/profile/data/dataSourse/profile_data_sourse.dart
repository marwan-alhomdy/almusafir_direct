import 'dart:convert';
import 'dart:developer';
import 'dart:io' show File, Platform;

import 'package:almusafir_direct/core/data/current_user/avatar.dart';
import 'package:almusafir_direct/core/services/api.service.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/constants/endpoint.dart';
import '../../../../core/data/current_user/current_user.dart';
import '../../../../core/data/current_user/data.dart';
import '../../../../core/server/header_server.dart';

abstract class ProfileRemoteDataSource {
  Future<CurrentUser> updateUserProfile({required Map<String, dynamic> data});
  Future<Unit> logout();
  Future<Unit> deleteAccount();
  Future<Avatar> changeAvatar({required String avater});
  Future<Unit> deleteAvatar();
  Future<Unit> contactUs({required Map<String, dynamic> data});
}

class ProfileRemoteImpWithDio extends ProfileRemoteDataSource {
  final ApiService client;
  ProfileRemoteImpWithDio({required this.client});

  @override
  Future<CurrentUser> updateUserProfile(
      {required Map<String, dynamic> data}) async {
    final response = await client.put(
        endPoint: EndPointName.me,
        headers: HeaderServer.headerWithToken,
        data: data);

    final user = DataCurrentUser.fromJson(response);
    return CurrentUser(data: user);
  }

  @override
  Future<Unit> logout() async {
    await client.post(
        endPoint: EndPointName.logout,
        headers: HeaderServer.headerWithToken,
        data: json.encode({"type": Platform.isIOS ? "IOS" : "Android"}));

    return Future.value(unit);
  }

  @override
  Future<Unit> deleteAccount() async {
    await client.delete(
        endPoint: EndPointName.deleteAccount,
        headers: HeaderServer.headerWithToken);

    return Future.value(unit);
  }

  @override
  Future<Avatar> changeAvatar({required String avater}) async {
    final response = await client.updateFile(
      endPoint: EndPointName.avatar,
      fileField: "avatar_file",
      headers: HeaderServer.headerWithTokenFile,
      file: File(avater),
    );
    log(response.toString());

    return Avatar.fromJson(response["process_data"]["upload_image"]);
  }

  @override
  Future<Unit> deleteAvatar() async {
    await client.delete(
      endPoint: EndPointName.avatar,
      headers: HeaderServer.headerWithToken,
    );
    return Future.value(unit);
  }

  @override
  Future<Unit> contactUs({required Map<String, dynamic> data}) async {
    await client.post(
      endPoint: EndPointName.contactUs,
      headers: HeaderServer.headerWithToken,
      data: data,
    );
    return Future.value(unit);
  }
}
