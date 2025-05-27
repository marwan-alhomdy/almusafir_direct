import 'package:dartz/dartz.dart';
import '../../../../core/error/faiture.dart';
import '../repositories/profile_repositories.dart';

class LogoutDriverUseCases {
  final ProfileRepostitory reostitory;
  LogoutDriverUseCases(this.reostitory);
  //call من اجل نستعدي الدالة باسم الكلاس
  Future<Either<Failure, Unit>> call() async {
    return await reostitory.logout();
  }
}
