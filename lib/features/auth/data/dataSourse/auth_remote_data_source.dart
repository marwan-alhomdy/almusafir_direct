import 'dart:developer';

import 'package:almusafir_direct/core/data/current_user/current_user.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/constants/cached/cached_name.dart';
import '../../../../core/constants/endpoint.dart';
import '../../../../core/data/current_user/data.dart';
import '../../../../core/error/exception.dart';
import '../../../../core/services/api.service.dart';
import '../../../../helper/cache_helper.dart';

abstract class AuthRemoteDataSource {
  Future<CurrentUser> login({required Map<String, dynamic> data});

  Future<CurrentUser> register({required Map<String, dynamic> data});

  Future<Unit> sendActivation({required Map<String, dynamic> data});

  Future<CurrentUser> checkActivation({required Map<String, dynamic> data});
}

class AuthRemoteImplWithDio extends AuthRemoteDataSource {
  final ApiService apiService;
  AuthRemoteImplWithDio({required this.apiService});
  @override
  Future<CurrentUser> login({required Map<String, dynamic> data}) async {
    final response =
        await apiService.post(endPoint: EndPointName.login, data: data);

    return getCurrentUser(response);
  }

  @override
  Future<CurrentUser> register({required Map<String, dynamic> data}) async {
    log(data.toString());
    final response = await apiService.postWithGetAllResponse(
        endPoint: EndPointName.register, data: data);

    if (response?.statusCode == 203) {
      throw AccountNotActiveExecption();
    }
    return getCurrentUser(response.data);
  }

  @override
  Future<Unit> sendActivation({required Map<String, dynamic> data}) async {
    await apiService.post(endPoint: EndPointName.sendVerify, data: data);
    return Future.value(unit);
  }

  @override
  Future<CurrentUser> checkActivation(
      {required Map<String, dynamic> data}) async {
    final response =
        await apiService.post(endPoint: EndPointName.checkVerify, data: data);

    return getCurrentUser(response);
  }

  CurrentUser getCurrentUser(dynamic response) {
    final token = response?["token_data"]?["token"];
    if (token != null) {
      CacheHelper.setString(CachedAppKey.authToken, token);
      CacheHelper.setBool(CachedAppKey.isAuth, true);
    } else if (response.containsKey("token")) {
      CacheHelper.setString(CachedAppKey.authToken, response["token"]);
      CacheHelper.setBool(CachedAppKey.isAuth, true);
    }

    final user = DataCurrentUser.fromJson(response["profile"]);
    return CurrentUser(data: user);
  }
}
