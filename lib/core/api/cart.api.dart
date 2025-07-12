import 'package:almusafir_direct/features/cart/data/models/row_cart.module.dart';
import 'package:almusafir_direct/features/cart/domain/usecases/get_cartusecases.dart';
import 'package:dartz/dartz.dart';

import '../../features/cart/domain/usecases/add_cartusecases.dart';
import '../../features/cart/domain/usecases/delete_cartusecases.dart';
import '../../injection_container.dart' as di;
import '../error/faiture.dart';

class CartApi {
  static Future<Either<Failure, List<RowCartModel>>> fetchRowsCart(
      Map<String, dynamic> data) async {
    try {
      final getCartUescases = di.sl<GetCartUescases>();
      return await getCartUescases(data: data);
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  static Future<Either<Failure, List<RowCartModel>>> addToCart(
      Map<String, dynamic> data) async {
    try {
      final addToCartUescases = di.sl<AddToCartUescases>();
      return await addToCartUescases(data: data);
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  static Future<Either<Failure, List<RowCartModel>>> deleteCart(
      Map<String, dynamic> data) async {
    try {
      final deleteCartUescases = di.sl<DeleteCartUescases>();
      return await deleteCartUescases(data: data);
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
