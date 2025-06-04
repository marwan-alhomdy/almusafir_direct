import 'package:dartz/dartz.dart';

import '../../../../core/data/custom/cloudflare.module.dart';
import '../../../../core/error/faiture.dart';

abstract class ProfileRepostitory {
  Future<Either<Failure, Unit>> updateUserProfile(
      {required Map<String, dynamic> data});

  Future<Either<Failure, Unit>> logout();
  Future<Either<Failure, Unit>> deleteAccount();
  Future<Either<Failure, Cloudflare>> uploadImageWithCloudflare(
      {required String newImage,
      required String? currentImage,
      required String mobile});

  Future<Either<Failure, Unit>> changeCodeVehicle({required String code});
}
