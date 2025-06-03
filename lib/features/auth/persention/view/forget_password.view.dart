import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/injection_container.dart' as di;
import '../logic/validate_otp_cubit/validate_otp_cubit.dart';
import '../widget/custom/auth.appber.dart';
import '../widget/forget_password.widget.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.sl<ValidateOtpCubit>(),
      child: Scaffold(
        appBar: AuthAppBer(),
        body: const ForgetPasswordWidget(),
      ),
    );
  }
}
