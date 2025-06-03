import 'package:dartz/dartz.dart';

import '../../../../core/error/faiture.dart';
import '../../../home/data/model/current_user/current_user.dart';

abstract class AuthRepostitory {
  Future<Either<Failure, CurrentUser>> login(
      {required Map<String, dynamic> data});

  Future<Either<Failure, Unit>> resendOtp({required String mobile});

  Future<Either<Failure, CurrentUser>> register(
      {required Map<String, dynamic> data});

  Future<Either<Failure, Unit>> sendActivation(
      {required Map<String, dynamic> data});

  Future<Either<Failure, Unit>> validateOtpCode(
      {required Map<String, dynamic> data});

  Future<Either<Failure, CurrentUser>> checkActivation(
      {required Map<String, dynamic> data});
}
