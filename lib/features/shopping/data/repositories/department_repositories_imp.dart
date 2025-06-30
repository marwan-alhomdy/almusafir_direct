import 'package:almusafir_direct/features/shopping/data/models/shop_products/shop_products.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/data/models/department/data.dart';
import '../../../../core/error/exception.dart';
import '../../../../core/error/faiture.dart';
import '../../../../core/services/network_info.dart';
import '../../domain/repositories/department_repositories.dart';
import '../datasources/department_remote_datasources.dart';
import '../models/department_type/department_type.dart';

class DepartmentRepostitoryImp extends DepartmentRepostitory {
  final DepartmentRemoteDataSource remoteDataSource;

  final NetworkInfo networkInfo;

  DepartmentRepostitoryImp(
      {required this.remoteDataSource, required this.networkInfo});

  @override
  Future<Either<Failure, List<ShoppingDepartment>>> getDepartments(
      String orderType, String tagsTypeId) async {
    if (await networkInfo.isConnected) {
      try {
        final remotePosts =
            await remoteDataSource.getDepartments(orderType, tagsTypeId);
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
  Future<Either<Failure, List<DepartmentType>>> getTypeDepartments(
      String orderType) async {
    if (await networkInfo.isConnected) {
      try {
        final remotePosts =
            await remoteDataSource.getTypeDepartments(orderType);
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
  Future<Either<Failure, List<ShopProduct>>> getShopProducts(
      String? orderType, String? departmentsId) async {
    if (await networkInfo.isConnected) {
      try {
        final remotePosts =
            await remoteDataSource.getShopProducts(orderType, departmentsId);
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
