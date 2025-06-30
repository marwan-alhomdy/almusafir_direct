import 'package:almusafir_direct/features/shopping/data/models/shop_products/shop_products.dart';
import 'package:dartz/dartz.dart';

import '../../../../../core/error/faiture.dart';
import '../repositories/department_repositories.dart';

class GetShopProductsUescases {
  final DepartmentRepostitory reostitory;
  GetShopProductsUescases(this.reostitory);
  Future<Either<Failure, List<ShopProduct>>> call(
      {required String? orderType, required String? departmentsId}) async {
    return await reostitory.getShopProducts(orderType, departmentsId);
  }
}
