import 'package:dartz/dartz.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../../core/error/faiture.dart';
import '../../data/model/wash_location.dart';

abstract class GoogleMapRepostitory {
  Future<Either<Failure, List<WashLocation>>> fetchWashLocation(
      {required LatLngBounds bounds});
  Future<Either<Failure, String>> refreshDriverlocation(LatLng location);

  Future<Either<Failure, WashLocation>> fetchDetailslocation(int washId);
}
