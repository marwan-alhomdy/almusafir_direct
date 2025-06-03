import 'dart:convert';
import 'dart:io' show Platform;

import 'package:almusafir_direct/core/services/api.service.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/constants/endpoint.dart';
import '../../../../core/server/header_server.dart';

abstract class ProfileRemoteDataSource {
  Future<Unit> updateUserProfile({required Map<String, dynamic> data});
  Future<Unit> logout();
  Future<Unit> deleteAccount();
  Future<Unit> changeCodeVehicle({required String code});
}

class ProfileRemoteImpWithDio extends ProfileRemoteDataSource {
  final ApiService client;
  ProfileRemoteImpWithDio({required this.client});

  @override
  Future<Unit> updateUserProfile({required Map<String, dynamic> data}) async {
    await client.post(
        endPoint: "drivers_update_profile_data/index",
        headers: HeaderServer.headerWithToken,
        data: data);

    return Future.value(unit);
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
  Future<Unit> changeCodeVehicle({required String code}) async {
    await client.post(
        endPoint: "delegate-api/update-code",
        headers: HeaderServer.headerWithToken,
        data: json.encode({"code": code}));

    return Future.value(unit);
  }
}
