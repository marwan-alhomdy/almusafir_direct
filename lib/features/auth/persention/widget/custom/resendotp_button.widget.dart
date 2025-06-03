import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/utils/resource/text_style.dart';

class ResendOtpButton extends StatefulWidget {
  final VoidCallback onResend;

  const ResendOtpButton({super.key, required this.onResend});

  @override
  State<ResendOtpButton> createState() => _ResendOtpButtonState();
}

class _ResendOtpButtonState extends State<ResendOtpButton> {
  int remainingTime = 60; // يبدأ العد من 30
  Timer? timer;

  @override
  void initState() {
    super.initState();
    startCountdown();
  }

  void startCountdown() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (remainingTime > 0) {
          remainingTime--;
        } else {
          timer.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerEnd,
      child: TextButton(
        onPressed: remainingTime == 0
            ? () {
                widget.onResend();
                setState(() {
                  remainingTime = 60; // إعادة تشغيل المؤقت
                  startCountdown();
                });
              }
            : null, // تعطيل الزر أثناء العد
        child: Text(
          remainingTime == 0
              ? "resend_code".tr
              : "${"resendCodeHint".tr} $remainingTime  ${"second".tr}", // عرض العد التنازلي أو النص
          style: AppTextStyles.getMediumStyle(),
        ),
      ),
    );
  }
}
