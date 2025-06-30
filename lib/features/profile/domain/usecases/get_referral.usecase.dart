import 'package:dartz/dartz.dart';

import '../../../../core/error/faiture.dart';
import '../../data/model/referral.dart';
import '../repositories/profile_repositories.dart';

class GetReferralUseCase {
  final ProfileRepostitory repository;
  GetReferralUseCase(this.repository);
  Future<Either<Failure, Referral>> call() async {
    return await repository.getReferral();
  }
}
