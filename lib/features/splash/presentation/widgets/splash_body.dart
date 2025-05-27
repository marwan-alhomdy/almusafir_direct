import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constants/cached/cached_name.dart';
import '../../../../core/data/models/delegate.module.dart';
import '../../../../core/utils/resource/images.dart';
import '../../../../core/utils/resource/size_config.dart';
import '../../../../helper/cache_helper.dart';
import '../../../../helper/public_infromation.dart';
import '../../../auth/persention/view/auth_view.dart';
import '../../../home/presentation/view/home_view.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  SplashViewBodyState createState() => SplashViewBodyState();
}

class SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    _goToNextView();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Column(
      children: [
        const Spacer(),
        Center(
            child: Image.asset(
          AppImages.LOGO_COLORS,
          //color: Colors.white,
          height: 200,
          width: 200,
        )),
        const Spacer(),
      ],
    );
  }

  void _goToNextView() {
    Future.delayed(const Duration(seconds: 1), () async {
      if ((CacheHelper.getBool(CachedAppKey.isAuth) ?? false) == false) {
        Get.offAll(() => const AuthintcationView());
      } else {
        final delegate = CacheHelper.getString(CachedAppKey.deleagete) ?? "";
        Helper.delegate = DelegateModule.fromJson(json.decode(delegate));
        Get.offAll(() => const HomeView());
      }
    });
  }
}
