import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/data/current_user/current_user.dart';
import '../../../../../core/data/custom/country.dart';
import '../../../../../core/error/faiture.dart';
import '../../../domain/usecases/register.usecases.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit({required this.registerUseCases}) : super(RegisterInitial());
  final RegisterUseCases registerUseCases;

  final GlobalKey<FormState> formState = GlobalKey();
  final passwordController = TextEditingController();
  final mobileController = TextEditingController();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final dateOfBirthController = TextEditingController();
  Country country = CountryManager.firstCountry();

  void changeCountry(Country country) => this.country = country;

  String get mobile => country.code + mobileController.text;

  Future<void> register() async {
    emit(LoadingRegisterState());
    final data = {
      'name': nameController.text,
      'email': emailController.text,
      'username': mobile,
      'mobile': mobile,
      "api_version": "v2",
      'password': passwordController.text,
      'password_confirmation': passwordController.text,
      'date_of_birth': dateOfBirthController.text,
      'country_id': country.code,
    };
    final result = await registerUseCases(data: data);
    emit(
      result.fold(
          (failure) => failure is AccountNotActiveFailure
              ? const MoveToActivationState()
              : ErrorRegisterState(failure.message),
          (currentUser) => SuccessRegisterState(currentUser: currentUser)),
    );
  }
}
