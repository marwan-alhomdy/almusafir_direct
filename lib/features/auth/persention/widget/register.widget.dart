import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/utils/resource/text_style.dart';
import '../../../../core/utils/validator/validator.dart';
import '../../../../core/widget/button/button.widget.dart';
import '../../../../core/widget/field/date_picker_fild_widget.dart';
import '../../../../core/widget/field/mobile_field.widget.dart';
import '../../../../core/widget/field/password_field.widget.dart';
import '../../../../core/widget/field/text_field.widget.dart';
import '../logic/register_cubit/register_cubit.dart';
import 'custom/logo_auth.widget.dart';

class RegisterWidget extends StatefulWidget {
  const RegisterWidget({super.key});

  @override
  State<RegisterWidget> createState() => _RegisterWidgetState();
}

class _RegisterWidgetState extends State<RegisterWidget> {
  late final RegisterCubit registerCubit;
  @override
  void initState() {
    registerCubit = context.read<RegisterCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      physics: ClampingScrollPhysics(),
      child: Form(
        key: registerCubit.formState,
        child: Column(
          spacing: 5,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LogoAuthWidget(),
            Text("name".tr, style: AppTextStyles.getMediumStyle()),
            TextFieldWidget(
              controller: registerCubit.nameController,
              validator: "".validator(),
            ),
            Text("mobile".tr, style: AppTextStyles.getMediumStyle()),
            MobileFieldWidget(
              country: registerCubit.country,
              controller: registerCubit.mobileController,
              validator: "".validator(),
              onChangedCountry: (country) =>
                  setState(() => registerCubit.country = country),
            ),
            Text("email".tr, style: AppTextStyles.getMediumStyle()),
            TextFieldWidget(
              controller: registerCubit.emailController,
            ),
            Text("dateOfBirth".tr, style: AppTextStyles.getMediumStyle()),
            DatePickerFieldWidget(
              padding: 0,
              controller: registerCubit.dateOfBirthController,
              validator: "".validator(),
            ),
            Text("password".tr, style: AppTextStyles.getMediumStyle()),
            PasswordFieldWidget(
              controller: registerCubit.passwordController,
              validator: "".validator(),
            ),
            const SizedBox(height: 10),
            BlocBuilder<RegisterCubit, RegisterState>(builder: (_, state) {
              return (state is LoadingRegisterState)
                  ? ButtonLoadingWidget(isLoading: true, text: "")
                  : ButtonLoadingWidget(onTap: _register, text: "OK".tr);
            }),
            TextButton(
              onPressed: _moveToPrivacyPolicy,
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                        text: "By using the app and logging in, you agree to "
                            .tr),
                    TextSpan(
                      text: "Terms of Service and Privacy Policy".tr,
                      style: TextStyle(color: Colors.orange),
                    ),
                  ],
                ),
                style: AppTextStyles.getMediumStyle(),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  void _moveToPrivacyPolicy() {
    final Uri url = Uri.parse('https://account.now-ye.com/en/privacy');
    launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    );
  }

  void _register() {
    if (registerCubit.formState.currentState!.validate()) {
      registerCubit.register();
    }
  }
}
