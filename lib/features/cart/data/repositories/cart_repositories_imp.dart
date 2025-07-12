import 'package:almusafir_direct/features/cart/data/models/row_cart.module.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/error/exception.dart';
import '../../../../core/error/faiture.dart';
import '../../../../core/services/network_info.dart';
import '../../domain/repositories/cart_repositories.dart';
import '../datasources/cart_remote_datasources.dart';

class CartRepostitoryImp extends CartRepostitory {
  final CartRemoteDataSource remoteDataSource;

  final NetworkInfo networkInfo;

  CartRepostitoryImp(
      {required this.remoteDataSource, required this.networkInfo});

  @override
  Future<Either<Failure, List<RowCartModel>>> addToCart(
      Map<String, dynamic> data) async {
    if (await networkInfo.isConnected) {
      try {
        final remotePosts = await remoteDataSource.addToCart(data);
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
  Future<Either<Failure, List<RowCartModel>>> deteteCart(
      Map<String, dynamic> data) async {
    if (await networkInfo.isConnected) {
      try {
        final remotePosts = await remoteDataSource.deteteCart(data);
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
  Future<Either<Failure, List<RowCartModel>>> getCart(
      Map<String, dynamic> data) async {
    if (await networkInfo.isConnected) {
      try {
        final remotePosts = await remoteDataSource.getCart(data);
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
