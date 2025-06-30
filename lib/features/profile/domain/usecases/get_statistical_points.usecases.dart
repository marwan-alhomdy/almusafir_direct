import 'package:dartz/dartz.dart';

import '../../../../core/error/faiture.dart';
import '../../data/model/statistical_point_module.dart';
import '../repositories/profile_repositories.dart';

class GetStatisticalPointsUseCases {
  final ProfileRepostitory reostitory;
  GetStatisticalPointsUseCases(this.reostitory);
  //call من اجل نستعدي الدالة باسم الكلاس
  Future<Either<Failure, StatisticalPointModule>> call() async {
    return await reostitory.getStatisticalPoints();
  }
}
