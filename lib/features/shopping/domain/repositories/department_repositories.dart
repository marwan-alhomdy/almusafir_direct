import 'package:dartz/dartz.dart';

import '../../../../core/data/models/department/data.dart';
import '../../../../core/data/shop_products/shop_products.dart';
import '../../../../core/error/faiture.dart';
import '../../data/models/department_type/department_type.dart';

abstract class DepartmentRepostitory {
  Future<Either<Failure, List<ShoppingDepartment>>> getDepartments(
      String orderType, String tagsTypeId);
  Future<Either<Failure, List<DepartmentType>>> getTypeDepartments(
      String orderType);
  Future<Either<Failure, List<ShopProduct>>> getShopProducts(
      String? orderType, String? departmentsId);
}
