import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../core/utils/resource/color_app.dart';

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
                      children: List.generate(
                        10,
                        (index) => Container(
                          height: 220,
                          width: MediaQuery.sizeOf(context).width * .50 - 10,
                          margin: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: AppColorsWithTheme.backgroundbaseShimmer,
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                    )
                  : Column(
                      children: List.generate(
                        10,
                        (index) => Container(
                          height: 100,
                          width: MediaQuery.sizeOf(context).width - 20,
                          margin: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: AppColorsWithTheme.backgroundbaseShimmer,
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
