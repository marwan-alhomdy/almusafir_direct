import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../core/utils/resource/color_app.dart';
import '../../../../../core/utils/style/border_radius.dart';
import '../../../../../core/widget/rating/rating.widget.dart';

class LoadingExploreWidget extends StatelessWidget {
  const LoadingExploreWidget({super.key, this.showHeader = true});

  final bool showHeader;
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColorsWithTheme.backgroundbaseShimmer,
      highlightColor: AppColorsWithTheme.backgroundhighlightShimmer,
      child: Column(
        children: [
          if (showHeader)
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: const NeverScrollableScrollPhysics(),
              child: Row(
                children: List.generate(
                  4,
                  (index) => Container(
                    height: 45,
                    width: 150,
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: AppColorsWithTheme.backgroundbaseShimmer,
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
            ),
          Expanded(
            child: SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                child: Wrap(
                  children: List.generate(10, (_) => const _GridListWidget()),
                )),
          ),
        ],
      ),
    );
  }
}

class _GridListWidget extends StatelessWidget {
  const _GridListWidget();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * .50 - 10,
      margin: const EdgeInsets.all(5),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          spacing: 15,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
                borderRadius: BorderRadiusAttribute.all(5),
                child: Container(
                  color: AppColorsWithTheme.backgroundbaseShimmer,
                  width: MediaQuery.sizeOf(context).width * .45,
                  height: 150,
                )),
            Column(
              spacing: 5,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: AppColorsWithTheme.backgroundbaseShimmer,
                      borderRadius: BorderRadius.circular(5)),
                  height: 12,
                  width: 120,
                ),
                const RatingWidget(rating: 3, sizeIcon: 15),
                Row(
                  spacing: 3,
                  children: [
                    const Icon(Iconsax.location, size: 18),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            color: AppColorsWithTheme.backgroundbaseShimmer,
                            borderRadius: BorderRadius.circular(5)),
                        height: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
