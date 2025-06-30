import 'package:dartz/dartz.dart';

import '../../../../core/data/current_user/avatar.dart';
import '../../../../core/data/current_user/current_user.dart';
import '../../../../core/data/service.module.dart';
import '../../../../core/error/faiture.dart';
import '../../data/model/point_module.dart';
import '../../data/model/referral.dart';
import '../../data/model/statistical_point_module.dart';

abstract class ProfileRepostitory {
  Future<Either<Failure, CurrentUser>> updateUserProfile(
      {required Map<String, dynamic> data});

  Future<Either<Failure, Unit>> logout();

  Future<Either<Failure, Unit>> deleteAccount();

  Future<Either<Failure, Avatar>> changeAvatar({required String avater});

  Future<Either<Failure, Unit>> deleteAvatar();

  Future<Either<Failure, Unit>> contactUs({required Map<String, dynamic> data});

  Future<Either<Failure, Referral>> getReferral();

  Future<Either<Failure, List<PointModule>>> getPoints();

  Future<Either<Failure, StatisticalPointModule>> getStatisticalPoints();

  Future<Either<Failure, List<ServiceModul>>> getPaymentMethodsAvailable();
}
