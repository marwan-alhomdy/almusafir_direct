import 'package:almusafir_direct/features/auth/persention/view/verifyotp.view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/utils/resource/color_app.dart';
import '../../../../core/utils/resource/text_style.dart';
import '../../../../core/utils/validator/validator.dart';
import '../../../../core/widget/button/button.widget.dart';
import '../../../../core/widget/field/password_field.widget.dart';
import '../../../home/presentation/view/home_view.dart';
import '../bloc/auth_bloc/auth_bloc.dart';
import 'custom/logo_auth.widget.dart';
import 'custom/username_field_widget.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 100, left: 20, right: 20),
      child: Form(
        key: context.read<AuthBloc>().formState,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(),
            LogoAuthWidget(),
            const Spacer(),
            Text("userName".tr, style: AppTextStyles.getMediumStyle()),
            const SizedBox(height: 15),
            UsernameFieldWidget(
              controller: context.read<AuthBloc>().usernameController,
              validator: "".validator(),
            ),
            const SizedBox(height: 15),
            Text("password".tr, style: AppTextStyles.getMediumStyle()),
            const SizedBox(height: 10),
            PasswordFieldWidget(
              controller: context.read<AuthBloc>().passwordController,
              validator: "".validator(),
            ),
            const SizedBox(height: 20),
            BlocBuilder<AuthBloc, AuthState>(
              builder: (context, state) {
                if (state is LoadingAuthState) {
                  return ButtonLoadingWidget(
                    isLoading: true,
                    onTap: () {},
                    text: "",
                  );
                } else {
                  return ButtonLoadingWidget(
                    onTap: _login,
                    text: "login".tr,
                  );
                }
              },
            ),
            const SizedBox(height: 20),
            Text(
              "By using the app and logging in, you agree to ".tr,
              style:
                  AppTextStyles.getMediumStyle(color: AppColors.grayTwoColor),
            ),
            GestureDetector(
              onTap: () {
                final Uri url =
                    Uri.parse('https://app.thebwash.com/ar/privacy-policy/');
                launchUrl(
                  url,
                  mode: LaunchMode.externalApplication,
                );
              },
              child: Text(
                "Terms of Service and Privacy Policy".tr,
                style: AppTextStyles.getMediumStyle(
                    color: AppColors.blackOneColor),
              ),
            ),
            const Spacer(),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }

  Future<void> _login() async {
    Get.to(() => VerifyOtpView(authBloc: context.read<AuthBloc>()));
    //   final authBloc = context.read<AuthBloc>();
    //   if (authBloc.formState.currentState?.validate() ?? false) {
    //     authBloc.add(const LoginEvent());
    //   }
  }
}
