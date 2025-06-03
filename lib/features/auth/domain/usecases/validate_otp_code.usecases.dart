import 'package:dartz/dartz.dart';

import '../../../../core/error/faiture.dart';
import '../repositories/auth_repostitorise.dart';

class ValidateOtpCodeUseCases {
  final AuthRepostitory reostitory;
  ValidateOtpCodeUseCases(this.reostitory);

  Future<Either<Failure, Unit>> call(
      {required Map<String, dynamic> data}) async {
    return await reostitory.validateOtpCode(data: data);
  }
}
