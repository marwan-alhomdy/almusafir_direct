import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/data/models/user_model.module.dart';
import '../../../../../core/server/get_token.dart';
import '../../../domain/usecases/login_usescases.dart';
import '../../../domain/usecases/verifyopt_usecases.dart';
import '../../../domain/usecases/resend_opt_usescases.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final pinController = TextEditingController();
  final pinputFocusNode = FocusNode();
  final GlobalKey<FormState> formState = GlobalKey();

  final mobileController = TextEditingController();
  final nameController = TextEditingController();

  final LoginUseCases loginUseCases;
  final VerigyOtpUseCases verigyOtpUseCases;
  final ResendOptUseCases resendOptUseCases;

  AuthBloc({
    required this.loginUseCases,
    required this.resendOptUseCases,
    required this.verigyOtpUseCases,
  }) : super(AuthBlocInitial()) {
    on<LoginEvent>(loginEvent);
    on<VerifyOtpEvent>(verifyOtpEvent);
    on<ResendOtpEvent>(resendOtpEvent);
  }

  Future<void> loginEvent(LoginEvent event, Emitter<AuthState> emit) async {
    emit(LoadingAuthState());
    final failureOrLogin = await loginUseCases(
        username: usernameController.text, password: passwordController.text);
    emit(failureOrLogin.fold(
        (failuer) => ErrorLoginState(message: failuer.message),
        (user) => LoginSuccessfulState(user: user)));
  }

  Future<void> verifyOtpEvent(
      VerifyOtpEvent event, Emitter<AuthState> emit) async {
    emit(LoadingAuthState());
    final failureOrSuccessful = await verigyOtpUseCases(
      mobile: "",
      otp: pinController.text,
      fcbTocken: await getfcbToken(),
    );
    emit(failureOrSuccessful.fold(
        (failuer) => ErrorVerifyState(message: failuer.message),
        (data) => VerifyOtpSuccessfulState(data: data)));
  }

  Future<void> resendOtpEvent(
      ResendOtpEvent event, Emitter<AuthState> emit) async {
    emit(LoadingAuthState());
    final failureOrSuccessful = await resendOptUseCases(mobile: "");
    emit(failureOrSuccessful.fold(
        (failuer) => ErrorVerifyState(message: failuer.message),
        (_) => const ResendOtpSuccessfulState()));
  }
}
