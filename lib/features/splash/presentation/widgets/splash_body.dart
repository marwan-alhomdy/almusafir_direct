import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/utils/resource/images.dart';
import '../../../../core/utils/resource/size_config.dart';
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
        Center(child: Image.asset(AppImages.logo, height: 150, width: 150)),
        const Spacer(),
      ],
    );
  }

  void _goToNextView() {
    Future.delayed(const Duration(seconds: 2), () async {
      Get.offAll(() => const HomeView());
    });
  }
}
