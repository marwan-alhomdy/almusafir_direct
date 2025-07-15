import 'package:almusafir_direct/helper/public_infromation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '/injection_container.dart' as di;
import '../../../../core/utils/function/message_box.dart';
import '../../../../core/utils/function/set_auth.dart';
import '../logic/auth_bloc/auth_bloc.dart';
import '../widget/custom/auth.appber.dart';
import '../widget/login_widget.dart';
import 'verifyotp.view.dart';

class AuthView extends StatelessWidget {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.sl<AuthBloc>(),
      child: Scaffold(
        appBar: const AuthAppBer(),
        body: BlocListener<AuthBloc, AuthState>(
          listener: _listenerSignInBlocState,
          child: const LoginWidget(),
        ),
      ),
    );
  }

  void _listenerSignInBlocState(BuildContext context, AuthState state) {
    if (state is LoginSuccessfulState) {
      setAuth(state.currentUser);
      Get.back();
    } else if (state is ErrorLoginState) {
      MessageBox.showError(context, state.message);
    } else if (state is MoveToActivationState) {
      final mobileOrEmail = context.read<AuthBloc>().mobile;
      Get.to(() => VerifyOtpView(mobileOrEmail: mobileOrEmail))?.then((_) {
        if (Helper.isAuth) Get.back();
      });
    }
  }
}
