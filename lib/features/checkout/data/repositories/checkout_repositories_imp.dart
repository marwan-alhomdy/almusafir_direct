import 'package:almusafir_direct/core/data/service.module.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/error/exception.dart';
import '../../../../core/error/faiture.dart';
import '../../../../core/services/network_info.dart';
import '../../domain/repositories/checkout_repositories.dart';
import '../datasources/checkout_remote_datasources.dart';
import '../models/checkout_module.dart';

class CheckoutRepostitoryImp extends CheckoutRepostitory {
  final CheckoutRemoteDataSource remoteDataSource;

  final NetworkInfo networkInfo;

  CheckoutRepostitoryImp(
      {required this.remoteDataSource, required this.networkInfo});

  @override
  Future<Either<Failure, CheckoutModule>> checkout2(
      Map<String, dynamic> data) async {
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
  Future<Either<Failure, List<ServiceModul>>> getPaymentMethods(
      String? orderType) async {
    if (await networkInfo.isConnected) {
      try {
        final remotePosts = await remoteDataSource.getPaymentMethods(orderType);
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
