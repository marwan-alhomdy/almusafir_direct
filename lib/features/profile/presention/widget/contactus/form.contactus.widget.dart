import 'package:almusafir_direct/core/utils/validator/validator.dart';
import 'package:almusafir_direct/core/widget/button/button.widget.dart';
import 'package:almusafir_direct/core/widget/field/text_field.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../../../core/utils/resource/text_style.dart';
import '../../../../../core/widget/liner.widget.dart';
import '../../bloc/contact_us_cubit/contact_us_cubit.dart';

class FormContactUsWidget extends StatefulWidget {
  const FormContactUsWidget({super.key});

  @override
  State<FormContactUsWidget> createState() => _FormContactUsWidgetState();
}

class _FormContactUsWidgetState extends State<FormContactUsWidget> {
  late final ContactUsCubit contactCubit;

  @override
  void initState() {
    contactCubit = context.read<ContactUsCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Form(
        key: contactCubit.formState,
        child: Column(
          spacing: 10,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            LineButtonSheetWidget(),
            Row(
              spacing: 10,
              children: [
                Icon(Iconsax.message_copy),
                Text(
                  "contact_us".tr,
                  style: AppTextStyles.getMediumStyle(fontSize: 18),
                ),
              ],
            ),
            Text("name".tr, style: AppTextStyles.getRegularStyle()),
            TextFieldWidget(
              validator: "".validator(),
              controller: contactCubit.nameController,
              isReadOnly: contactCubit.isReadOnly &&
                  contactCubit.nameController.text.isNotEmpty,
            ),
            Text("email".tr, style: AppTextStyles.getRegularStyle()),
            TextFieldWidget(
              controller: contactCubit.emailController,
              isReadOnly: contactCubit.isReadOnly &&
                  contactCubit.emailController.text.isNotEmpty,
            ),
            Text("mobile".tr, style: AppTextStyles.getRegularStyle()),
            TextFieldWidget(
              validator: "".validator(),
              controller: contactCubit.mobileController,
              isReadOnly: contactCubit.isReadOnly &&
                  contactCubit.mobileController.text.isNotEmpty,
            ),
            Text("message".tr, style: AppTextStyles.getRegularStyle()),
            TextFieldWidget(
                validator: "".validator(),
                controller: contactCubit.messageController,
                maxLines: 3),
            SizedBox(),
            BlocBuilder<ContactUsCubit, ContactUsState>(
              builder: (context, state) {
                return (state is LoadingContactUsState)
                    ? ButtonLoadingWidget(text: "", isLoading: true)
                    : ButtonLoadingWidget(
                        text: "OK".tr,
                        onTap: () => contactCubit.contactUs(),
                      );
              },
            ),
            SizedBox(),
          ],
        ),
      ),
    );
  }
}
