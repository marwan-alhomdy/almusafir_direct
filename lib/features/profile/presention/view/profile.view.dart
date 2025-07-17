import 'package:almusafir_direct/features/order/presentation/logic/order_cubit/order_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '/injection_container.dart' as di;
import '../../../../core/server/error_token.dart';
import '../../../../core/utils/function/message_box.dart';
import '../../../../core/utils/function/toast_box.dart';
import '../../../../core/widget/appbar/my_appbar.dart';
import '../../../../helper/public_infromation.dart';
import '../bloc/profile_bloc/profile_bloc.dart';
import '../widget/profile.widget.dart';

class ProfileVeiw extends StatefulWidget {
  const ProfileVeiw({super.key});

  @override
  State<ProfileVeiw> createState() => _ProfileVeiwState();
}

class _ProfileVeiwState extends State<ProfileVeiw> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBarWithLogo(),
      body: BlocProvider(
        create: (context) => di.sl<ProfileBloc>(),
        child: BlocListener<ProfileBloc, ProfileState>(
          listener: _listenerProfile,
          child: const ProfileWidget(),
        ),
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
      ErrorTokenAuth.logoutApp();
      context.read<OrderCubit>().orders = null;
      Helper.homeKey.currentState?.changeScreenWithBack(0);
    }
  }
}
