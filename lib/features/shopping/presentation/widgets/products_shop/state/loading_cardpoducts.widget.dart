import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../../core/utils/resource/color_app.dart';
import '../../../../../../core/utils/style/border_radius.dart';
import '../../../../../../core/widget/rating/rating.widget.dart';

class LoadingCardProductWidget extends StatelessWidget {
  const LoadingCardProductWidget({super.key});

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
                      spacing: 5,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          spacing: 10,
                          children: [
                            Expanded(
                                child: Container(
                              decoration: BoxDecoration(
                                  color:
                                      AppColorsWithTheme.backgroundbaseShimmer,
                                  borderRadius: BorderRadius.circular(5)),
                              height: 12,
                            )),
                          ],
                        ),
                        const RatingWidget(rating: 3, sizeIcon: 15),
                        Row(
                          spacing: 10,
                          children: [
                            Container(
                              width: 100,
                              height: 20,
                              decoration: BoxDecoration(
                                  color:
                                      AppColorsWithTheme.backgroundbaseShimmer,
                                  borderRadius: BorderRadius.circular(5)),
                            ),
                            const Spacer(),
                            Container(
                              width: 80,
                              height: 20,
                              decoration: BoxDecoration(
                                  color:
                                      AppColorsWithTheme.backgroundbaseShimmer,
                                  borderRadius: BorderRadius.circular(5)),
                            ),
                          ],
                        ),
                      ],
                    ),
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
