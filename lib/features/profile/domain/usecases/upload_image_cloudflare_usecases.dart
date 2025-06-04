import 'package:dartz/dartz.dart';

import '../../../../core/data/custom/cloudflare.module.dart';
import '../../../../core/error/faiture.dart';
import '../repositories/profile_repositories.dart';

class UploadImageWithCloudflareUseCases {
  final ProfileRepostitory reostitory;
  UploadImageWithCloudflareUseCases(this.reostitory);
  //call من اجل نستعدي الدالة باسم الكلاس
  Future<Either<Failure, Cloudflare>> call(
      {required String newImage,
      required String? currentImage,
      required String mobile}) async {
    return await reostitory.uploadImageWithCloudflare(
        newImage: newImage, currentImage: currentImage, mobile: mobile);
  }
}
