import 'package:dartz/dartz.dart';

import '../../../../core/error/faiture.dart';
import '../repositories/auth_repostitorise.dart';

class SendActivationUseCases {
  final AuthRepostitory reostitory;
  SendActivationUseCases(this.reostitory);

  Future<Either<Failure, Unit>> call(
      {required Map<String, dynamic> data}) async {
    return await reostitory.sendActivation(data: data);
  }
}
