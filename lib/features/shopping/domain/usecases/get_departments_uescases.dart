import 'package:dartz/dartz.dart';

import '../../../../../core/error/faiture.dart';
import '../../../../core/data/models/department/data.dart';
import '../repositories/department_repositories.dart';

class GetDepartmentsUescases {
  final DepartmentRepostitory reostitory;
  GetDepartmentsUescases(this.reostitory);
  Future<Either<Failure, List<ShoppingDepartment>>> call(
      {required String orderType, required String tagsTypeId}) async {
    return await reostitory.getDepartments(orderType, tagsTypeId);
  }
}
