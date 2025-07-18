import 'package:dartz/dartz.dart';

import '../../../../core/data/service.module.dart';
import '../../../../core/error/faiture.dart';
import '../../data/models/checkout_module.dart';

abstract class CheckoutRepostitory {
  Future<Either<Failure, CheckoutModule>> checkout2(Map<String, dynamic> data);

  Future<Either<Failure, List<ServiceModul>>> getAirport(
      Map<String, dynamic> data);

  Future<Either<Failure, List<ServiceModul>>> getFlights(String orderType);

  Future<Either<Failure, List<ServiceModul>>> getAllVehicleTypes();

  Future<Either<Failure, List<ServiceModul>>> getLoadsTypes(String orderType);

  Future<Either<Failure, List<ServiceModul>>> getPaymentMethods(
      String? orderType);
}
