import 'package:almusafir_direct/core/utils/function/message_box.dart';
import 'package:almusafir_direct/core/utils/function/set_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '/injection_container.dart' as di;
import '../../../../core/constants/enum/field_name.auht.dart';
import '../../../home/data/model/current_user/current_user.dart';
import '../logic/validate_otp_cubit/validate_otp_cubit.dart';
import '../widget/custom/auth.appber.dart';
import '../widget/verifyotp_widget.dart';

class VerifyOtpView extends StatelessWidget {
  const VerifyOtpView(
      {super.key,
      required this.mobile,
      this.onSuccess,
      this.fieldNameAuth = FieldNameAuth.activation});
  final FieldNameAuth fieldNameAuth;

  final Function(CurrentUser)? onSuccess;
  final String mobile;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.sl<ValidateOtpCubit>()
        ..setMobile(mobile)
        ..sendactivation(fieldNameAuth: fieldNameAuth),
      child: Scaffold(
        appBar: AuthAppBer(),
        body: BlocListener<ValidateOtpCubit, ValidateOtpState>(
          listener: _listenerBlocState,
          child: VerifyotpWidget(fieldNameAuth: fieldNameAuth),
        ),
      ),
    );
  }

  void _listenerBlocState(BuildContext context, ValidateOtpState state) {
    if (state is ValidateOtpError) {
      MessageBox.showError(context, state.message);
    } else if (state is SendOtpError) {
      MessageBox.showError(context, state.message);
    } else if (state is CheckActivationSuccess) {
      setAuth(state.currentUser);
      Get.back();
    } else if (state is SendOtpSuccess) {}
  }
}
