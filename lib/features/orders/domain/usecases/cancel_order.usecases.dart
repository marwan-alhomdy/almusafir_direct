import 'package:dartz/dartz.dart';
import '../../../../core/error/faiture.dart';

import '../repositories/order_repostitorise.dart';

class CancelOrderUsecases {
  final OrderRepostitory reostitory;
  CancelOrderUsecases(this.reostitory);

  Future<Either<Failure, Unit>> call({
    required Map data,
  }) async {
    return await reostitory.cancelOrder(data: data);
  }
}
