import 'package:almusafir_direct/core/utils/style/border_radius.dart';
import 'package:flutter/material.dart';

import '../../utils/resource/color_app.dart';
import '../../utils/resource/font_manager.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
    required this.onTap,
    required this.text,
    this.color,
  });

  final VoidCallback onTap;
  final String text;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          gradient: AppGradientColors.mainGradien,
          borderRadius: BorderRadius.circular(18),
        ),
        child: ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.white,
            elevation: 0,
            padding: const EdgeInsets.all(0),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
          child: DecoratedBox(
            decoration: BoxDecoration(
                color: color,
                gradient: color != null ? null : AppGradientColors.mainGradien,
                borderRadius: BorderRadius.circular(18)),
            child: Container(
              alignment: Alignment.center,
              width: double.infinity,
              height: 56,
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  fontFamily: FontFamilyNames.dINNextLTArabicMedium,
                ),
              ),
            ),
          ),
        ));
  }
}

class OutlinedButtonWidget extends StatelessWidget {
  const OutlinedButtonWidget({
    super.key,
    required this.onTap,
    required this.text,
    this.color,
  });

  final VoidCallback onTap;
  final String text;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          padding: const EdgeInsets.all(0),
          shape: RoundedRectangleBorder(
              side:
                  BorderSide(width: 1, color: color ?? AppColors.mainOneColor),
              borderRadius: BorderRadius.circular(18)),
        ),
        child: DecoratedBox(
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(18)),
          child: Container(
            alignment: Alignment.center,
            width: double.infinity,
            height: 56,
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                fontFamily: FontFamilyNames.dINNextLTArabicMedium,
              ),
            ),
          ),
        ));
  }
}

class ButtonLoadingWidget extends StatelessWidget {
  const ButtonLoadingWidget({
    super.key,
    this.onTap,
    required this.text,
    this.color,
    this.isLoading = false,
  });

  final VoidCallback? onTap;
  final String text;
  final Color? color;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          gradient: AppGradientColors.mainGradien,
          borderRadius: BorderRadius.circular(18),
        ),
        child: ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.white,
            elevation: 0,
            padding: const EdgeInsets.all(0),
            shape: RoundedRectangleBorderAttribute.all(10),
          ),
          child: DecoratedBox(
            decoration: BoxDecoration(
                color: color,
                gradient: color != null ? null : AppGradientColors.mainGradien,
                borderRadius: BorderRadius.circular(18)),
            child: Container(
              alignment: Alignment.center,
              width: double.infinity,
              height: 56,
              child: isLoading
                  ? const CircularProgressIndicator(
                      color: Colors.white,
                    )
                  : Text(
                      text,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 16,
                        fontFamily: FontFamilyNames.dINNextLTArabicMedium,
                      ),
                    ),
            ),
          ),
        ));
  }
}

class ButtonIconWidget extends StatelessWidget {
  const ButtonIconWidget(
      {super.key,
      required this.onTap,
      required this.iconButton,
      this.color,
      this.radius = 18});

  final VoidCallback onTap;
  final IconData iconButton;
  final Color? color;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width * 0.9,
        margin: const EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          color: color,
          gradient: color != null ? null : AppGradientColors.mainGradien,
          borderRadius: BorderRadius.circular(radius),
        ),
        child: ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.white,
            elevation: 0,
            padding: const EdgeInsets.all(0),
            shape: RoundedRectangleBorderAttribute.all(10),
          ),
          child: Container(
              alignment: Alignment.center,
              width: double.infinity,
              height: 56,
              child: Icon(iconButton)),
        ));
  }
}
