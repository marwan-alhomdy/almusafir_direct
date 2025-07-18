import 'package:flutter/material.dart';

import '../../utils/resource/text_style.dart';
import '../image/image_widget.dart';

class ButtonFilterWidget extends StatelessWidget {
  const ButtonFilterWidget(
      {super.key,
      required this.onSelected,
      required this.isSelected,
      this.image,
      required this.title});
  final VoidCallback onSelected;
  final bool isSelected;
  final String? image;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSelected,
      child: Card.filled(
        color: isSelected ? Colors.blue : null,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 5,
          children: [
            const SizedBox(width: 10),
            if (image != null)
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: ImageWidget(
                  image ?? "",
                  width: 25,
                  height: 25,
                ),
              ),
            Text(
              title,
              style: AppTextStyles.getMediumStyle(
                color: isSelected ? Colors.white : null,
              ),
            ),
            const SizedBox(width: 10),
          ],
        ),
      ),
    );
  }
}
