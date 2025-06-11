import 'package:dartz/dartz.dart';

import '../../../../core/data/current_user/avatar.dart';
import '../../../../core/error/faiture.dart';
import '../repositories/profile_repositories.dart';

class ChangeAvatarUsecases {
  final ProfileRepostitory reostitory;
  ChangeAvatarUsecases(this.reostitory);

  //call من اجل نستعدي الدالة باسم الكلاس
  Future<Either<Failure, Avatar>> call({required String avater}) async {
    return await reostitory.changeAvatar(avater: avater);
  }
}
