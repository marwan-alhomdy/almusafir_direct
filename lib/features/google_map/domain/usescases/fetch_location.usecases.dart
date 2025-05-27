import 'package:dartz/dartz.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../../core/error/faiture.dart';
import '../../data/model/wash_location.dart';
import '../repostry/google_map_repostirores.dart';

class FetchWashLocationUsecases {
  final GoogleMapRepostitory reostitory;
  FetchWashLocationUsecases(this.reostitory);

  Future<Either<Failure, List<WashLocation>>> call(
      {required LatLngBounds bounds}) async {
    return await reostitory.fetchWashLocation(bounds: bounds);
  }
}
