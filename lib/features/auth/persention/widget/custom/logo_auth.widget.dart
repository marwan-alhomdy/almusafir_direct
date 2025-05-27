import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

import '../../../../../core/utils/resource/images.dart';

class LogoAuthWidget extends StatelessWidget {
  const LogoAuthWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: KeyboardVisibilityBuilder(
        builder: (context, isKeyboardVisible) => Visibility(
          visible: isKeyboardVisible == false,
          child: Image.asset(AppImages.LOGO_COLORS, height: 150, width: 150),
        ),
      ),
    );
  }
}
