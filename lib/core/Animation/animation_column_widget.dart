import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class AnimationColumnWidget extends StatelessWidget {
  const AnimationColumnWidget({
    super.key,
    required this.children,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.spacing = 0,
  });
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final List<Widget> children;
  final double spacing;
  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: Column(
        spacing: spacing,
        mainAxisAlignment: mainAxisAlignment,
        crossAxisAlignment: crossAxisAlignment,
        children: List.generate(
          children.length,
          (index) {
            return AnimationConfiguration.staggeredGrid(
                position: index,
                duration: const Duration(milliseconds: 1500),
                columnCount: children.length,
                child: ScaleAnimation(
                    duration: const Duration(milliseconds: 1500),
                    curve: Curves.fastLinearToSlowEaseIn,
                    child: FadeInAnimation(child: children[index])));
          },
        ),
      ),
    );
  }
}
