import 'package:dartz/dartz.dart';

import '../../../../../core/error/faiture.dart';
import '../../data/models/service.module.dart';
import '../repositories/services_repositories.dart';

class GetPaymentMethodsUescases {
  final ServicesRepostitory reostitory;
  GetPaymentMethodsUescases(this.reostitory);
  Future<Either<Failure, List<ServiceModul>>> call() async {
    return await reostitory.getPaymentMethods();
  }
}
