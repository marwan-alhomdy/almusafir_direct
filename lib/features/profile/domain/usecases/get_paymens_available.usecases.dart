import 'package:dartz/dartz.dart';

import '../../../../core/data/service.module.dart';
import '../../../../core/error/faiture.dart';
import '../repositories/profile_repositories.dart';

class GetPaymentMethodsAvailablesUsecases {
  final ProfileRepostitory reostitory;
  GetPaymentMethodsAvailablesUsecases(this.reostitory);
  //call من اجل نستعدي الدالة باسم الكلاس
  Future<Either<Failure, List<ServiceModul>>> call() async {
    return await reostitory.getPaymentMethodsAvailable();
  }
}
