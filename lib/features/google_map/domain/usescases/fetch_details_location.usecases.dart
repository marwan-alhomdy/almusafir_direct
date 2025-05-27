import 'package:dartz/dartz.dart';
import '../../../../core/error/faiture.dart';
import '../../data/model/wash_location.dart';
import '../repostry/google_map_repostirores.dart';

class FetchDetailsLocationUsecases {
  final GoogleMapRepostitory reostitory;
  FetchDetailsLocationUsecases(this.reostitory);

  Future<Either<Failure, WashLocation>> call(int washId) async {
    return await reostitory.fetchDetailslocation(washId);
  }
}
