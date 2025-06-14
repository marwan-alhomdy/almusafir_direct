import 'package:dartz/dartz.dart';

import '../../../../core/data/current_user/current_user.dart';
import '../../../../core/error/faiture.dart';
import '../repositories/profile_repositories.dart';

class UpdateUserProfileUsecases {
  final ProfileRepostitory reostitory;
  UpdateUserProfileUsecases(this.reostitory);
  //call من اجل نستعدي الدالة باسم الكلاس
  Future<Either<Failure, CurrentUser>> call(
      {required Map<String, dynamic> data}) async {
    return await reostitory.updateUserProfile(data: data);
  }
}
