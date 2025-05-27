import 'package:dartz/dartz.dart';

import '../../../../../core/error/faiture.dart';
import '../../../../core/data/models/delegate.module.dart';
import '../repositories/home_repositories.dart';

class FetchAllDataUseCases {
  final HomeRepostitory reostitory;
  FetchAllDataUseCases(this.reostitory);
  Future<Either<Failure, DelegateModule>> call() async {
    return await reostitory.fetchAllData();
  }
}
