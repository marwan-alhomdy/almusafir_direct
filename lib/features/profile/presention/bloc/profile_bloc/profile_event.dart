part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

final class UpdateUserProfileEvent extends ProfileEvent {}

//! Image
class ChangeAvatarEvent extends ProfileEvent {
  final String avater;
  const ChangeAvatarEvent({required this.avater});
}

class DeleteAvatarEvent extends ProfileEvent {
  const DeleteAvatarEvent();
}

//!logout
class LogoutProfileEvent extends ProfileEvent {
  const LogoutProfileEvent();
}

//!delete account
class DeleteAccountEvent extends ProfileEvent {
  const DeleteAccountEvent();
}
