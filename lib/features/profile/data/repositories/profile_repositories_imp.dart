import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/error/exception.dart';
import '../../../../core/error/faiture.dart';
import '../../../../core/services/network_info.dart';
import '../../../home/data/model/current_user/avatar.dart';
import '../../../home/data/model/current_user/current_user.dart';
import '../../domain/repositories/profile_repositories.dart';
import '../dataSourse/profile_data_sourse.dart';

class ProfileRepostitoryImpl extends ProfileRepostitory {
  final ProfileRemoteDataSource profileRemoteDataSource;

  final NetworkInfo networkInfo;
  ProfileRepostitoryImpl({
    required this.profileRemoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, CurrentUser>> updateUserProfile(
      {required Map<String, dynamic> data}) async {
    if (await networkInfo.isConnected) {
      try {
        final remotePosts =
            await profileRemoteDataSource.updateUserProfile(data: data);
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
  Future<Either<Failure, Unit>> logout() async {
    if (await networkInfo.isConnected) {
      try {
        final remotePosts = await profileRemoteDataSource.logout();
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
  Future<Either<Failure, Unit>> deleteAccount() async {
    if (await networkInfo.isConnected) {
      try {
        final remotePosts = await profileRemoteDataSource.deleteAccount();
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
  Future<Either<Failure, Avatar>> changeAvatar({required String avater}) async {
    if (await networkInfo.isConnected) {
      try {
        final remote =
            await profileRemoteDataSource.changeAvatar(avater: avater);
        return Right(remote);
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
  Future<Either<Failure, Unit>> deleteAvatar() async {
    if (await networkInfo.isConnected) {
      try {
        final remotePosts = await profileRemoteDataSource.deleteAvatar();
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
