import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../domain/usecases/update_user_profile.usecases.dart';

part 'user_profile_event.dart';
part 'user_profile_state.dart';

class UserProfileBloc extends Bloc<UserProfileEvent, UserProfileState> {
  final UpdateUserProfileUsecases updateUserProfile;

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final mobileController = TextEditingController();
  final vehicleDetailController = TextEditingController();
  final iqamaController = TextEditingController();
  final supervisorController = TextEditingController();
  final companyController = TextEditingController();

  UserProfileBloc({
    required this.updateUserProfile,
  }) : super(UserProfileInitial()) {
    _setFormData();
    on<UpdateUserProfileEvent>(_updateUserProfileEvent);
  }
  void _setFormData() {
    // firstNameController.text = Helper.user?.userFirstName ?? "";
    // lastNameController.text = Helper.user?.userLastName ?? "";
    // mobileController.text = Helper.user?.userMobile ?? "";
    // vehicleDetailController.text = Helper.user?.vehicleNumber ?? "";
    // iqamaController.text = Helper.user?.identityNumber ?? "";
    // supervisorController.text = Helper.user?.directManager ?? "";
    // companyController.text = Helper.user?.brandName ?? "";
  }

  Future<void> _updateUserProfileEvent(
      UpdateUserProfileEvent event, Emitter<UserProfileState> emit) async {
    emit(LoadingUpdateUserProfileState());

    final parameters = {
      "regUserCountryId": "191",
      "firstName": firstNameController.text,
      "lastName": lastNameController.text,
      "userMobile": mobileController.text,
      "identityNumber": iqamaController.text,
      "vehicleNumber": vehicleDetailController.text,
    };
    final failureOrSuccess = await updateUserProfile(data: parameters);
    emit(failureOrSuccess.fold(
        (failuer) => ErrorUpdateUserProfileState(message: failuer.message),
        (_) => UpdateUserProfileSuccessfulState()));
  }
}
