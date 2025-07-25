import 'package:dartz/dartz.dart';

import '../../../../core/data/current_user/current_user.dart';
import '../../../../core/error/faiture.dart';

abstract class AuthRepostitory {
  Future<Either<Failure, CurrentUser>> login(
      {required Map<String, dynamic> data});

  Future<Either<Failure, CurrentUser>> register(
      {required Map<String, dynamic> data});

  Future<Either<Failure, Unit>> sendActivation(
      {required Map<String, dynamic> data});

  Future<Either<Failure, CurrentUser>> checkActivation(
      {required Map<String, dynamic> data});
}
