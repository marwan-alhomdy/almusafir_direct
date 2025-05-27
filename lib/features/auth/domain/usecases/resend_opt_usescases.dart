import 'package:dartz/dartz.dart';
import '../../../../core/error/faiture.dart';

import '../repositories/auth_repostitorise.dart';

class ResendOptUseCases {
  final AuthRepostitory reostitory;
  ResendOptUseCases(this.reostitory);

  Future<Either<Failure, Unit>> call({required String mobile}) async {
    return await reostitory.resendOtp(mobile: mobile);
  }
}
