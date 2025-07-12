import 'package:almusafir_direct/features/cart/data/models/row_cart.module.dart';
import 'package:dartz/dartz.dart';

import '../../../../../../core/error/faiture.dart';
import '../repositories/cart_repositories.dart';

class AddToCartUescases {
  final CartRepostitory reostitory;
  AddToCartUescases(this.reostitory);
  Future<Either<Failure, List<RowCartModel>>> call(
      {required Map<String, dynamic> data}) async {
    return await reostitory.addToCart(data);
  }
}
