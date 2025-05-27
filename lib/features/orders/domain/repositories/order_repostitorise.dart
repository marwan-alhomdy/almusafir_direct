import 'package:dartz/dartz.dart';
import '../../../../core/data/models/order.module.dart';
import '../../../../core/error/faiture.dart';

abstract class OrderRepostitory {
  Future<Either<Failure, List<OrderModel>>> fetchOrders();
  Future<Either<Failure, OrderModel>> createOrder({required Map data});
  Future<Either<Failure, Unit>> updateOrder({required Map data});
  Future<Either<Failure, Unit>> cancelOrder({required Map data});
}
