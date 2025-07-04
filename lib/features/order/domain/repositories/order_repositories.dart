import 'package:dartz/dartz.dart';

import '../../../../core/error/faiture.dart';
import '../../data/models/order_module/order_module.dart';

abstract class OrderRepostitory {
  Future<Either<Failure, List<OrderModule>>> getCustomerOrders();
}
