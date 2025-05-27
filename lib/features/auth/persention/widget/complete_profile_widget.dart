import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/utils/resource/color_app.dart';
import '../../../../core/utils/resource/text_style.dart';
import '../../../../core/utils/validator/validator.dart';
import '../../../../core/widget/button/button.widget.dart';
import '../../../../core/widget/field/date_picker_fild_widget.dart';
import '../../../../core/widget/field/text_field.widget.dart';
import '../../../home/presentation/view/home_view.dart';
import '../bloc/auth_bloc/auth_bloc.dart';
import 'custom/logo_auth.widget.dart';

class CompleteProfileWidget extends StatelessWidget {
  const CompleteProfileWidget({super.key, required this.authBloc});
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
            const SizedBox(height: 20),
            Text(
              "Hello, our dear visitor 👋".tr,
              style: AppTextStyles.getBoldStyle(fontSize: 22),
            ),
            const SizedBox(height: 10),
            Text("name".tr, style: AppTextStyles.getMediumStyle()),
            const SizedBox(height: 10),
            TextFieldWidget(
              controller: authBloc.nameController,
              validator: "enterYourName".tr.validator(),
            ),
            Text("name".tr, style: AppTextStyles.getMediumStyle()),
            const SizedBox(height: 10),
            DatePickerFieldWidget(
              padding: 0,
              name: "",
              controller: authBloc.nameController,
              validator: "enterYourName".tr.validator(),
            ),
            const SizedBox(height: 10),
            BlocBuilder<AuthBloc, AuthState>(
                bloc: authBloc,
                builder: (context, state) {
                  if (state is LoadingAuthState) {
                    return ButtonLoadingWidget(
                      isLoading: true,
                      onTap: () {},
                      text: "".tr,
                    );
                  } else {
                    return ButtonLoadingWidget(
                      onTap: () {
                        Get.offAll(() => HomeView());
                      },
                      text: "OK".tr,
                    );
                  }
                }),
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
}
