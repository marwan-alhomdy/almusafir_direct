import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/data/current_user/current_user.dart';
import '../../../../core/error/exception.dart';
import '../../../../core/error/faiture.dart';
import '../../../../core/services/network_info.dart';
import '../../domain/repositories/auth_repostitorise.dart';
import '../dataSourse/auth_remote_data_source.dart';

class AuthRepostitoryImpl extends AuthRepostitory {
  final AuthRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;
  AuthRepostitoryImpl(
      {required this.remoteDataSource, required this.networkInfo});
  @override
  Future<Either<Failure, CurrentUser>> login(
      {required Map<String, dynamic> data}) async {
    if (await networkInfo.isConnected) {
      try {
        final remotePosts = await remoteDataSource.login(data: data);

        return Right(remotePosts);
      } on AccountNotActiveExecption {
        return Left(AccountNotActiveFailure());
      } on ServerExecption catch (e) {
        return Left(ServerFailure(e.message ?? ""));
      } on DioException catch (e) {
        if (e.response?.statusCode == 403) {
          return Left(AccountNotActiveFailure());
        }
        return Left(DioFailure.fromDiorError(e));
      } catch (e) {
        return Left(ServerFailure(e.toString()));
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, CurrentUser>> register(
      {required Map<String, dynamic> data}) async {
    if (await networkInfo.isConnected) {
      try {
        final remotePosts = await remoteDataSource.register(data: data);
        return Right(remotePosts);
      } on AccountNotActiveExecption {
        return Left(AccountNotActiveFailure());
      } on ServerExecption catch (e) {
        return Left(ServerFailure(e.message ?? ""));
      } on DioException catch (e) {
        if (e.response?.statusCode == 403) {
          return Left(AccountNotActiveFailure());
        }
        return Left(DioFailure.fromDiorError(e));
      } catch (e) {
        return Left(ServerFailure(e.toString()));
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> sendActivation(
      {required Map<String, dynamic> data}) async {
    if (await networkInfo.isConnected) {
      try {
        final remotePosts = await remoteDataSource.sendActivation(data: data);
        return Right(remotePosts);
      } on ServerExecption catch (e) {
        return Left(ServerFailure(e.message ?? ""));
      } on DioException catch (e) {
        log(e.response!.data.toString());
        return Left(DioFailure.fromDiorError(e));
      } catch (e) {
        return Left(ServerFailure(e.toString()));
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, CurrentUser>> checkActivation(
      {required Map<String, dynamic> data}) async {
    if (await networkInfo.isConnected) {
      try {
        final remotePosts = await remoteDataSource.checkActivation(data: data);
        return Right(remotePosts);
      } on ServerExecption catch (e) {
        return Left(ServerFailure(e.message ?? ""));
      } on DioException catch (e) {
        log(e.response!.data.toString());
        return Left(DioFailure.fromDiorError(e));
      } catch (e) {
        return Left(ServerFailure(e.toString()));
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
