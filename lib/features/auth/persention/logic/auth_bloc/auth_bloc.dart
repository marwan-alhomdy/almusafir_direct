import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/data/current_user/current_user.dart';
import '../../../../../core/data/custom/country.dart';
import '../../../../../core/error/faiture.dart';
import '../../../../../core/utils/function/input_type_helper.dart';
import '../../../domain/usecases/login_usescases.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final GlobalKey<FormState> formState = GlobalKey();
  final mobileOrEmailController = TextEditingController();
  final passwordController = TextEditingController();

  Country country = CountryManager.firstCountry();

  final LoginUseCases loginUseCases;

  AuthBloc({required this.loginUseCases}) : super(AuthBlocInitial()) {
    on<LoginEvent>(loginEvent);
  }

  String get mobile => country.code + mobileOrEmailController.text;

  String get mobileOrEmail =>
      InputTypeHelper.isPhone(mobileOrEmailController.text)
          ? mobile
          : mobileOrEmailController.text;

  Future<void> loginEvent(LoginEvent event, Emitter<AuthState> emit) async {
    emit(LoadingAuthState());
    final data = {
      "login": mobileOrEmail,
      "api_version": "v2",
      "profile": "1",
      "password": passwordController.text
    };
    final failureOrLogin = await loginUseCases(data: data);
    emit(failureOrLogin.fold(
        (failuer) => failuer is AccountNotActiveFailure
            ? const MoveToActivationState()
            : ErrorLoginState(message: failuer.message),
        (user) => LoginSuccessfulState(currentUser: user)));
  }
}
