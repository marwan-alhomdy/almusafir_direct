import 'package:flutter/material.dart';

import '../../utils/resource/text_style.dart';
import '../../utils/style/border_radius.dart';

class ContainerTextWidget extends StatelessWidget {
  const ContainerTextWidget(this.text,
      {super.key, required this.fontSize, required this.color});
  final String text;
  final double fontSize;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(5, 0, 5, 5),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadiusAttribute.all(5),
      ),
      child: Text(
        text,
        style: AppTextStyles.getMediumStyle(
          color: color,
          fontSize: fontSize,
        ),
      ),
    );
  }
}
