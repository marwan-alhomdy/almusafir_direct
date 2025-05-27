import 'package:dartz/dartz.dart';
import '../../../../core/error/faiture.dart';
import '../repositories/auth_repostitorise.dart';

class VerigyOtpUseCases {
  final AuthRepostitory reostitory;
  VerigyOtpUseCases(this.reostitory);

  Future<Either<Failure, dynamic>> call(
      {required String mobile,
      required String otp,
      required Map fcbTocken}) async {
    return await reostitory.verifyOtp(
        mobile: mobile, otp: otp, fcbTocken: fcbTocken);
  }
}
