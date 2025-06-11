import 'package:almusafir_direct/core/data/current_user/current_user.dart';
import 'package:almusafir_direct/features/profile/domain/usecases/change_avatar_usecases.dart';
import 'package:almusafir_direct/features/profile/domain/usecases/delete_avatar_usecases.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/data/current_user/avatar.dart';
import '../../../../../helper/public_infromation.dart';
import '../../../domain/usecases/delete_usecases.dart';
import '../../../domain/usecases/logout_usecases.dart';
import '../../../domain/usecases/update_user_profile.usecases.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ChangeAvatarUsecases changeAvatarUsecases;
  final DeleteAvatarUsecases deleteAvatarUsecases;
  final LogoutDriverUseCases logoutDriverUseCases;
  final DeleteAccountUseCases deleteAccountUseCases;
  final UpdateUserProfileUsecases updateUserProfileUseCases;

  ProfileBloc({
    required this.changeAvatarUsecases,
    required this.deleteAvatarUsecases,
    required this.logoutDriverUseCases,
    required this.deleteAccountUseCases,
    required this.updateUserProfileUseCases,
  }) : super(ProfileInitial()) {
    on<LogoutProfileEvent>(_logoutEvent);
    on<DeleteAccountEvent>(_deleteAccountEvent);
    on<ChangeAvatarEvent>(_changeAvatarEvent);
    on<DeleteAvatarEvent>(_deleteAvatarEvent);
    on<UpdateUserProfileEvent>(_updateUserProfileEvent);
  }

  final mobileController = TextEditingController();
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final dateOfBirthController = TextEditingController();

  void setDataUserToField() {
    final user = Helper.user;
    mobileController.text = user?.mobile ?? "";
    emailController.text = user?.email ?? "";
    nameController.text = user?.name ?? "";
    dateOfBirthController.text = user?.dateOfBirth ?? "";
  }

  Future<void> _changeAvatarEvent(
      ChangeAvatarEvent event, Emitter<ProfileState> emit) async {
    emit(LoadingProfileState());
    final failureOrSuccess = await changeAvatarUsecases(avater: event.avater);
    emit(failureOrSuccess.fold(
        (failuer) => ErrorProfileState(message: failuer.message),
        (avater) => ChangeAvatarSuccessfulState(avatar: avater)));
  }

  Future<void> _deleteAvatarEvent(
      DeleteAvatarEvent event, Emitter<ProfileState> emit) async {
    emit(LoadingProfileState());
    final failureOrSuccess = await deleteAvatarUsecases();
    emit(failureOrSuccess.fold(
        (failuer) => ErrorProfileState(message: failuer.message),
        (avater) => DeleteAvatarSuccessfulState()));
  }

  Future<void> _logoutEvent(
      LogoutProfileEvent event, Emitter<ProfileState> emit) async {
    emit(LoadingProfileState());

    final failureOrLogout = await logoutDriverUseCases();
    emit(failureOrLogout.fold(
        (failuer) => ErrorProfileState(message: failuer.message),
        (_) => const LogoutOrDeleteAccountSuccessfulState()));
  }

  Future<void> _deleteAccountEvent(
      DeleteAccountEvent event, Emitter<ProfileState> emit) async {
    emit(LoadingProfileState());
    final failureOrDelete = await deleteAccountUseCases();
    emit(failureOrDelete.fold(
        (failuer) => ErrorProfileState(message: failuer.message),
        (_) => const LogoutOrDeleteAccountSuccessfulState()));
  }

  Future<void> _updateUserProfileEvent(
      UpdateUserProfileEvent event, Emitter<ProfileState> emit) async {
    emit(LoadingProfileState());

    final user = Helper.user;
    final data = {
      'id': user?.id,
      'name': nameController.text,
      'email': emailController.text,
      'mobile': mobileController.text,
      'gender': user?.gender,
      'date_of_birth': dateOfBirthController.text,
    };

    final failureOrDelete = await updateUserProfileUseCases(data: data);
    emit(failureOrDelete.fold(
        (failuer) => ErrorProfileState(message: failuer.message),
        (user) => UpdateUserProfileSuccessfulState(user: user)));
  }
}
