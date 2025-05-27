import 'package:dartz/dartz.dart';

import '../../../../core/controller/work_on_servers/network/network_info.dart';
import '../../../../core/data/models/cloudflare.module.dart';
import '../../../../core/error/exception.dart';
import '../../../../core/error/faiture.dart';
import '../../domain/repositories/profile_repositories.dart';
import '../dataSourse/profile_data_sourse.dart';
import '../dataSourse/uplod_image_data_source.dart';

class ProfileRepostitoryImpl extends ProfileRepostitory {
  final ProfileRemoteDataSource profileRemoteDataSource;
  final UploadImageCloudinartDataSource uploadImageCloudinartDataSource;
  final NetworkInfo networkInfo;
  ProfileRepostitoryImpl(
      {required this.profileRemoteDataSource,
      required this.networkInfo,
      required this.uploadImageCloudinartDataSource});

  @override
  Future<Either<Failure, Unit>> updateUserProfile(
      {required Map<String, dynamic> data}) async {
    if (await networkInfo.isConnected) {
      try {
        final remotePosts =
            await profileRemoteDataSource.updateUserProfile(data: data);
        return Right(remotePosts);
      } on ServerExecption catch (e) {
        return Left(ServerFailure(e.message.toString()));
      } catch (e) {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, Cloudflare>> uploadImageWithCloudflare(
      {required String newImage,
      required String? currentImage,
      required String mobile}) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteUrlImage =
            await uploadImageCloudinartDataSource.uploadImagePofile(
                newImage: newImage, currentImage: currentImage, mobile: mobile);
        return Right(remoteUrlImage);
      } on ServerExecption catch (e) {
        return Left(ServerFailure(e.message.toString()));
      } catch (e) {
        return Left(ServerFailure());
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
        return Left(ServerFailure(e.message.toString()));
      } catch (e) {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> changeCodeVehicle(
      {required String code}) async {
    if (await networkInfo.isConnected) {
      try {
        final remotePosts =
            await profileRemoteDataSource.changeCodeVehicle(code: code);
        return Right(remotePosts);
      } on ServerExecption catch (e) {
        return Left(ServerFailure(e.message.toString()));
      } catch (e) {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
