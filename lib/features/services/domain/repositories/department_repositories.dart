import 'package:dartz/dartz.dart';

import '../../../../core/data/models/department/data.dart';
import '../../../../core/error/faiture.dart';
import '../../data/models/department_type/department_type.dart';

abstract class DepartmentRepostitory {
  Future<Either<Failure, List<ShoppingDepartments>>> getDepartments(
      String orderType, String tagsTypeId);
  Future<Either<Failure, List<DepartmentType>>> getTypeDepartments(
      String orderType);
}
