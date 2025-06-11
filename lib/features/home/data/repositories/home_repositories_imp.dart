import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/error/exception.dart';
import '../../../../core/error/faiture.dart';
import '../../../../core/services/network_info.dart';
import '../../domain/repositories/home_repositories.dart';
import '../datasources/home_local_datasource.dart';
import '../datasources/home_remote_datasources.dart';
import '../model/getalldata/primary_data.dart';

class HomeRepostitoryImp extends HomeRepostitory {
  final HomeRemoteDataSource remoteDataSource;
  final HomeLocalDatasource localDataSource;
  final NetworkInfo networkInfo;

  HomeRepostitoryImp(
      {required this.remoteDataSource,
      required this.localDataSource,
      required this.networkInfo});

  @override
  Future<Either<Failure, PrimaryData>> fetchAllData() async {
    if (await networkInfo.isConnected) {
      try {
        final remotePosts = await remoteDataSource.fetchAllData();
        localDataSource.cacheAllDataData(remotePosts);
        return Right(remotePosts);
      } on ServerExecption catch (e) {
        return Left(ServerFailure(e.message ?? ""));
      } on DioException catch (e) {
        return Left(DioFailure.fromDiorError(e));
      } catch (e) {
        return Left(ServerFailure(e.toString()));
      }
    } else {
      try {
        final local = await localDataSource.getAllDataCached();
        return Right(local);
      } on EmptyCacheException {
        return Left(EmtyCacheFailure());
      } catch (e) {
        return Left(ServerFailure());
      }
    }
  }
}
