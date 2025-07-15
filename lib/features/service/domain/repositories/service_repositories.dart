import 'package:dartz/dartz.dart';

import '../../../../core/data/shop_products/shop_products.dart';
import '../../../../core/error/faiture.dart';

abstract class ServiceRepostitory {
  Future<Either<Failure, List<ShopProduct>>> getProducts(String? orderType);
}
