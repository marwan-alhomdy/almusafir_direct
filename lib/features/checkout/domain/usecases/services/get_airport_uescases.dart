import 'package:dartz/dartz.dart';

import '../../../../../../core/error/faiture.dart';
import '../../../../../core/data/service.module.dart';
import '../../repositories/checkout_repositories.dart';

class GetAirportUescases {
  final CheckoutRepostitory reostitory;
  GetAirportUescases(this.reostitory);
  Future<Either<Failure, List<ServiceModul>>> call(
      {required Map<String, dynamic> data}) async {
    return await reostitory.getAirport(data);
  }
}
