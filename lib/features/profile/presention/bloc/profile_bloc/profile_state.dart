part of 'profile_bloc.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}
//! Initial

class ProfileInitial extends ProfileState {}

//! Successful

class ChangeAvatarSuccessfulState extends ProfileState {
  final Avatar avatar;
  const ChangeAvatarSuccessfulState({required this.avatar});
}

class DeleteAvatarSuccessfulState extends ProfileState {}

class UpdateUserProfileSuccessfulState extends ProfileState {
  final CurrentUser user;
  const UpdateUserProfileSuccessfulState({required this.user});
}

class LogoutOrDeleteAccountSuccessfulState extends ProfileState {
  const LogoutOrDeleteAccountSuccessfulState();
}

//! Loading

class LoadingProfileState extends ProfileState {}

//! Error

class ErrorProfileState extends ProfileState {
  const ErrorProfileState({required this.message});
  final String message;
}
