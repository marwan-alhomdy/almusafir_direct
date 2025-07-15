import 'package:almusafir_direct/core/data/shop_products/shop_products.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/error/exception.dart';
import '../../../../core/error/faiture.dart';
import '../../../../core/services/network_info.dart';
import '../../domain/repositories/service_repositories.dart';
import '../datasources/service_remote_datasources.dart';

class ServiceRepostitoryImp extends ServiceRepostitory {
  final ServiceRemoteDataSource remoteDataSource;

  final NetworkInfo networkInfo;

  ServiceRepostitoryImp(
      {required this.remoteDataSource, required this.networkInfo});

  @override
  Future<Either<Failure, List<ShopProduct>>> getProducts(
      String? orderType) async {
    if (await networkInfo.isConnected) {
      try {
        final remotePosts = await remoteDataSource.getProducts(orderType);
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
