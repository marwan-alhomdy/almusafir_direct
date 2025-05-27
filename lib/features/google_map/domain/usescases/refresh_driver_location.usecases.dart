import 'package:dartz/dartz.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../../core/error/faiture.dart';
import '../repostry/google_map_repostirores.dart';

class RefreshDriverLocationUsecases {
  final GoogleMapRepostitory reostitory;
  RefreshDriverLocationUsecases(this.reostitory);

  Future<Either<Failure, String>> call(LatLng location) async {
    return await reostitory.refreshDriverlocation(location);
  }
}
