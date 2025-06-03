import 'package:almusafir_direct/core/utils/validator/validator.dart';
import 'package:almusafir_direct/core/widget/appbar/my_appbar.dart';
import 'package:almusafir_direct/core/widget/field/text_field.widget.dart';
import 'package:almusafir_direct/helper/public_infromation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/Animation/animation_column_widget.dart';
import '../../../../core/utils/resource/text_style.dart';
import '../../../../core/widget/button/button.widget.dart';
import '../../../../core/widget/field/date_picker_fild_widget.dart';
import '../widget/account/image_profile_widget.dart';

class AccountProfileView extends StatefulWidget {
  const AccountProfileView({
    super.key,
  });

  @override
  State<AccountProfileView> createState() => _AccountProfileViewState();
}

class _AccountProfileViewState extends State<AccountProfileView> {
  final mobileController = TextEditingController();
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final dateOfBirthController = TextEditingController();

  @override
  void initState() {
    final user = Helper.user;
    mobileController.text = user?.mobile ?? "";
    emailController.text = user?.email ?? "";
    nameController.text = user?.name ?? "";
    dateOfBirthController.text = user?.dateOfBirth ?? "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBarWithLogo(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: AnimationColumnWidget(
          spacing: 10,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: ImageProfileWidget(
                    image: Helper.user?.avatar?.original ?? "")),
            const SizedBox(),
            Text("اسم العميل".tr, style: AppTextStyles.getMediumStyle()),
            TextFieldWidget(controller: nameController),
            Text("رقم الهاتف".tr, style: AppTextStyles.getMediumStyle()),
            Directionality(
                textDirection: TextDirection.ltr,
                child: TextFieldWidget(
                    controller: mobileController, isReadOnly: true)),
            Text("email".tr, style: AppTextStyles.getMediumStyle()),
            Directionality(
                textDirection: TextDirection.ltr,
                child: TextFieldWidget(
                    controller: emailController, isReadOnly: true)),
            Text("Date of birth".tr, style: AppTextStyles.getMediumStyle()),
            DatePickerFieldWidget(
              padding: 0,
              controller: dateOfBirthController,
              validator: "".validator(),
            ),
            const SizedBox(height: 5),
            ButtonWidget(text: "حفظ".tr, onTap: () {}),
          ],
        ),
      ),
    );
  }
}
