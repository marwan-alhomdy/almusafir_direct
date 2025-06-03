import 'package:almusafir_direct/core/utils/resource/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../../core/constants/enum/field_name.auht.dart';
import '../../../../core/widget/button/button.widget.dart';
import '../../../../core/widget/field/pinput_widget.dart';
import '../logic/validate_otp_cubit/validate_otp_cubit.dart';
import 'custom/logo_auth.widget.dart';
import 'custom/resendotp_button.widget.dart';

class VerifyotpWidget extends StatelessWidget {
  const VerifyotpWidget(
      {super.key, this.fieldNameAuth = FieldNameAuth.activation});
  final FieldNameAuth fieldNameAuth;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Spacer(),
          LogoAuthWidget(),
          const Spacer(),
          Text("verifyData".tr,
              style: AppTextStyles.getBoldStyle(fontSize: 22)),
          const SizedBox(height: 10),
          Text("6otp".tr,
              textAlign: TextAlign.start,
              style: AppTextStyles.getMediumStyle()),
          const SizedBox(height: 20),
          PinputWidget(
            pinController: context.read<ValidateOtpCubit>().pinController,
            pinputFocusNode: context.read<ValidateOtpCubit>().pinputFocusNode,
            onCompeted: (pin) => _verifyOtp(context),
          ),
          const SizedBox(height: 20),
          BlocBuilder<ValidateOtpCubit, ValidateOtpState>(
              builder: (context, state) => (state is ValidateOtpLoading)
                  ? ButtonLoadingWidget(isLoading: true, text: "")
                  : ButtonLoadingWidget(
                      onTap: () => _verifyOtp(context), text: "Verify".tr)),
          const SizedBox(height: 10),
          BlocBuilder<ValidateOtpCubit, ValidateOtpState>(
            builder: (context, state) => (state is SendOtpLoading)
                ? const CircularProgressIndicator()
                : ResendOtpButton(
                    isStartCountdown: state is SendOtpSuccess,
                    onResend: () => context
                        .read<ValidateOtpCubit>()
                        .sendactivation(fieldNameAuth: fieldNameAuth),
                  ),
          ),
          const Spacer(),
        ],
      ),
    );
  }

  void _verifyOtp(BuildContext context) {
    context
        .read<ValidateOtpCubit>()
        .checkactivation(fieldNameAuth: fieldNameAuth);
  }
}
