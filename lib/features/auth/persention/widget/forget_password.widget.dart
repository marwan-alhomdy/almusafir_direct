import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../../core/constants/enum/field_name.auht.dart';
import '../../../../core/utils/resource/text_style.dart';
import '../../../../core/utils/validator/validator.dart';
import '../../../../core/widget/button/button.widget.dart';
import '../../../../core/widget/field/mobile_email_field.widget.dart';
import '../logic/validate_otp_cubit/validate_otp_cubit.dart';
import '../view/verifyotp.view.dart';
import 'custom/logo_auth.widget.dart';

class ForgetPasswordWidget extends StatefulWidget {
  const ForgetPasswordWidget({super.key});

  @override
  State<ForgetPasswordWidget> createState() => _ForgetPasswordWidgetState();
}

class _ForgetPasswordWidgetState extends State<ForgetPasswordWidget> {
  late final ValidateOtpCubit validateOtpCubit;

  @override
  void initState() {
    validateOtpCubit = context.read<ValidateOtpCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Form(
        key: validateOtpCubit.formState,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LogoAuthWidget(),
            Text("mobileOrEmail".tr, style: AppTextStyles.getMediumStyle()),
            const SizedBox(height: 15),
            MobileOrEmailFieldWidget(
              country: validateOtpCubit.country,
              controller: validateOtpCubit.mobileOrEmailController,
              validator: "".validator(),
              onChangedCountry: (country) =>
                  setState(() => validateOtpCubit.country = country),
            ),
            const SizedBox(height: 20),
            BlocBuilder<ValidateOtpCubit, ValidateOtpState>(
              builder: (_, state) {
                return (state is SendOtpLoading)
                    ? ButtonLoadingWidget(isLoading: true, text: "")
                    : ButtonLoadingWidget(
                        onTap: _moveToVerifyOtp, text: "sendOtp".tr);
              },
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }

  Future<void> _moveToVerifyOtp() async {
    if (validateOtpCubit.formState.currentState?.validate() ?? false) {
      final mobileOrEmail = validateOtpCubit.mobileOrEmail;
      Get.to(() => VerifyOtpView(
          mobileOrEmail: mobileOrEmail,
          fieldNameAuth: FieldNameAuth.check_login))?.then((_) => Get.back());
    }
  }
}
