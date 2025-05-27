import 'package:dartz/dartz.dart';

import '../../../../../core/error/faiture.dart';
import '../../data/model/getalldata/getalldata.dart';
import '../repositories/home_repositories.dart';

class FetchAllDataUseCases {
  final HomeRepostitory reostitory;
  FetchAllDataUseCases(this.reostitory);
  Future<Either<Failure, Getalldata>> call() async {
    return await reostitory.fetchAllData();
  }
}
