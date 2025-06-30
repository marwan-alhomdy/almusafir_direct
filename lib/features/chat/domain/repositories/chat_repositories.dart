import 'package:dartz/dartz.dart';

import '../../../../core/error/faiture.dart';

abstract class ChatRepostitory {
  Future<Either<Failure, String>> chatWithOpenai(String userMessag);
}
