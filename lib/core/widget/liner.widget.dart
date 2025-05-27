import 'package:flutter/material.dart';

import '../utils/resource/color_app.dart';

class LinerWidget extends StatelessWidget {
  const LinerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 50,
        height: 5,
        margin: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: AppColors.mainOneColor,
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }
}

class LineButtonSheetWidget extends StatelessWidget {
  const LineButtonSheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 70,
        height: 4,
        decoration: BoxDecoration(
            color: AppColors.mainOneColor,
            borderRadius: BorderRadius.circular(5)),
        margin: const EdgeInsets.all(15),
      ),
    );
  }
}
