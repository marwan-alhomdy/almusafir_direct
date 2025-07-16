import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/data/models/department/data.dart';
import '../../../../core/error/exception.dart';
import '../../../../core/error/faiture.dart';
import '../../../../core/services/network_info.dart';
import '../../../shopping/data/models/department_type/department_type.dart';
import '../../domain/repositories/explore_repositories.dart';
import '../datasources/explore_remote_datasources.dart';

class ExploreRepostitoryImp extends ExploreRepostitory {
  final ExploreRemoteDataSource remoteDataSource;

  final NetworkInfo networkInfo;

  ExploreRepostitoryImp(
      {required this.remoteDataSource, required this.networkInfo});

  @override
  Future<Either<Failure, List<ShoppingDepartment>>> getExplores(
      String orderType, String tagsTypeId) async {
    if (await networkInfo.isConnected) {
      try {
        final remotePosts =
            await remoteDataSource.getExplores(orderType, tagsTypeId);
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

  @override
  Future<Either<Failure, List<DepartmentType>>> getTypeExplores(
      String orderType) async {
    if (await networkInfo.isConnected) {
      try {
        final remotePosts = await remoteDataSource.getTypeExplores(orderType);
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
