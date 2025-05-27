import 'package:dartz/dartz.dart';
import '../../../../core/data/models/order.module.dart';
import '../../../../core/error/faiture.dart';
import '../repositories/order_repostitorise.dart';

class CreateOrderUsecases {
  final OrderRepostitory reostitory;
  CreateOrderUsecases(this.reostitory);

  Future<Either<Failure, OrderModel>> call({
    required Map data,
  }) async {
    return await reostitory.createOrder(data: data);
  }
}
