import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/utils/resource/color_app.dart';

class LoadingOrdersWidget extends StatelessWidget {
  const LoadingOrdersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColorsWithTheme.backgroundbaseShimmer,
      highlightColor: AppColorsWithTheme.backgroundhighlightShimmer,
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          children: List.generate(
            10,
            (index) => Container(
              margin: const EdgeInsets.all(5),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(border: Border.all(width: 2)),
              child: Column(
                spacing: 8,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Iconsax.bookmark_2_copy,
                        color: AppColorsWithTheme.backgroundbaseShimmer,
                      ),
                      const SizedBox(width: 10),
                      Container(
                        decoration: BoxDecoration(
                            color: AppColorsWithTheme.backgroundbaseShimmer,
                            borderRadius: BorderRadius.circular(5)),
                        height: 12,
                        width: 100,
                      ),
                      const Spacer(),
                      Container(
                        decoration: BoxDecoration(
                            color: AppColorsWithTheme.backgroundbaseShimmer,
                            borderRadius: BorderRadius.circular(5)),
                        height: 25,
                        width: 100,
                      ),
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: AppColorsWithTheme.backgroundbaseShimmer,
                        borderRadius: BorderRadius.circular(5)),
                    height: 1,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: AppColorsWithTheme.backgroundbaseShimmer,
                        borderRadius: BorderRadius.circular(5)),
                    height: 22,
                    width: 250,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: AppColorsWithTheme.backgroundbaseShimmer,
                        borderRadius: BorderRadius.circular(5)),
                    height: 17,
                    width: 220,
                  ),
                  const SizedBox(),
                  ...List.generate(
                    4,
                    (index) => Row(
                      children: [
                        Icon(
                          Iconsax.information_copy,
                          size: 18,
                          color: AppColorsWithTheme.backgroundbaseShimmer,
                        ),
                        const SizedBox(width: 10),
                        Container(
                          decoration: BoxDecoration(
                              color: AppColorsWithTheme.backgroundbaseShimmer,
                              borderRadius: BorderRadius.circular(5)),
                          height: 15,
                          width: 100,
                        ),
                        const Spacer(),
                        Container(
                          decoration: BoxDecoration(
                              color: AppColorsWithTheme.backgroundbaseShimmer,
                              borderRadius: BorderRadius.circular(5)),
                          height: 15,
                          width: 100,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: AppColorsWithTheme.backgroundbaseShimmer,
                        borderRadius: BorderRadius.circular(5)),
                    height: 1,
                  ),
                  Container(
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: AppColorsWithTheme.backgroundbaseShimmer,
                        borderRadius: BorderRadius.circular(5)),
                    height: 45,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
