import 'package:almusafir_direct/core/widget/appbar/my_appbar.dart';
import 'package:almusafir_direct/core/widget/field/text_field.widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/Animation/animation_column_widget.dart';
import '../../../../core/utils/resource/text_style.dart';
import '../../../../core/widget/button/button.widget.dart';
import '../widget/account/image_profile_widget.dart';

class AccountProfileView extends StatelessWidget {
  const AccountProfileView({
    super.key,
  });

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
            Center(child: ImageProfileWidget(image: "")),
            const SizedBox(),
            Text("اسم العميل".tr, style: AppTextStyles.getMediumStyle()),
            TextFieldWidget(controller: TextEditingController()),
            Text("رقم الهاتف".tr, style: AppTextStyles.getMediumStyle()),
            TextFieldWidget(controller: TextEditingController()),
            const SizedBox(height: 5),
            ButtonWidget(text: "حفظ".tr, onTap: () {}),
          ],
        ),
      ),
    );
  }
}
