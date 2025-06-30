import 'package:dartz/dartz.dart';

import '../../../../../core/error/faiture.dart';
import '../../data/models/department_type/department_type.dart';
import '../repositories/department_repositories.dart';

class GetTypeDepartmentsUescases {
  final DepartmentRepostitory reostitory;
  GetTypeDepartmentsUescases(this.reostitory);
  Future<Either<Failure, List<DepartmentType>>> call(
      {required String orderType}) async {
    return await reostitory.getTypeDepartments(orderType);
  }
}
