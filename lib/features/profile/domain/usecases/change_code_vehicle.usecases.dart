import 'package:dartz/dartz.dart';

import '../../../../core/error/faiture.dart';
import '../repositories/profile_repositories.dart';

class ChangeCodeVehicleUsecases {
  final ProfileRepostitory reostitory;
  ChangeCodeVehicleUsecases(this.reostitory);
  //call من اجل نستعدي الدالة باسم الكلاس
  Future<Either<Failure, Unit>> call({required String code}) async {
    return await reostitory.changeCodeVehicle(code: code);
  }
}
