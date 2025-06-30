import 'package:almusafir_direct/core/data/service.module.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/error/exception.dart';
import '../../../../core/error/faiture.dart';
import '../../../../core/services/network_info.dart';
import '../../domain/repositories/services_repositories.dart';
import '../datasources/services_remote_datasources.dart';

class ServicesRepostitoryImp extends ServicesRepostitory {
  final ServicesRemoteDataSource remoteDataSource;

  final NetworkInfo networkInfo;

  ServicesRepostitoryImp(
      {required this.remoteDataSource, required this.networkInfo});

  @override
  Future<Either<Failure, dynamic>> checkout2(Map<String, dynamic> data) async {
    if (await networkInfo.isConnected) {
      try {
        final remotePosts = await remoteDataSource.checkout2(data);
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
  Future<Either<Failure, List<ServiceModul>>> getAirport(
      Map<String, dynamic> data) async {
    if (await networkInfo.isConnected) {
      try {
        final remotePosts = await remoteDataSource.getAirport(data);
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
  Future<Either<Failure, List<ServiceModul>>> getAllVehicleTypes() async {
    if (await networkInfo.isConnected) {
      try {
        final remotePosts = await remoteDataSource.getAllVehicleTypes();
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
  Future<Either<Failure, List<ServiceModul>>> getLoadsTypes(
      String orderType) async {
    if (await networkInfo.isConnected) {
      try {
        final remotePosts = await remoteDataSource.getLoadsTypes(orderType);
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
  Future<Either<Failure, List<ServiceModul>>> getPaymentMethods() async {
    if (await networkInfo.isConnected) {
      try {
        final remotePosts = await remoteDataSource.getPaymentMethods();
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
  Future<Either<Failure, List<ServiceModul>>> getFlights(
      String orderType) async {
    if (await networkInfo.isConnected) {
      try {
        final remotePosts = await remoteDataSource.getFlights(orderType);
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
