import 'package:flutter/material.dart';

import '../../../../../core/utils/resource/color_app.dart';
import '../../../../../core/utils/resource/text_style.dart';

class ButtonFilterOrderWidget<T> extends StatelessWidget {
  const ButtonFilterOrderWidget(
      {super.key,
      required this.text,
      required this.value,
      required this.group,
      required this.onChanged});
  final String text;
  final T value;
  final T group;
  final void Function(T) onChanged;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(value),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: value != group
              ? AppColors.mainThreeColor.withOpacity(0.2)
              : Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(text,
            style: AppTextStyles.getMediumStyle(
              color: value != group ? Colors.white : AppColors.blackOneColor,
            )),
      ),
    );
  }
}
