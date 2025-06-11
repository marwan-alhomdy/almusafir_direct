import 'package:almusafir_direct/core/utils/resource/color_app.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class HomeLoadingWidget extends StatelessWidget {
  const HomeLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColorsWithTheme.backgroundbaseShimmer,
      highlightColor: AppColorsWithTheme.backgroundhighlightShimmer,
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          spacing: 20,
          children: [
            _TextWidget(),
            _SilderWidget(),
            _DotPointWidget(),
            GridView.count(
              crossAxisCount: 3,
              mainAxisSpacing: 0,
              shrinkWrap: true,
              childAspectRatio: 5 / 4,
              physics: NeverScrollableScrollPhysics(),
              children: List.generate(20, (index) => _CardWidget()),
            ),
          ],
        ),
      ),
    );
  }
}

class _TextWidget extends StatelessWidget {
  const _TextWidget();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(width: double.infinity),
        Container(
          height: 10,
          width: MediaQuery.sizeOf(context).width * 0.2,
          margin: EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: AppColorsWithTheme.backgroundbaseShimmer,
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        Container(
          height: 10,
          width: MediaQuery.sizeOf(context).width * 0.5,
          margin: EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: AppColorsWithTheme.backgroundbaseShimmer,
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ],
    );
  }
}

class _SilderWidget extends StatelessWidget {
  const _SilderWidget();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      decoration: BoxDecoration(
        color: AppColorsWithTheme.backgroundbaseShimmer,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}

class _DotPointWidget extends StatelessWidget {
  const _DotPointWidget();

  @override
  Widget build(BuildContext context) {
    return Row(
        spacing: 5,
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
            4,
            (index) => Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                      color: AppColorsWithTheme.backgroundbaseShimmer,
                      shape: BoxShape.circle),
                )));
  }
}

class _CardWidget extends StatelessWidget {
  const _CardWidget();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: AppColorsWithTheme.backgroundbaseShimmer,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
