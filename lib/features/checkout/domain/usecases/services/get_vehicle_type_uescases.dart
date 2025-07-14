import 'package:dartz/dartz.dart';

import '../../../../../../core/error/faiture.dart';
import '../../../../../core/data/service.module.dart';
import '../../repositories/checkout_repositories.dart';

class GetVehicleTypeUescases {
  final CheckoutRepostitory reostitory;
  GetVehicleTypeUescases(this.reostitory);
  Future<Either<Failure, List<ServiceModul>>> call() async {
    return await reostitory.getAllVehicleTypes();
  }
}
