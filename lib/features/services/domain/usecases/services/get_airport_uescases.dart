import 'package:dartz/dartz.dart';

import '../../../../../../core/error/faiture.dart';
import '../../../data/models/service.module.dart';
import '../../repositories/services_repositories.dart';

class GetAirportUescases {
  final ServicesRepostitory reostitory;
  GetAirportUescases(this.reostitory);
  Future<Either<Failure, List<ServiceModul>>> call(
      {required Map<String, dynamic> data}) async {
    return await reostitory.getAirport(data);
  }
}
