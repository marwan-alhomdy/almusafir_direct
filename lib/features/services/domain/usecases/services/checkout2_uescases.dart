import 'package:dartz/dartz.dart';

import '../../../../../../core/error/faiture.dart';
import '../../repositories/services_repositories.dart';

class Checkout2Uescases {
  final ServicesRepostitory reostitory;
  Checkout2Uescases(this.reostitory);
  Future<Either<Failure, dynamic>> call(
      {required Map<String, dynamic> data}) async {
    return await reostitory.checkout2(data);
  }
}
