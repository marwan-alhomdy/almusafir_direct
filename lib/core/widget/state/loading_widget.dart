import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../utils/resource/images.dart';

class LoadingWiget extends StatelessWidget {
  const LoadingWiget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 150,
        width: 150,
        child: Lottie.asset(AppLottie.loading),
      ),
    );
  }
}
