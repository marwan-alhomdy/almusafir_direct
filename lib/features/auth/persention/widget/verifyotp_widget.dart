import 'package:almusafir_direct/core/utils/resource/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../../core/widget/button/button.widget.dart';
import '../../../../core/widget/field/pinput_widget.dart';
import '../bloc/auth_bloc/auth_bloc.dart';
import '../view/complete_profile.view.dart';
import 'custom/logo_auth.widget.dart';

class VerifyotpWidget extends StatelessWidget {
  const VerifyotpWidget({super.key, required this.authBloc});
  final AuthBloc authBloc;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 100, left: 20, right: 20),
      child: Form(
        // key: authBloc.formState,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(),
            LogoAuthWidget(),
            const Spacer(),
            Text("pleasePhoneN".tr,
                style: AppTextStyles.getBoldStyle(fontSize: 22)),
            const SizedBox(height: 10),
            Text("4otp".tr,
                textAlign: TextAlign.start,
                style: AppTextStyles.getMediumStyle()),
            Text(
              "*******",
              //TODO: rmove this hard code
              // "${authBloc.mobileController.text.substring(0, 4)}***",
              textDirection: TextDirection.ltr,
              textAlign: TextAlign.start,
              style: const TextStyle(),
            ),
            const SizedBox(height: 20),
            PinputWidget(
                pinController: authBloc.pinController,
                pinputFocusNode: authBloc.pinputFocusNode,
                onCompeted: (pin) {
                  Get.to(() => CompleteProfileView(authBloc: authBloc));
                }),
            const SizedBox(height: 10),
            const SizedBox(height: 20),
            BlocBuilder<AuthBloc, AuthState>(
                bloc: authBloc,
                builder: (context, state) {
                  if (state is LoadingAuthState) {
                    return ButtonLoadingWidget(
                      isLoading: true,
                      onTap: () {},
                      text: "Verify".tr,
                    );
                  } else {
                    return ButtonLoadingWidget(
                      onTap: () {
                        Get.to(() => CompleteProfileView(authBloc: authBloc));

                        // if (authBloc.pinController.text.isNotEmpty) {
                        //   authBloc.add(const VerifyOtpEvent());
                        // }
                      },
                      text: "Verify".tr,
                    );
                  }
                }),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
