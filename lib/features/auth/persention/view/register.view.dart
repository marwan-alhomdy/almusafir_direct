import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '/injection_container.dart' as di;
import '../../../../core/utils/function/message_box.dart';
import '../../../../core/utils/function/set_auth.dart';
import '../../../../helper/public_infromation.dart';
import '../logic/register_cubit/register_cubit.dart';
import '../widget/custom/auth.appber.dart';
import '../widget/register.widget.dart';
import 'verifyotp.view.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.sl<RegisterCubit>(),
      child: Scaffold(
        appBar: const AuthAppBer(),
        body: BlocListener<RegisterCubit, RegisterState>(
          listener: _listenerSignInBlocState,
          child: const RegisterWidget(),
        ),
      ),
    );
  }

  void _listenerSignInBlocState(BuildContext context, RegisterState state) {
    if (state is SuccessRegisterState) {
      setAuth(state.currentUser);
      Get.back();
    } else if (state is ErrorRegisterState) {
      MessageBox.showError(context, state.message);
    } else if (state is MoveToActivationState) {
      final mobile = context.read<RegisterCubit>().mobile;
      Get.off(() => VerifyOtpView(mobileOrEmail: mobile))?.then((_) {
        if (Helper.isAuth) Get.back();
      });
    }
  }
}
