import 'package:dartz/dartz.dart';

import '../../../../core/controller/work_on_servers/network/network_info.dart';
import '../../../../core/error/exception.dart';
import '../../../../core/error/faiture.dart';
import '../../domain/entities/notification.dart';
import '../../domain/repositories/notifcation_repostitorise.dart';
import '../dataSourse/notification_datasourse.dart';

class NotifcationRepostitoryImpl extends NotifcationRepostitory {
  final NotifactionDataRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;
  NotifcationRepostitoryImpl(
      {required this.remoteDataSource, required this.networkInfo});

  @override
  Future<Either<Failure, Unit>> readNotification({required int id}) async {
    if (await networkInfo.isConnected) {
      try {
        final remotePosts = await remoteDataSource.readNotification(id: id);
        return Right(remotePosts);
      } on ServerExecption {
        return Left(ServerFailure());
      } catch (e) {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, List<Notification>>> getNotification() async {
    if (await networkInfo.isConnected) {
      try {
        final remotePosts = await remoteDataSource.getNofiication();
        return Right(remotePosts);
      } on ServerExecption {
        return Left(ServerFailure());
      } catch (e) {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
