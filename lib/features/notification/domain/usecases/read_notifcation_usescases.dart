import 'package:dartz/dartz.dart';
import '../../../../core/error/faiture.dart';
import '../repositories/notifcation_repostitorise.dart';

class ReadNotificationUseCases {
  final NotifcationRepostitory reostitory;
  ReadNotificationUseCases(this.reostitory);

  Future<Either<Failure, Unit>> call({required int id}) async {
    return await reostitory.readNotification(
      id: id,
    );
  }
}
