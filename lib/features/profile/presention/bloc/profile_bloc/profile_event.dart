part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

//! Image Cloudflare
class UploadImageWithCloudflareEvent extends ProfileEvent {
  final String newImage;
  final String? currentImage;
  final String mobile;
  const UploadImageWithCloudflareEvent(
      {required this.newImage, this.currentImage, required this.mobile});
}

//!logout
class LogoutProfileEvent extends ProfileEvent {
  const LogoutProfileEvent();
}
