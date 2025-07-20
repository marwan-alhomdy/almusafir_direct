import 'package:almusafir_direct/helper/cache_helper.dart';
import 'package:almusafir_direct/helper/public_infromation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constants/cached/cached_name.dart';
import '../../../../core/utils/resource/images.dart';
import '../../../home/presentation/view/home_view.dart';
import '../../../onboarding/presentation/pages/onboarding.view.dart';

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
    return Column(
      children: [
        const Spacer(),
        Center(
          child: Hero(
              tag: AppImages.logo,
              child: Image.asset(AppImages.logo, height: 150, width: 150)),
        ),
        const Spacer(),
      ],
    );
  }

  void _goToNextView() {
    Future.delayed(const Duration(seconds: 1), () async {
      final isOnBorading = CacheHelper.getBool(CachedAppKey.isOnBorading);
      if (isOnBorading ?? false) {
        Get.offAll(() => HomeView(key: Helper.homeKey));
      } else {
        CacheHelper.setBool(CachedAppKey.isOnBorading, true);
        Get.offAll(() => const OnboardingView());
      }
    });
  }
}
