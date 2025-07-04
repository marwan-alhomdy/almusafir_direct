import 'package:dartz/dartz.dart';

import '../../../../../../core/error/faiture.dart';
import '../../data/models/order_module/order_module.dart';
import '../repositories/order_repositories.dart';

class GetOrdersUescases {
  final OrderRepostitory reostitory;
  GetOrdersUescases(this.reostitory);
  Future<Either<Failure, List<OrderModule>>> call() async {
    return await reostitory.getCustomerOrders();
  }
}
