import 'package:dartz/dartz.dart';
import '../../../../core/error/faiture.dart';
import '../repositories/order_repostitorise.dart';

class UpdateOrderUsecases {
  final OrderRepostitory reostitory;
  UpdateOrderUsecases(this.reostitory);

  Future<Either<Failure, Unit>> call({
    required Map data,
  }) async {
    return await reostitory.updateOrder(data: data);
  }
}
