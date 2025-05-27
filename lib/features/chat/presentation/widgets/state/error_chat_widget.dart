import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../../../../core/utils/resource/images.dart';

import '../../../../../core/widget/button/button.widget.dart';

class ErrorChatWidget extends StatelessWidget {
  const ErrorChatWidget({super.key, required this.message, this.onTap});
  final String message;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(width: double.infinity),
        const Spacer(),
        Center(
            child:
                Lottie.asset(AppLottie.SUCCESS_IMAGE, width: 180, height: 180)),
        const SizedBox(height: 10),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(message),
        ),
        const SizedBox(height: 10),
        SizedBox(
          width: Get.width * 0.7,
          child: ButtonWidget(
            onTap: onTap ?? () {},
            text: "updateData".tr,
          ),
        ),
        const SizedBox(height: 20),
        const Spacer(),
      ],
    );
  }
}
