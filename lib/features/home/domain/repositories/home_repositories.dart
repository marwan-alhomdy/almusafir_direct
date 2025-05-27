import 'package:dartz/dartz.dart';

import '../../../../core/error/faiture.dart';
import '../../data/model/getalldata/getalldata.dart';

abstract class HomeRepostitory {
  Future<Either<Failure, Getalldata>> fetchAllData();
}
