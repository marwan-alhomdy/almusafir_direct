import 'package:dartz/dartz.dart';

import '../../../../core/controller/work_on_servers/network/network_info.dart';
import '../../../../core/data/models/order.module.dart';
import '../../../../core/error/exception.dart';
import '../../../../core/error/faiture.dart';
import '../../domain/repositories/order_repostitorise.dart';
import '../datasources/order_remote_datasource.dart';

class OrderRepostitoryImpl extends OrderRepostitory {
  final OrderRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;
  OrderRepostitoryImpl(
      {required this.remoteDataSource, required this.networkInfo});

  @override
  Future<Either<Failure, List<OrderModel>>> fetchOrders() async {
    if (await networkInfo.isConnected) {
      try {
        final remotePosts = await remoteDataSource.fetchOrders();
        return Right(remotePosts);
      } on ServerExecption catch (e) {
        return Left(ServerFailure(e.message.toString()));
      } catch (e) {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> cancelOrder({required Map data}) async {
    if (await networkInfo.isConnected) {
      try {
        final remotePosts = await remoteDataSource.cancelOrder(data: data);
        return Right(remotePosts);
      } on ServerExecption catch (e) {
        return Left(ServerFailure(e.message.toString()));
      } catch (e) {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, OrderModel>> createOrder({required Map data}) async {
    if (await networkInfo.isConnected) {
      try {
        final remotePosts = await remoteDataSource.createOrder(data: data);
        return Right(remotePosts);
      } on ServerExecption catch (e) {
        return Left(ServerFailure(e.message.toString()));
      } catch (e) {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> updateOrder({required Map data}) async {
    if (await networkInfo.isConnected) {
      try {
        final remotePosts = await remoteDataSource.updateOrder(data: data);
        return Right(remotePosts);
      } on ServerExecption catch (e) {
        return Left(ServerFailure(e.message.toString()));
      } catch (e) {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
