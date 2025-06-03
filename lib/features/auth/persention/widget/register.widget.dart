import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/utils/resource/color_app.dart';
import '../../../../core/utils/resource/text_style.dart';
import '../../../../core/utils/validator/validator.dart';
import '../../../../core/widget/button/button.widget.dart';
import '../../../../core/widget/field/date_picker_fild_widget.dart';
import '../../../../core/widget/field/mobile_field.widget.dart';
import '../../../../core/widget/field/password_field.widget.dart';
import '../../../../core/widget/field/text_field.widget.dart';
import '../logic/regiser_cubit/regiser_cubit.dart';
import 'custom/logo_auth.widget.dart';

class RegisterWidget extends StatefulWidget {
  const RegisterWidget({super.key});

  @override
  State<RegisterWidget> createState() => _RegisterWidgetState();
}

class _RegisterWidgetState extends State<RegisterWidget> {
  late final RegiserCubit regiserCubit;
  @override
  void initState() {
    regiserCubit = context.read<RegiserCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: ClampingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Form(
          key: regiserCubit.formState,
          child: Column(
            spacing: 5,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LogoAuthWidget(),
              Text("name".tr, style: AppTextStyles.getMediumStyle()),
              TextFieldWidget(
                controller: regiserCubit.nameController,
                validator: "enterYourName".tr.validator(),
              ),
              Text("mobile".tr, style: AppTextStyles.getMediumStyle()),
              MobileFieldWidget(
                country: regiserCubit.country,
                controller: regiserCubit.mobileController,
                validator: "".validator(),
                onChangedCountry: (country) {
                  regiserCubit.country = country;
                  setState(() {});
                },
              ),
              Text("email".tr, style: AppTextStyles.getMediumStyle()),
              TextFieldWidget(
                controller: regiserCubit.emailController,
              ),
              Text("Date of birth".tr, style: AppTextStyles.getMediumStyle()),
              DatePickerFieldWidget(
                padding: 0,
                controller: regiserCubit.dateOfBirthController,
                validator: "".tr.validator(),
              ),
              Text("password".tr, style: AppTextStyles.getMediumStyle()),
              PasswordFieldWidget(
                controller: regiserCubit.passwordController,
                validator: "enterYourPassword".tr.validator(),
              ),
              const SizedBox(height: 10),
              BlocBuilder<RegiserCubit, RegiserState>(
                  builder: (context, state) {
                return (state is LoadingRegiserState)
                    ? ButtonLoadingWidget(isLoading: true, text: "")
                    : ButtonLoadingWidget(onTap: _register, text: "OK".tr);
              }),
              Text(
                "By using the app and logging in, you agree to ".tr,
                style:
                    AppTextStyles.getMediumStyle(color: AppColors.grayTwoColor),
              ),
              GestureDetector(
                onTap: () {
                  final Uri url = Uri.parse('');
                  launchUrl(
                    url,
                    mode: LaunchMode.externalApplication,
                  );
                },
                child: Text(
                  "Terms of Service and Privacy Policy".tr,
                  style: AppTextStyles.getMediumStyle(color: Colors.orange),
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  void _register() {
    if (regiserCubit.formState.currentState!.validate()) {
      regiserCubit.register();
    }
  }
}
