import 'package:dartz/dartz.dart';

import '../../../../core/data/current_user/current_user.dart';
import '../../../../core/error/faiture.dart';
import '../repositories/auth_repostitorise.dart';

class CheckActivationUseCases {
  final AuthRepostitory reostitory;
  CheckActivationUseCases(this.reostitory);

  Future<Either<Failure, CurrentUser>> call(
      {required Map<String, dynamic> data}) async {
    return await reostitory.checkActivation(data: data);
  }
}
