import 'package:almusafir_direct/core/data/shop_products/shop_products.dart';
import 'package:dartz/dartz.dart';

import '../../../../../core/error/faiture.dart';
import '../repositories/service_repositories.dart';

class GetOtherServicesUescases {
  final ServiceRepostitory reostitory;
  GetOtherServicesUescases(this.reostitory);
  Future<Either<Failure, List<ShopProduct>>> call(
      {required String? orderType}) async {
    return await reostitory.getProducts(orderType);
  }
}
