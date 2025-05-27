import 'package:dartz/dartz.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../core/controller/work_on_servers/network/network_info.dart';
import '../../../../core/error/exception.dart';
import '../../../../core/error/faiture.dart';
import '../../domain/repostry/google_map_repostirores.dart';
import '../datasourse/google_map_data_source.dart';
import '../model/wash_location.dart';

class GoogleMapRepostitoryImpl extends GoogleMapRepostitory {
  final GoogleMapDataSource remoteDataSource;

  final NetworkInfo networkInfo;
  GoogleMapRepostitoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<WashLocation>>> fetchWashLocation({
    required LatLngBounds bounds,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final remotePosts =
            await remoteDataSource.fetchWashLocation(bounds: bounds);
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
  Future<Either<Failure, String>> refreshDriverlocation(LatLng location) async {
    if (await networkInfo.isConnected) {
      try {
        final remotePosts =
            await remoteDataSource.refreshDriverlocation(location);
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
  Future<Either<Failure, WashLocation>> fetchDetailslocation(int washId) async {
    if (await networkInfo.isConnected) {
      try {
        final remotePosts = await remoteDataSource.fetchDetailslocation(washId);
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
