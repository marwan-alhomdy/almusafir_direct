import 'package:dartz/dartz.dart';

import '../../../../core/error/faiture.dart';
import '../../../home/data/model/current_user/avatar.dart';
import '../../../home/data/model/current_user/current_user.dart';

abstract class ProfileRepostitory {
  Future<Either<Failure, CurrentUser>> updateUserProfile(
      {required Map<String, dynamic> data});

  Future<Either<Failure, Unit>> logout();

  Future<Either<Failure, Unit>> deleteAccount();

  Future<Either<Failure, Avatar>> changeAvatar({required String avater});

  Future<Either<Failure, Unit>> deleteAvatar();
}
