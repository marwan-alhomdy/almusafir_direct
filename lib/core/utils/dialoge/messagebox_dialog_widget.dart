import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../resource/color_app.dart';
import '../resource/text_style.dart';

class MessageBoxDialogWidget extends StatelessWidget {
  const MessageBoxDialogWidget(
      {super.key, required this.message, required this.onAccenpt});

  final String message;
  final VoidCallback onAccenpt;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Get.isDarkMode ? Colors.grey.shade800 : Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            // padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(30),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 20),
                //  _headerWidget(context),
                // const Divider(color: Color.fromARGB(123, 76, 76, 76)),
                _contintWidget(),
                const SizedBox(height: 20),
                _bottonWidget(context),
                const SizedBox(height: 20),
              ],
            )),
      ],
    );
  }

  Widget _contintWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Text(
        message,
        textAlign: TextAlign.center,
        maxLines: 3,
        style: AppTextStyles.getMediumStyle(fontSize: 17),
      ),
    );
  }

  Widget _bottonWidget(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
            onPressed: () => Navigator.of(context).pop(),
            style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.grayOneColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                elevation: 0,
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 10)),
            child: Text(
              "no".tr,
              style: AppTextStyles.getMediumStyle(
                fontSize: 16,
                color: Colors.white,
              ),
              // fontSize: 16,
              // fontWeight: FontWeight.w700,
              // color: Colors.white,
            )),
        const SizedBox(width: 50),
        ElevatedButton(
            onPressed: onAccenpt,
            style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.redOneColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 10)),
            child: Text(
              "yes".tr,
              style: AppTextStyles.getMediumStyle(
                fontSize: 16,
                color: Colors.white,
              ),
              // fontSize: 16,
              // fontWeight: FontWeight.w700,
              // color: Colors.white,
            )),
      ],
    );
  }
}
