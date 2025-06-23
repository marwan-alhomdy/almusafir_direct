import 'package:dartz/dartz.dart';

import '../../../../core/error/faiture.dart';
import '../../data/models/service.module.dart';

abstract class ServicesRepostitory {
  Future<Either<Failure, dynamic>> checkout2(Map<String, dynamic> data);

  Future<Either<Failure, List<ServiceModul>>> getAirport(
      Map<String, dynamic> data);

  Future<Either<Failure, List<ServiceModul>>> getFlights(String orderType);

  Future<Either<Failure, List<ServiceModul>>> getAllVehicleTypes();

  Future<Either<Failure, List<ServiceModul>>> getLoadsTypes(String orderType);

  Future<Either<Failure, List<ServiceModul>>> getPaymentMethods();
}
