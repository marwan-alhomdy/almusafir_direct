import 'package:dartz/dartz.dart';

import '../../../../core/error/faiture.dart';
import '../repositories/profile_repositories.dart';

class ContactUsUsecases {
  final ProfileRepostitory reostitory;
  ContactUsUsecases(this.reostitory);

  //call من اجل نستعدي الدالة باسم الكلاس
  Future<Either<Failure, Unit>> call(
      {required Map<String, dynamic> data}) async {
    return await reostitory.contactUs(data: data);
  }
}
