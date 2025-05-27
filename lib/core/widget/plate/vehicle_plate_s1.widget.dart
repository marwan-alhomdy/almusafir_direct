import 'package:flutter/material.dart';

import '../../utils/resource/color_app.dart';
import '../../utils/resource/images.dart';
import '../../utils/resource/text_style.dart';

class VehiclePlateS1Widget extends StatelessWidget {
  const VehiclePlateS1Widget({
    super.key,
    required this.vehicleNumber,
    required this.lettersEnglish,
    required this.lettersArabic,
    this.margin,
  });

  final String vehicleNumber;
  final String lettersEnglish;
  final String lettersArabic;
  final EdgeInsetsGeometry? margin;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(width: 0.5, color: Colors.black),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          // Left section: Vehicle number
          Expanded(
            flex: 2,
            child: Column(
              children: [
                _buildNumberSection(vehicleNumber),
                _buildNumberSection(vehicleNumber),
              ],
            ),
          ),
          // Middle separator with emblem
          Container(
            width: 80,
            decoration: const BoxDecoration(
              border: Border.symmetric(
                vertical: BorderSide(width: 0.5, color: Colors.black),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(AppImages.KSA, height: 25),
                Text(
                  'KSA',
                  style: AppTextStyles.getMediumStyle(
                    fontSize: 10,
                    color: AppColors.blackOneColor,
                  ),
                ),
              ],
            ),
          ),
          // Right section: Arabic and English letters
          Expanded(
            flex: 2,
            child: Column(
              children: [
                _buildLettersSection(lettersArabic.split('').join(' ')),
                _buildLettersSection(lettersEnglish.split('').join(' ')),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNumberSection(String number) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(
        number,
        textAlign: TextAlign.center,
        style: AppTextStyles.getMediumStyle(
          fontSize: 12,
          color: AppColors.blackOneColor,
        ),
      ),
    );
  }

  Widget _buildLettersSection(String letters) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(
        letters,
        textAlign: TextAlign.center,
        style: AppTextStyles.getMediumStyle(
          fontSize: 12,
          color: AppColors.blackOneColor,
        ),
      ),
    );
  }
}
