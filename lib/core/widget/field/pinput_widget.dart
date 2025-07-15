import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

import '../../utils/resource/color_app.dart';

class PinputWidget extends StatelessWidget {
  final TextEditingController pinController;
  final FocusNode pinputFocusNode;
  final void Function(String pin) onCompeted;
  final int length;
  const PinputWidget(
      {super.key,
      required this.pinController,
      required this.onCompeted,
      required this.pinputFocusNode,
      this.length = 6});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Pinput(
        controller: pinController,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        length: length,
        onCompleted: onCompeted,
        // focusNode: pinputFocusNode,
        keyboardType: TextInputType.number,
        defaultPinTheme: PinTheme(
          width: 53,
          height: 58,
          textStyle: const TextStyle(
              fontSize: 24,
              color: AppColors.mainOneColor,
              fontWeight: FontWeight.w500),
          decoration: BoxDecoration(
            color: Get.isDarkMode
                ? const Color(0x31535151)
                : const Color(0xfff2f2f2),
            border: Border.all(color: const Color(0x999FAACE), width: 0.5),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
      ),
    );
  }
}
