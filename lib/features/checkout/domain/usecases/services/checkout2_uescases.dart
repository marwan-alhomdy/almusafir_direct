import 'package:dartz/dartz.dart';

import '../../../../../../core/error/faiture.dart';
import '../../../data/models/checkout_module.dart';
import '../../repositories/checkout_repositories.dart';

class Checkout2Uescases {
  final CheckoutRepostitory reostitory;
  Checkout2Uescases(this.reostitory);
  Future<Either<Failure, CheckoutModule>> call(
      {required Map<String, dynamic> data}) async {
    return await reostitory.checkout2(data);
  }
}
