import 'dart:developer';

import 'package:almusafir_direct/features/home/data/model/current_user/current_user.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/constants/cached/cached_name.dart';
import '../../../../core/constants/endpoint.dart';
import '../../../../core/services/api.service.dart';
import '../../../../helper/cache_helper.dart';
import '../../../home/data/model/current_user/data.dart';

abstract class AuthRemoteDataSource {
  Future<CurrentUser> login({required Map<String, dynamic> data});

  Future<Unit> resendOtp({required String mobile});

  Future<CurrentUser> register({required Map<String, dynamic> data});

  Future<Unit> sendActivation({required Map<String, dynamic> data});

  Future<Unit> validateOtpCode({required Map<String, dynamic> data});

  Future<CurrentUser> checkActivation({required Map<String, dynamic> data});
}

class AuthRemoteImplWithDio extends AuthRemoteDataSource {
  final ApiService apiService;
  AuthRemoteImplWithDio({required this.apiService});
  @override
  Future<CurrentUser> login({required Map<String, dynamic> data}) async {
    final response =
        await apiService.post(endPoint: EndPointName.login, data: data);

    log(response.toString());
    return getCurrentUser(response);
  }

  @override
  Future<Unit> resendOtp({required String mobile}) async {
    final response = await apiService
        .post(endPoint: EndPointName.resendOtp, data: {"mobile": mobile});
    log(response.toString());
    return Future.value(unit);
  }

  @override
  Future<CurrentUser> register({required Map<String, dynamic> data}) async {
    log(data.toString());
    final response =
        await apiService.post(endPoint: EndPointName.register, data: data);
    log(response.toString());
    return getCurrentUser(response);
  }

  @override
  Future<Unit> sendActivation({required Map<String, dynamic> data}) async {
    log(data.toString());
    final response = await apiService.post(
        endPoint: EndPointName.sendactivation, data: data);

    log(response.toString());
    return Future.value(unit);
  }

  @override
  Future<Unit> validateOtpCode({required Map<String, dynamic> data}) async {
    final response =
        await apiService.post(endPoint: EndPointName.otpValidate, data: data);

    log(response.toString());
    return Future.value(unit);
  }

  @override
  Future<CurrentUser> checkActivation(
      {required Map<String, dynamic> data}) async {
    final response = await apiService.post(
        endPoint: EndPointName.checkActivation, data: data);

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
