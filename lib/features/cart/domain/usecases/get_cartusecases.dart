import 'package:almusafir_direct/features/cart/data/models/row_cart.module.dart';
import 'package:dartz/dartz.dart';

import '../../../../../../core/error/faiture.dart';
import '../repositories/cart_repositories.dart';

class GetCartUescases {
  final CartRepostitory reostitory;
  GetCartUescases(this.reostitory);
  Future<Either<Failure, List<RowCartModel>>> call(
      {required Map<String, dynamic> data}) async {
    return await reostitory.getCart(data);
  }
}
