import 'package:almusafir_direct/core/utils/validator/validator.dart';
import 'package:almusafir_direct/core/widget/appbar/my_appbar.dart';
import 'package:almusafir_direct/core/widget/field/text_field.widget.dart';
import 'package:almusafir_direct/helper/public_infromation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '/injection_container.dart' as di;
import '../../../../core/Animation/animation_column_widget.dart';
import '../../../../core/server/error_token.dart';
import '../../../../core/utils/function/message_box.dart';
import '../../../../core/utils/function/toast_box.dart';
import '../../../../core/utils/resource/text_style.dart';
import '../../../../core/widget/button/button.widget.dart';
import '../../../../core/widget/field/date_picker_fild_widget.dart';
import '../bloc/profile_bloc/profile_bloc.dart';
import '../widget/account/image_profile_widget.dart';

class AccountProfileView extends StatefulWidget {
  const AccountProfileView({
    super.key,
  });

  @override
  State<AccountProfileView> createState() => _AccountProfileViewState();
}

class _AccountProfileViewState extends State<AccountProfileView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.sl<ProfileBloc>()..setDataUserToField(),
      child: BlocListener<ProfileBloc, ProfileState>(
        listener: _listenerProfile,
        child: Builder(builder: (context) {
          return Scaffold(
            appBar: MyAppBarWithLogo(),
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: AnimationColumnWidget(
                spacing: 10,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: ImageProfileWidget(
                        image: Helper.user?.avatar?.original ?? ""),
                  ),
                  const SizedBox(),
                  Text("name".tr, style: AppTextStyles.getMediumStyle()),
                  TextFieldWidget(
                    controller: context.read<ProfileBloc>().nameController,
                  ),
                  Text("mobile".tr, style: AppTextStyles.getMediumStyle()),
                  Directionality(
                    textDirection: TextDirection.ltr,
                    child: TextFieldWidget(
                      isReadOnly: true,
                      controller: context.read<ProfileBloc>().mobileController,
                    ),
                  ),
                  Text("email".tr, style: AppTextStyles.getMediumStyle()),
                  Directionality(
                    textDirection: TextDirection.ltr,
                    child: TextFieldWidget(
                      isReadOnly: true,
                      controller: context.read<ProfileBloc>().emailController,
                    ),
                  ),
                  Text("dateOfBirth".tr, style: AppTextStyles.getMediumStyle()),
                  DatePickerFieldWidget(
                    padding: 0,
                    controller:
                        context.read<ProfileBloc>().dateOfBirthController,
                    validator: "".validator(),
                  ),
                  const SizedBox(height: 5),
                  ButtonWidget(text: "save".tr, onTap: () {}),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }

  void _listenerProfile(BuildContext context, ProfileState state) async {
    if (state is LoadingProfileState) {
      MessageBox.showProgress(context, "loading".tr);
    } else if (state is ErrorProfileState) {
      Get.back();
      ToastBox.show(message: state.message);
    } else if (state is LogoutOrDeleteAccountSuccessfulState) {
      Get.back();
      setState(() => ErrorTokenAuth.logoutApp());
    } else if (state is ChangeAvatarSuccessfulState) {
      Get.back();
      Helper.primaryData?.data?.currentUser?.data?.avatar = state.avatar;
    } else if (state is DeleteAvatarSuccessfulState) {
      Get.back();
      Helper.primaryData?.data?.currentUser?.data?.avatar = null;
    } else if (state is UpdateUserProfileSuccessfulState) {
      Get.back();
      Helper.primaryData?.data?.currentUser = state.user;
      context.read<ProfileBloc>().setDataUserToField();
    }
  }
}
