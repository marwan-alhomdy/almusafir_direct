import 'package:dartz/dartz.dart';
import '../../../../core/data/models/order.module.dart';
import '../../../../core/error/faiture.dart';
import '../repositories/order_repostitorise.dart';

class FetchOrdersUsecases {
  final OrderRepostitory reostitory;
  FetchOrdersUsecases(this.reostitory);

  Future<Either<Failure, List<OrderModel>>> call() async {
    return await reostitory.fetchOrders();
  }
}
