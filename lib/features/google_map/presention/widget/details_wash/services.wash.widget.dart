import 'package:flutter/material.dart';

import '../../../../../core/utils/resource/color_app.dart';
import '../../../../../core/utils/resource/text_style.dart';

class ServicesWashWidget extends StatelessWidget {
  const ServicesWashWidget(
      {super.key,
      required this.icon,
      required this.title,
      required this.services});
  final IconData icon;
  final String title;
  final List services;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(
        title,
        style: AppTextStyles.getMediumStyle(
          color: AppColors.mainOneColor,
        ),
      ),
      subtitle: Wrap(
        spacing: 15,
        runSpacing: 5,
        children: List.generate(
          services.length,
          (index) => Text(
            services[index],
            style: AppTextStyles.getRegularStyle(),
          ),
        ),
      ),
    );
  }
}
