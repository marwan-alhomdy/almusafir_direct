import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../../core/constants/enum/field_name.auht.dart';
import '../../../../core/utils/resource/text_style.dart';
import '../../../../core/utils/validator/validator.dart';
import '../../../../core/widget/button/button.widget.dart';
import '../../../../core/widget/field/mobile_email_field.widget.dart';
import '../logic/verify_cubit/verify_cubit.dart';
import '../view/verifyotp.view.dart';
import 'custom/logo_auth.widget.dart';

class ForgetPasswordWidget extends StatefulWidget {
  const ForgetPasswordWidget({super.key});

  @override
  State<ForgetPasswordWidget> createState() => _ForgetPasswordWidgetState();
}

class _ForgetPasswordWidgetState extends State<ForgetPasswordWidget> {
  late final VerifyCubit verifyCubit;

  @override
  void initState() {
    verifyCubit = context.read<VerifyCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Form(
        key: verifyCubit.formState,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const LogoAuthWidget(),
            Text("mobileOrEmail".tr, style: AppTextStyles.getMediumStyle()),
            const SizedBox(height: 15),
            MobileOrEmailFieldWidget(
              country: verifyCubit.country,
              controller: verifyCubit.mobileOrEmailController,
              validator: "".validator(),
              onChangedCountry: (country) =>
                  setState(() => verifyCubit.country = country),
            ),
            const SizedBox(height: 20),
            BlocBuilder<VerifyCubit, VerifyState>(
              builder: (_, state) {
                return (state is SendOtpLoading)
                    ? const ButtonLoadingWidget(isLoading: true, text: "")
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
    if (verifyCubit.formState.currentState?.validate() ?? false) {
      final mobileOrEmail = verifyCubit.mobileOrEmail;
      Get.to(() => VerifyOtpView(
          mobileOrEmail: mobileOrEmail,
          fieldNameAuth: FieldNameAuth.check_login))?.then((_) => Get.back());
    }
  }
}
