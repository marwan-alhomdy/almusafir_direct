import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../core/utils/resource/color_app.dart';

class LoadingFormServiceWidget extends StatelessWidget {
  const LoadingFormServiceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColorsWithTheme.backgroundbaseShimmer,
      highlightColor: AppColorsWithTheme.backgroundhighlightShimmer,
      child: Column(
        children: List.generate(
          4,
          (index) => ListTile(
            minVerticalPadding: 0,
            leading: Icon(
              Iconsax.tick_circle_copy,
              color: AppColorsWithTheme.backgroundbaseShimmer,
            ),
            title: Container(
              height: 10,
              decoration: BoxDecoration(
                color: AppColorsWithTheme.backgroundbaseShimmer,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            subtitle: Container(
              height: 10,
              decoration: BoxDecoration(
                color: AppColorsWithTheme.backgroundbaseShimmer,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
