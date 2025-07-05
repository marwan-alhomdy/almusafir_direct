import 'package:almusafir_direct/core/utils/resource/text_style.dart';
import 'package:almusafir_direct/core/utils/style/border_radius.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/utils/resource/color_app.dart';
import '../../data/models/onboarding_contents.module.dart';

class ButtonsOnboardingWidget extends StatelessWidget {
  const ButtonsOnboardingWidget({
    super.key,
    required this.currentPage,
    required this.onNext,
    required this.onSkip,
  });
  final int currentPage;
  final void Function() onNext;
  final void Function() onSkip;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            onboardingContents.length,
            (int index) => _buildDots(index: index),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(30),
          child: currentPage + 1 == onboardingContents.length
              ? SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.8,
                  child: ElevatedButton(
                    onPressed: onSkip,
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: AppColors.mainOneColor,
                      shape: RoundedRectangleBorderAttribute.all(12),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 10),
                    ),
                    child: Text(
                      "skip".tr,
                      style: AppTextStyles.getMediumStyle(),
                    ),
                  ),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: onSkip,
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorderAttribute.all(12),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 10),
                      ),
                      child: Text(
                        "skip".tr,
                        style: AppTextStyles.getMediumStyle(),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: onNext,
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: AppColors.mainOneColor,
                        shape: RoundedRectangleBorderAttribute.all(12),
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 10),
                      ),
                      child: Text(
                        "next".tr,
                        style: AppTextStyles.getMediumStyle(),
                      ),
                    ),
                  ],
                ),
        )
      ],
    );
  }

  AnimatedContainer _buildDots({
    int? index,
  }) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
        borderRadius: BorderRadiusAttribute.all(50),
        color: AppColors.mainOneColor,
      ),
      margin: const EdgeInsets.only(right: 5),
      height: 8,
      curve: Curves.easeIn,
      width: currentPage == index ? 20 : 8,
    );
  }
}
