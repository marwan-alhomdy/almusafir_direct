import 'package:dartz/dartz.dart';

import '../../../../core/error/faiture.dart';
import '../../data/models/row_cart.module.dart';

abstract class CartRepostitory {
  Future<Either<Failure, List<RowCartModel>>> getCart(
      Map<String, dynamic> data);
  Future<Either<Failure, List<RowCartModel>>> addToCart(
      Map<String, dynamic> data);
  Future<Either<Failure, List<RowCartModel>>> deteteCart(
      Map<String, dynamic> data);
}
