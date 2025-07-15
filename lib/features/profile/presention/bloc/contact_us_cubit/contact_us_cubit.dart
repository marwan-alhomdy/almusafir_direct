import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../helper/public_infromation.dart';
import '../../../domain/usecases/contactus_usecases.dart';

part 'contact_us_state.dart';

class ContactUsCubit extends Cubit<ContactUsState> {
  final ContactUsUsecases contactUsUsecases;
  ContactUsCubit({required this.contactUsUsecases}) : super(ContactUsInitial());

  bool isReadOnly = false;
  final nameController = TextEditingController();
  final mobileController = TextEditingController();
  final emailController = TextEditingController();
  final messageController = TextEditingController();
  final GlobalKey<FormState> formState = GlobalKey();

  void initContactUs() {
    isReadOnly = Helper.isAuth;
    if (isReadOnly) {
      nameController.text = Helper.user?.name ?? "";
      mobileController.text = Helper.user?.mobile ?? "";
      emailController.text = Helper.user?.email ?? "";
    }
  }

  void contactUs() async {
    if (formState.currentState?.validate() ?? false) {
      emit(LoadingContactUsState());
      final data = {
        'name': nameController.text,
        'phone': mobileController.text,
        'email': emailController.text,
        'mesg': messageController.text,
      };
      final failureOrSuccess = await contactUsUsecases(data: data);
      emit(failureOrSuccess.fold(
          (failuer) => ErrorContactUsState(message: failuer.message),
          (_) => const ContactUsSuccessfulState()));
    }
  }
}
