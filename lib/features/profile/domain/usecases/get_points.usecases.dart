import 'package:dartz/dartz.dart';

import '../../../../core/error/faiture.dart';
import '../../data/model/point_module.dart';
import '../repositories/profile_repositories.dart';

class GetPointsUseCases {
  final ProfileRepostitory reostitory;
  GetPointsUseCases(this.reostitory);
  //call من اجل نستعدي الدالة باسم الكلاس
  Future<Either<Failure, List<PointModule>>> call() async {
    return await reostitory.getPoints();
  }
}
