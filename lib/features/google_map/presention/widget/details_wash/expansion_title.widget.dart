import 'package:flutter/material.dart';

import '../../../../../core/utils/resource/color_app.dart';
import '../../../../../core/utils/resource/text_style.dart';

class ExpansionTitleWidget extends StatelessWidget {
  const ExpansionTitleWidget({
    super.key,
    required this.title,
    required this.icon,
    required this.children,
  });
  final String title;
  final IconData icon;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      minTileHeight: 0,
      tilePadding: EdgeInsets.symmetric(horizontal: 15),
      leading: Icon(icon),
      title: Text(
        title,
        style: AppTextStyles.getMediumStyle(
          color: AppColors.mainOneColor,
        ),
      ),
      children: children,
    );
  }
}
