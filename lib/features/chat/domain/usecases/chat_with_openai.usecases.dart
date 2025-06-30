import 'package:dartz/dartz.dart';

import '../../../../core/error/faiture.dart';
import '../repositories/chat_repositories.dart';

class ChatWithOpenaiDataUsecases {
  final ChatRepostitory reostitory;
  ChatWithOpenaiDataUsecases(this.reostitory);
  Future<Either<Failure, String>> call(String userMessag) async {
    return await reostitory.chatWithOpenai(userMessag);
  }
}
