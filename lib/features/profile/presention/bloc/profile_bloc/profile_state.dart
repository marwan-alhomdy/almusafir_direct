part of 'profile_bloc.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}
//! Initial

class ProfileInitial extends ProfileState {}

//! Successful
class ChangeStatusSuccessfulState extends ProfileState {
  final String status;
  const ChangeStatusSuccessfulState(this.status);
}

class GetStatisticsSuccessfulState extends ProfileState {
  final StatisticsModel statistics;
  const GetStatisticsSuccessfulState(this.statistics);
}

class UploadImageCloudinarySuccessfulState extends ProfileState {
  final String urlImage;
  const UploadImageCloudinarySuccessfulState({required this.urlImage});
}

class LogoutOrDeleteAccountSuccessfulState extends ProfileState {
  const LogoutOrDeleteAccountSuccessfulState();
}

//! Loading

class LoadingProfileState extends ProfileState {}

class LoadingStatisticsState extends ProfileState {}

//! Error
class ErrorChangeStatusState extends ProfileState {
  const ErrorChangeStatusState({required this.message});
  final String message;
}

class ErrorProfileState extends ProfileState {
  const ErrorProfileState({required this.message});
  final String message;
}

class ErrorStatisticsState extends ProfileState {
  const ErrorStatisticsState({required this.message});
  final String message;
}
