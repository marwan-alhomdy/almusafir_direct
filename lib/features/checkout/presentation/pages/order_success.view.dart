import 'package:almusafir_direct/core/utils/resource/color_app.dart';
import 'package:almusafir_direct/core/widget/appbar/my_appbar.dart';
import 'package:almusafir_direct/core/widget/button/button.widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/utils/resource/images.dart';
import '../../../../core/utils/resource/text_style.dart';
import '../../../../helper/public_infromation.dart';

class OrderSuccessPage extends StatelessWidget {
  const OrderSuccessPage({super.key, required this.message});
  final String message;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: const MyAppBarWithoutBack(),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Lottie.asset(
                    AppLottie.success,
                    width: Get.width,
                    repeat: false,
                  ),
                ),
                Text("Order Placed Successfully!".tr,
                    style: AppTextStyles.getBoldStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.mainOneColor,
                    )),
                const SizedBox(height: 20),
                Text(message,
                    textAlign: TextAlign.center,
                    style: AppTextStyles.getRegularStyle()),
                const SizedBox(height: 20),
                ButtonWidget(
                    onTap: () =>
                        Helper.homeKey.currentState?.changeScreenWithBack(0),
                    text: "Back to Home".tr),
                const SizedBox(height: 10),
                OutlinedButtonWidget(
                    onTap: () =>
                        Helper.homeKey.currentState?.changeScreenWithBack(1),
                    text: "My Orders".tr),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
