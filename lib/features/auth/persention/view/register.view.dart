import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '/injection_container.dart' as di;
import '../../../../core/utils/function/message_box.dart';
import '../../../../core/utils/function/set_auth.dart';
import '../logic/regiser_cubit/regiser_cubit.dart';
import '../widget/custom/auth.appber.dart';
import '../widget/register.widget.dart';
import 'verifyotp.view.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.sl<RegiserCubit>(),
      child: Scaffold(
        appBar: AuthAppBer(),
        body: BlocListener<RegiserCubit, RegiserState>(
          listener: _listenerSignInBlocState,
          child: RegisterWidget(),
        ),
      ),
    );
  }

  void _listenerSignInBlocState(BuildContext context, RegiserState state) {
    if (state is SuccessRegiserState) {
      setAuth(state.currentUser);
      Get.back();
    } else if (state is MoveToActivationState) {
      final mobile = context.read<RegiserCubit>().mobile;
      Get.off(() => VerifyOtpView(mobile: mobile));
    } else if (state is ErrorRegiserState) {
      MessageBox.showError(context, state.message);
    }
  }
}
