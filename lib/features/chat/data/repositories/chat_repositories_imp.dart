import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/error/exception.dart';
import '../../../../core/error/faiture.dart';
import '../../../../core/services/network_info.dart';
import '../../domain/repositories/chat_repositories.dart';
import '../datasources/chat_remote_datasources.dart';

class ChatRepostitoryImp extends ChatRepostitory {
  final ChatRemoteDataSource remoteDataSource;

  final NetworkInfo networkInfo;

  ChatRepostitoryImp(
      {required this.remoteDataSource, required this.networkInfo});

  @override
  Future<Either<Failure, String>> chatWithOpenai(String userMessag) async {
    if (await networkInfo.isConnected) {
      try {
        final remotePosts = await remoteDataSource.chatWithOpenai(userMessag);
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
