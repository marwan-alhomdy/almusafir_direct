part of 'location_cubit.dart';

sealed class LocationState extends Equatable {
  const LocationState();

  @override
  List<Object> get props => [];
}

final class LocationInitial extends LocationState {}

//! Loading
class LoadingFetchDetailsLocationState extends LocationState {}

//!Successful
class FetchDetailsLocationSuccessfulState extends LocationState {
  final WashLocation detailsLocation;
  const FetchDetailsLocationSuccessfulState({required this.detailsLocation});
}

//! Error
class ErrorFetchDetailsLocationState extends LocationState {
  final String message;
  const ErrorFetchDetailsLocationState({required this.message});
}
