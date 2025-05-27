import 'package:dartz/dartz.dart';

import '../../../../core/data/models/user_model.module.dart';
import '../../../../core/error/faiture.dart';
import '../repositories/auth_repostitorise.dart';

class LoginUseCases {
  final AuthRepostitory reostitory;
  LoginUseCases(this.reostitory);
  Future<Either<Failure, UserModel>> call(
      {required String username, required String password}) async {
    return await reostitory.login(username: username, password: password);
  }
}
