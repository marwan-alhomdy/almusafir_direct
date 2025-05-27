import 'package:dartz/dartz.dart';
import '../../../../core/data/models/user_model.module.dart';
import '../../../../core/error/faiture.dart';

abstract class AuthRepostitory {
  Future<Either<Failure, UserModel>> login(
      {required String username, required String password});
  Future<Either<Failure, dynamic>> verifyOtp(
      {required String mobile, required String otp, required Map fcbTocken});
  Future<Either<Failure, Unit>> resendOtp({required String mobile});
}
