import 'package:dartz/dartz.dart';

import '../../../../../core/error/faiture.dart';
import '../../../../core/data/models/department/data.dart';
import '../repositories/explore_repositories.dart';

class GetExploresUescases {
  final ExploreRepostitory reostitory;
  GetExploresUescases(this.reostitory);
  Future<Either<Failure, List<ShoppingDepartment>>> call(
      {required String orderType, required String tagsTypeId}) async {
    return await reostitory.getExplores(orderType, tagsTypeId);
  }
}
