import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/data/custom/country.dart';
import '../../../../../core/error/faiture.dart';
import '../../../../home/data/model/current_user/current_user.dart';
import '../../../domain/usecases/register.usecases.dart';

part 'regiser_state.dart';

class RegiserCubit extends Cubit<RegiserState> {
  RegiserCubit({required this.registerUseCases}) : super(RegiserInitial());
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
    emit(LoadingRegiserState());
    final data = {
      'name': nameController.text,
      'email': emailController.text,
      'username': mobile,
      'mobile': mobile,
      "api_version": "v2",
      'password': passwordController.text,
      'password_confirmation': passwordController.text,
      'country_id': country.code,
    };
    final result = await registerUseCases(data: data);
    emit(
      result.fold(
          (failure) => failure is AccountNotActiveFailure
              ? MoveToActivationState()
              : ErrorRegiserState(failure.message),
          (currentUser) => SuccessRegiserState(currentUser: currentUser)),
    );
  }
}
