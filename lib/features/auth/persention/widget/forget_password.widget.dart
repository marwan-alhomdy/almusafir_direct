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
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 100, left: 20, right: 20),
      child: Form(
        key: context.read<ValidateOtpCubit>().formState,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LogoAuthWidget(),
            Text("mobile".tr, style: AppTextStyles.getMediumStyle()),
            const SizedBox(height: 15),
            MobileOrEmailFieldWidget(
              country: context.read<ValidateOtpCubit>().country,
              controller: context.read<ValidateOtpCubit>().mobileController,
              validator: "".validator(),
              onChangedCountry: (country) {
                context.read<ValidateOtpCubit>().country = country;
                setState(() {});
              },
            ),
            const SizedBox(height: 20),
            BlocBuilder<ValidateOtpCubit, ValidateOtpState>(
              builder: (context, state) {
                return (state is SendOtpLoading)
                    ? ButtonLoadingWidget(isLoading: true, text: "")
                    : ButtonLoadingWidget(
                        onTap: _login, text: "إرسال كود التحقق".tr);
              },
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }

  Future<void> _login() async {
    final validateOtpCubit = context.read<ValidateOtpCubit>();
    if (validateOtpCubit.formState.currentState?.validate() ?? false) {
      final mobile = validateOtpCubit.mobile;
      Get.off(() => VerifyOtpView(
          mobile: mobile, fieldNameAuth: FieldNameAuth.check_login));
    }
  }
}
