import 'package:dartz/dartz.dart';

import '../../../../core/data/models/user_model.module.dart';
import '../../../../core/services/api.service.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> login({required String username, required String password});
  Future<dynamic> verifyOtp({
    required String mobile,
    required String otp,
    required Map fcbTocken,
  });

  Future<Unit> resendOtp({required String mobile});
}

class AuthRemoteImplWithDio extends AuthRemoteDataSource {
  final ApiService apiService;
  AuthRemoteImplWithDio({required this.apiService});
  @override
  Future<UserModel> login(
      {required String username, required String password}) async {
    final response = await apiService.post(
      endPoint: "delegate-auth/login",
      data: {"username": username, "password": password},
    );
    return UserModel.fromJson(response);
  }

  @override
  Future<dynamic> verifyOtp({
    required String mobile,
    required String otp,
    required Map fcbTocken,
  }) async {
    final response = await apiService.post(
      endPoint: "verify-otp",
      data: {
        "mobile": mobile,
        "otp": otp,
        "FCM_token": {"type": fcbTocken["type"], "token": fcbTocken["token"]}
      },
    );
    return response;
  }

  @override
  Future<Unit> resendOtp({required String mobile}) async {
    await apiService.post(endPoint: "resend-otp", data: {"mobile": mobile});
    return Future.value(unit);
  }
}
