import 'package:dartz/dartz.dart';

import '../../../../../core/error/faiture.dart';
import '../../../shopping/data/models/department_type/department_type.dart';
import '../repositories/explore_repositories.dart';

class GetTypeExploresUescases {
  final ExploreRepostitory reostitory;
  GetTypeExploresUescases(this.reostitory);
  Future<Either<Failure, List<DepartmentType>>> call(
      {required String orderType}) async {
    return await reostitory.getTypeExplores(orderType);
  }
}
