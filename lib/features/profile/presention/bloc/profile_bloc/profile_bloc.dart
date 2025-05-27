import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/statistics.module.dart';
import '../../../domain/usecases/logout_usecases.dart';
import '../../../domain/usecases/upload_image_cloudflare_usecases.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final UploadImageWithCloudflareUseCases uploadImageCloudflare;
  final LogoutDriverUseCases logoutDriverUseCases;

  ProfileBloc({
    required this.uploadImageCloudflare,
    required this.logoutDriverUseCases,
  }) : super(ProfileInitial()) {
    on<UploadImageWithCloudflareEvent>(_uploadImageToCloudflare);
    on<LogoutProfileEvent>(_logoutEvent);
  }

  Future<void> _uploadImageToCloudflare(
      UploadImageWithCloudflareEvent event, Emitter<ProfileState> emit) async {
    emit(LoadingProfileState());
    final failureOrSuccess = await uploadImageCloudflare(
      mobile: event.mobile,
      currentImage: event.currentImage,
      newImage: event.newImage,
    );
    emit(failureOrSuccess.fold(
        (failuer) => ErrorProfileState(message: failuer.message),
        (cloudinary) => UploadImageCloudinarySuccessfulState(
            urlImage: cloudinary.result?.variants?.firstOrNull ?? "")));
  }

  Future<void> _logoutEvent(
      LogoutProfileEvent event, Emitter<ProfileState> emit) async {
    emit(LoadingProfileState());

    final failureOrLogout = await logoutDriverUseCases();
    emit(failureOrLogout.fold(
        (failuer) => ErrorProfileState(message: failuer.message),
        (_) => const LogoutSuccessfulState()));
  }
}
