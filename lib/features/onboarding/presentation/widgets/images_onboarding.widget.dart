import 'package:flutter/material.dart';

import '../../../../core/utils/resource/text_style.dart';
import '../../data/models/onboarding_contents.module.dart';

class ImagesOnboardingWidget extends StatelessWidget {
  const ImagesOnboardingWidget(
      {super.key, required this.controller, required this.onPageChanged});
  final PageController controller;
  final void Function(int) onPageChanged;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      physics: const ClampingScrollPhysics(),
      controller: controller,
      onPageChanged: onPageChanged,
      itemCount: onboardingContents.length,
      itemBuilder: (context, i) {
        return Padding(
          padding: const EdgeInsets.only(top: 26, bottom: 20),
          child: Column(
            spacing: 20,
            children: [
              Expanded(
                child: Image.asset(
                  onboardingContents[i].image,
                  width: double.infinity,
                  fit: BoxFit.contain,
                ),
              ),
              Text(
                onboardingContents[i].title,
                textAlign: TextAlign.center,
                style: AppTextStyles.getRegularStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
