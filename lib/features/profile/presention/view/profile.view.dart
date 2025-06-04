import 'package:almusafir_direct/helper/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '/injection_container.dart' as di;
import '../../../../core/Animation/animation_limiter_widget.dart';
import '../../../../core/constants/cached/cached_name.dart';
import '../../../../core/server/error_token.dart';
import '../../../../core/utils/function/message_box.dart';
import '../../../../core/utils/function/toast_box.dart';
import '../../../../core/widget/appbar/my_appbar.dart';
import '../bloc/profile_bloc/profile_bloc.dart';
import '../widget/button/button_Acount.widget.dart';
import '../widget/button/button_contactus.widget.dart';
import '../widget/button/button_delete_widget.dart';
import '../widget/button/button_helpcenter.widget.dart';
import '../widget/button/button_language.widget.dart';
import '../widget/button/button_login.widget.dart';
import '../widget/button/button_logout.widget.dart';
import '../widget/button/button_payment_method.widget.dart';
import '../widget/button/button_theme.widget.dart';

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
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: AnimationLimiterWidget(
              children: [
                (CacheHelper.getBool(CachedAppKey.isAuth) ?? false)
                    ? const ButtonAcountWidget()
                    : ButtonLoginWidget(onLogin: () => setState(() {})),
                //  const ButtonFavoriteWidget(),
                const ButtonPaymentMethodWidget(),
                const ButtonContactUsWidget(),
                const ButtonHelpCenterWidget(),
                const ButtonLanguageWidget(),
                const ButtonThemeWidget(),
                if (CacheHelper.getBool(CachedAppKey.isAuth) ?? false) ...[
                  const ButtonDeleteAccountWidget(),
                  const ButtonLogoutWidget(),
                ],
              ],
            ),
          ),
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
      setState(() => ErrorTokenAuth.logoutApp());
    }
  }
}
