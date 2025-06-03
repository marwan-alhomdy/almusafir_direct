import 'package:dartz/dartz.dart';

import '../../../../../core/error/faiture.dart';
import '../../data/model/getalldata/primary_data.dart';
import '../repositories/home_repositories.dart';

class FetchAllDataUseCases {
  final HomeRepostitory reostitory;
  FetchAllDataUseCases(this.reostitory);
  Future<Either<Failure, PrimaryData>> call() async {
    return await reostitory.fetchAllData();
  }
}
