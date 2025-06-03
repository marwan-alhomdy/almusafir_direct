import 'package:almusafir_direct/core/widget/field/password_field.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../../core/utils/resource/text_style.dart';
import '../../../../core/utils/validator/validator.dart';
import '../../../../core/widget/button/button.widget.dart';
import '../../../../core/widget/field/mobile_email_field.widget.dart';
import '../../../../helper/public_infromation.dart';
import '../logic/auth_bloc/auth_bloc.dart';
import '../view/forget_password.view.dart';
import '../view/register.view.dart';
import 'custom/logo_auth.widget.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Form(
        key: context.read<AuthBloc>().formState,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LogoAuthWidget(),
            Text("mobileOrEmail".tr, style: AppTextStyles.getMediumStyle()),
            const SizedBox(height: 15),
            MobileOrEmailFieldWidget(
              country: context.read<AuthBloc>().country,
              controller: context.read<AuthBloc>().mobileOrEmailController,
              validator: "".validator(),
              onChangedCountry: (country) =>
                  setState(() => context.read<AuthBloc>().country = country),
            ),
            const SizedBox(height: 15),
            Text("password".tr, style: AppTextStyles.getMediumStyle()),
            const SizedBox(height: 15),
            PasswordFieldWidget(
              controller: context.read<AuthBloc>().passwordController,
              validator: "".validator(),
            ),
            const SizedBox(height: 20),
            BlocBuilder<AuthBloc, AuthState>(
              builder: (context, state) {
                return (state is LoadingAuthState)
                    ? ButtonLoadingWidget(isLoading: true, text: "")
                    : ButtonLoadingWidget(onTap: _login, text: "login".tr);
              },
            ),
            const SizedBox(height: 20),
            Center(
              child: TextButton(
                  onPressed: _moveToForgetPassword,
                  child: Text(
                    "forgotPassword".tr,
                    style: AppTextStyles.getMediumStyle(),
                  )),
            ),
            Center(
              child: TextButton(
                onPressed: _moveToRegister,
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(text: "youDon'tHaveAnAccount".tr),
                      WidgetSpan(child: SizedBox(width: 10)),
                      TextSpan(
                        text: "createAccount".tr,
                        style: TextStyle(color: Colors.orange),
                      ),
                    ],
                  ),
                  style: AppTextStyles.getMediumStyle(),
                ),
              ),
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }

  Future<void> _moveToRegister() async {
    Get.to(() => RegisterView())?.then((_) {
      if (Helper.isAuth) Get.back();
    });
  }

  Future<void> _moveToForgetPassword() async {
    Get.to(() => ForgetPasswordView())?.then((_) {
      if (Helper.isAuth) Get.back();
    });
  }

  Future<void> _login() async {
    final authBloc = context.read<AuthBloc>();
    if (authBloc.formState.currentState?.validate() ?? false) {
      authBloc.add(const LoginEvent());
    }
  }
}
