import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/data/custom/country.dart';
import '../../../../../core/error/faiture.dart';
import '../../../../home/data/model/current_user/current_user.dart';
import '../../../domain/usecases/login_usescases.dart';
import '../../../domain/usecases/resend_opt_usescases.dart';
import '../../../domain/usecases/validate_otp_code.usecases.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final GlobalKey<FormState> formState = GlobalKey();
  final mobileController = TextEditingController();
  final passwordController = TextEditingController();

  Country country = CountryManager.firstCountry();

  final LoginUseCases loginUseCases;
  final ValidateOtpCodeUseCases verigyOtpUseCases;
  final ResendOptUseCases resendOptUseCases;

  AuthBloc({
    required this.loginUseCases,
    required this.resendOptUseCases,
    required this.verigyOtpUseCases,
  }) : super(AuthBlocInitial()) {
    on<LoginEvent>(loginEvent);
  }

  String get mobile => country.code + mobileController.text;

  Future<void> loginEvent(LoginEvent event, Emitter<AuthState> emit) async {
    emit(LoadingAuthState());
    final data = {
      "login": mobile,
      "api_version": "v2",
      "profile": "1",
      "password": passwordController.text
    };
    final failureOrLogin = await loginUseCases(data: data);
    emit(failureOrLogin.fold(
        (failuer) => failuer is AccountNotActiveFailure
            ? MoveToActivationState()
            : ErrorLoginState(message: failuer.message),
        (user) => LoginSuccessfulState(currentUser: user)));
  }
}
