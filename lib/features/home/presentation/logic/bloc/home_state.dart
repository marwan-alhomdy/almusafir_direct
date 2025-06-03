part of 'home_bloc.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

final class HomeInitial extends HomeState {}

//! Successfully
class FetchAllDataSuccessfullyState extends HomeState {
  final PrimaryData data;
  const FetchAllDataSuccessfullyState({required this.data});
}

//! Error
class ErrorFetchAllDataState extends HomeState {
  final String message;
  const ErrorFetchAllDataState({required this.message});
}

//! Loading
class LoadingHomeState extends HomeState {
  const LoadingHomeState();
}
