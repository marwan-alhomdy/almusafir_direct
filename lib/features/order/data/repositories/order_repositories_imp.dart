import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/error/exception.dart';
import '../../../../core/error/faiture.dart';
import '../../../../core/services/network_info.dart';
import '../../domain/repositories/order_repositories.dart';
import '../datasources/order_remote_datasources.dart';
import '../models/order_module/order_module.dart';

class OrderRepostitoryImp extends OrderRepostitory {
  final OrderRemoteDataSource remoteDataSource;

  final NetworkInfo networkInfo;

  OrderRepostitoryImp(
      {required this.remoteDataSource, required this.networkInfo});

  @override
  Future<Either<Failure, List<OrderModule>>> getCustomerOrders() async {
    if (await networkInfo.isConnected) {
      try {
        final remotePosts = await remoteDataSource.getCustomerOrders();
        return Right(remotePosts);
      } on ServerExecption catch (e) {
        return Left(ServerFailure(e.message ?? ""));
      } on DioException catch (e) {
        return Left(DioFailure.fromDiorError(e));
      } catch (e) {
        return Left(ServerFailure(e.toString()));
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
