import 'package:dartz/dartz.dart';

import '../../../../core/data/models/department/data.dart';
import '../../../../core/error/faiture.dart';
import '../../../shopping/data/models/department_type/department_type.dart';

abstract class ExploreRepostitory {
  Future<Either<Failure, List<ShoppingDepartment>>> getExplores(
      String orderType, String tagsTypeId);
  Future<Either<Failure, List<DepartmentType>>> getTypeExplores(
      String orderType);
}
