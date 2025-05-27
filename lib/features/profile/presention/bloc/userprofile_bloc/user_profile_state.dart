part of 'user_profile_bloc.dart';

sealed class UserProfileState extends Equatable {
  const UserProfileState();

  @override
  List<Object> get props => [];
}

//! Initial
final class UserProfileInitial extends UserProfileState {}

//! Successful
final class UpdateUserProfileSuccessfulState extends UserProfileState {}

//! Error
class ErrorUpdateUserProfileState extends UserProfileState {
  final String message;
  const ErrorUpdateUserProfileState({required this.message});
}

//! Loading
final class LoadingUpdateUserProfileState extends UserProfileState {}
