import 'package:dartz/dartz.dart';

import '../../../../core/data/models/delegate.module.dart';
import '../../../../core/error/exception.dart';
import '../../../../core/error/faiture.dart';
import '../../../../core/services/network_info.dart';
import '../../domain/repositories/home_repositories.dart';
import '../datasources/home_local_datasource.dart';
import '../datasources/home_remote_datasources.dart';

class HomeRepostitoryImp extends HomeRepostitory {
  final HomeRemoteDataSource remoteDataSource;
  final HomeLocalDatasource localDataSource;
  final NetworkInfo networkInfo;

  HomeRepostitoryImp(
      {required this.remoteDataSource,
      required this.localDataSource,
      required this.networkInfo});

  @override
  Future<Either<Failure, DelegateModule>> fetchAllData() async {
    if (await networkInfo.isConnected) {
      try {
        final remotePosts = await remoteDataSource.fetchAllData();
        localDataSource.cacheAllDataData(remotePosts);
        return Right(remotePosts);
      } on ServerExecption catch (e) {
        return Left(ServerFailure(e.message.toString()));
      } catch (e) {
        return Left(ServerFailure());
      }
    } else {
      try {
        final setting = await localDataSource.getAllDataCached();
        return Right(setting);
      } on EmptyCacheException {
        return Left(EmtyCacheFailure());
      } catch (e) {
        return Left(ServerFailure());
      }
    }
  }
}
