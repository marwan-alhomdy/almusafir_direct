part of 'google_map_bloc.dart';

abstract class GoogleMapBlocState extends Equatable {
  const GoogleMapBlocState();

  @override
  List<Object> get props => [];
}

class GoogleMapInitial extends GoogleMapBlocState {}

//! Loading

class LoadingFetchWashLocationState extends GoogleMapBlocState {}

//!Successful

class FetchWashLocationSuccessfulState extends GoogleMapBlocState {
  final List<WashLocation> washLocations;
  const FetchWashLocationSuccessfulState({required this.washLocations});
}

//! Error

class ErrorFetchWashLocationState extends GoogleMapBlocState {
  final String message;
  const ErrorFetchWashLocationState({required this.message});
}
