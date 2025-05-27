import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/data/models/user_model.module.dart';
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
  Future<Either<Failure, UserModel>> login(
      {required String username, required String password}) async {
    if (await networkInfo.isConnected) {
      try {
        final remotePosts = await remoteDataSource.login(
            username: username, password: password);
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
  Future<Either<Failure, dynamic>> verifyOtp(
      {required String mobile,
      required String otp,
      required Map fcbTocken}) async {
    if (await networkInfo.isConnected) {
      try {
        final remotePosts = await remoteDataSource.verifyOtp(
            mobile: mobile, otp: otp, fcbTocken: fcbTocken);
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
  Future<Either<Failure, Unit>> resendOtp({required String mobile}) async {
    if (await networkInfo.isConnected) {
      try {
        final remotePosts = await remoteDataSource.resendOtp(
          mobile: mobile,
        );
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
