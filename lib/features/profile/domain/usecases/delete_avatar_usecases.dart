import 'package:dartz/dartz.dart';

import '../../../../core/error/faiture.dart';
import '../repositories/profile_repositories.dart';

class DeleteAvatarUsecases {
  final ProfileRepostitory reostitory;
  DeleteAvatarUsecases(this.reostitory);

  //call من اجل نستعدي الدالة باسم الكلاس
  Future<Either<Failure, Unit>> call() async {
    return await reostitory.deleteAvatar();
  }
}
