import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../core/utils/resource/color_app.dart';
import '../../../../../core/utils/style/border_radius.dart';
import '../../../../../core/widget/rating/rating.widget.dart';

class LoadingServiceCategoryWidget extends StatelessWidget {
  const LoadingServiceCategoryWidget(
      {super.key, required this.isGridView, this.showHeader = true});
  final bool isGridView;
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
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
              ),
            ),
          Expanded(
            child: SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: isGridView
                  ? Wrap(
                      children:
                          List.generate(10, (_) => const _GridListWidget()),
                    )
                  : Column(
                      children:
                          List.generate(10, (_) => const _LoadingListWidget()),
                    ),
            ),
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
      //height: 220,
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
                  height: MediaQuery.sizeOf(context).width * .45,
                )),
            Column(
              spacing: 10,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const RatingWidget(
                      rating: 3,
                      sizeIcon: 15,
                    ),
                    const Spacer(),
                    Container(
                      decoration: BoxDecoration(
                          color: AppColorsWithTheme.backgroundbaseShimmer,
                          borderRadius: BorderRadius.circular(5)),
                      height: 12,
                      width: 50,
                    ),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                      color: AppColorsWithTheme.backgroundbaseShimmer,
                      borderRadius: BorderRadius.circular(5)),
                  height: 12,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: AppColorsWithTheme.backgroundbaseShimmer,
                      borderRadius: BorderRadius.circular(5)),
                  height: 12,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _LoadingListWidget extends StatelessWidget {
  const _LoadingListWidget();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          spacing: 15,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
                borderRadius: BorderRadiusAttribute.all(5),
                child: Container(
                  color: AppColorsWithTheme.backgroundbaseShimmer,
                  width: 70,
                  height: 70,
                )),
            Expanded(
              child: Column(
                spacing: 10,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: AppColorsWithTheme.backgroundbaseShimmer,
                        borderRadius: BorderRadius.circular(5)),
                    height: 12,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: AppColorsWithTheme.backgroundbaseShimmer,
                        borderRadius: BorderRadius.circular(5)),
                    height: 12,
                  ),
                  const RatingWidget(
                    rating: 3,
                    sizeIcon: 15,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
