import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '/injection_container.dart' as di;
import '../../../../core/utils/function/message_box.dart';
import '../logic/validate_otp_cubit/validate_otp_cubit.dart';
import '../widget/custom/auth.appber.dart';
import '../widget/forget_password.widget.dart';
import 'verifyotp.view.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.sl<ValidateOtpCubit>(),
      child: Scaffold(
        appBar: AuthAppBer(),
        body: BlocListener<ValidateOtpCubit, ValidateOtpState>(
          listener: _listenerBlocState,
          child: const ForgetPasswordWidget(),
        ),
      ),
    );
  }

  void _listenerBlocState(BuildContext context, ValidateOtpState state) {
    if (state is SendOtpSuccess) {
      final mobile = context.read<ValidateOtpCubit>().mobile;
      Get.offAll(() => VerifyOtpView(mobile: mobile));
    } else if (state is SendOtpError) {
      MessageBox.showError(context, state.message);
    }
  }
}
