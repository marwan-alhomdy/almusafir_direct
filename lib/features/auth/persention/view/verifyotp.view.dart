import 'package:almusafir_direct/core/utils/function/message_box.dart';
import 'package:almusafir_direct/core/utils/function/set_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '/injection_container.dart' as di;
import '../../../../core/constants/enum/field_name.auht.dart';
import '../../../home/data/model/current_user/current_user.dart';
import '../logic/verify_cubit/verify_cubit.dart';
import '../widget/custom/auth.appber.dart';
import '../widget/verifyotp_widget.dart';

class VerifyOtpView extends StatelessWidget {
  const VerifyOtpView(
      {super.key,
      required this.mobileOrEmail,
      this.onSuccess,
      this.fieldNameAuth = FieldNameAuth.activation});
  final FieldNameAuth fieldNameAuth;

  final Function(CurrentUser)? onSuccess;
  final String mobileOrEmail;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.sl<VerifyCubit>()
        ..setMobileOrEmail(mobileOrEmail)
        ..sendActivation(fieldNameAuth: fieldNameAuth),
      child: Scaffold(
        appBar: AuthAppBer(),
        body: BlocListener<VerifyCubit, VerifyState>(
          listener: _listenerBlocState,
          child: VerifyotpWidget(fieldNameAuth: fieldNameAuth),
        ),
      ),
    );
  }

  void _listenerBlocState(BuildContext context, VerifyState state) {
    if (state is VerifyError) {
      MessageBox.showError(context, state.message);
    } else if (state is SendOtpError) {
      MessageBox.showError(context, state.message);
    } else if (state is CheckActivationSuccess) {
      setAuth(state.currentUser);
      Get.back();
    }
  }
}
