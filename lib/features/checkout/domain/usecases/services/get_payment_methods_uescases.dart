import 'package:dartz/dartz.dart';

import '../../../../../../core/error/faiture.dart';
import '../../../../../core/data/service.module.dart';
import '../../repositories/checkout_repositories.dart';

class GetPaymentMethodsUescases {
  final CheckoutRepostitory reostitory;
  GetPaymentMethodsUescases(this.reostitory);
  Future<Either<Failure, List<ServiceModul>>> call(String? orderType) async {
    return await reostitory.getPaymentMethods(orderType);
  }
}
