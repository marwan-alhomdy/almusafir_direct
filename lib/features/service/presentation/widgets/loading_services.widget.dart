import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/utils/resource/color_app.dart';

class LoadingListServicesWidget extends StatelessWidget {
  const LoadingListServicesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColorsWithTheme.backgroundbaseShimmer,
      highlightColor: AppColorsWithTheme.backgroundhighlightShimmer,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 20,
        itemBuilder: (_, __) => ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 10),
          leading: Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
                color: AppColorsWithTheme.backgroundbaseShimmer,
                borderRadius: BorderRadius.circular(5)),
          ),
          title: Container(
            width: 70,
            height: 15,
            decoration: BoxDecoration(
                color: AppColorsWithTheme.backgroundbaseShimmer,
                borderRadius: BorderRadius.circular(5)),
          ),
          subtitle: Container(
            width: 70,
            height: 15,
            margin: const EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
                color: AppColorsWithTheme.backgroundbaseShimmer,
                borderRadius: BorderRadius.circular(5)),
          ),
        ),
      ),
    );
  }
}

class LoadingGridServicesWidget extends StatelessWidget {
  const LoadingGridServicesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColorsWithTheme.backgroundbaseShimmer,
      highlightColor: AppColorsWithTheme.backgroundhighlightShimmer,
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3),
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 20,
          itemBuilder: (_, __) => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                        color: AppColorsWithTheme.backgroundbaseShimmer,
                        borderRadius: BorderRadius.circular(5)),
                  ),
                  Container(
                    height: 10,
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: AppColorsWithTheme.backgroundbaseShimmer,
                        borderRadius: BorderRadius.circular(5)),
                  ),
                ],
              )),
    );
  }
}
