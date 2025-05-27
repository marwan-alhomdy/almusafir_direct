import 'package:dartz/dartz.dart';
import '../entities/notification.dart';
import '../../../../core/error/faiture.dart';

abstract class NotifcationRepostitory {
  Future<Either<Failure, Unit>> readNotification({required int id});
  Future<Either<Failure, List<Notification>>> getNotification();
}
