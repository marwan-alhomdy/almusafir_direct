import 'package:dartz/dartz.dart';

import '../../../../core/data/models/delegate.module.dart';
import '../../../../core/error/faiture.dart';

abstract class HomeRepostitory {
  Future<Either<Failure, DelegateModule>> fetchAllData();
}
