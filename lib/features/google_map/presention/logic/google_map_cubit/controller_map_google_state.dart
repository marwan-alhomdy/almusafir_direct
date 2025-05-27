part of 'controller_map_google_cubit.dart';

abstract class ControllerMapGoogleState extends Equatable {
  const ControllerMapGoogleState();

  @override
  List<Object> get props => [];
}

class ControllerMapGoogleInitial extends ControllerMapGoogleState {}

class GoogleMapState extends ControllerMapGoogleState {}

class LoadingGoogleMapState extends ControllerMapGoogleState {}
