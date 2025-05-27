part of 'google_map_bloc.dart';

abstract class GoogleMapEvent extends Equatable {
  const GoogleMapEvent();

  @override
  List<Object> get props => [];
}

class FetchWashLocationEvent extends GoogleMapEvent {
  final LatLngBounds bounds;
  const FetchWashLocationEvent({required this.bounds});
}

class UpdateDriverLocationEvent extends GoogleMapEvent {
  final LatLng location;

  const UpdateDriverLocationEvent({required this.location});
}
