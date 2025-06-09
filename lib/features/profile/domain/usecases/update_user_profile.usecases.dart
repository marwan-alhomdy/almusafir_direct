import 'package:dartz/dartz.dart';

import '../../../../core/error/faiture.dart';
import '../../../home/data/model/current_user/current_user.dart';
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
