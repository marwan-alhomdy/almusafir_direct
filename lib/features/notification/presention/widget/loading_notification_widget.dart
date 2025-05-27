import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../../../core/utils/resource/images.dart';

class LoadingNotificationWiget extends StatelessWidget {
  const LoadingNotificationWiget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 150,
        width: 150,
        child: Lottie.asset(AppLottie.LOADING_DATA),
      ),
    );
  }
}
