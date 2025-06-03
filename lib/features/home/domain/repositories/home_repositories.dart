import 'package:dartz/dartz.dart';

import '../../../../core/error/faiture.dart';
import '../../data/model/getalldata/primary_data.dart';

abstract class HomeRepostitory {
  Future<Either<Failure, PrimaryData>> fetchAllData();
}
