import 'package:dartz/dartz.dart';

import '../../../../../../core/error/faiture.dart';
import '../../../../../core/data/service.module.dart';
import '../../repositories/services_repositories.dart';

class GetFlightsUescases {
  final ServicesRepostitory reostitory;
  GetFlightsUescases(this.reostitory);
  Future<Either<Failure, List<ServiceModul>>> call(String orderType) async {
    return await reostitory.getFlights(orderType);
  }
}
