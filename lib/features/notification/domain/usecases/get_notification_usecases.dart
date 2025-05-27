import 'package:dartz/dartz.dart';
import '../entities/notification.dart';
import '../../../../core/error/faiture.dart';
import '../repositories/notifcation_repostitorise.dart';

class GetNotificationUseCases {
  final NotifcationRepostitory reostitory;
  GetNotificationUseCases(this.reostitory);

  Future<Either<Failure, List<Notification>>> call() async {
    return await reostitory.getNotification();
  }
}
