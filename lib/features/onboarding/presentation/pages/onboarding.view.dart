// ignore_for_file: unused_local_variable

import 'package:almusafir_direct/features/home/presentation/view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/buttons_onboarding.widget.dart';
import '../widgets/images_onboarding.widget.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController();
    super.initState();
  }

  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: ImagesOnboardingWidget(
                controller: _controller,
                onPageChanged: (value) => setState(() => _currentPage = value),
              ),
            ),
            Expanded(
              flex: 1,
              child: ButtonsOnboardingWidget(
                currentPage: _currentPage,
                onSkip: () => Get.offAll(() => HomeView()),
                onNext: () => _controller.nextPage(
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.easeIn,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
