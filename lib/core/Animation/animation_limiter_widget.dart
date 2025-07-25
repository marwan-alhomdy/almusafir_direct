import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class AnimationLimiterWidget extends StatelessWidget {
  const AnimationLimiterWidget(
      {super.key,
      required this.children,
      this.verticalOffset = 150,
      this.horizontalOffset = -150,
      this.controller,
      this.padding,
      this.physics = const ClampingScrollPhysics()});
  final double verticalOffset;
  final double horizontalOffset;
  final List<Widget> children;
  final ScrollPhysics? physics;
  final ScrollController? controller;
  final EdgeInsetsGeometry? padding;
  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: ListView.builder(
        physics: physics,
        controller: controller,
        itemCount: children.length,
        padding: padding,
        itemBuilder: (BuildContext context, int index) {
          return AnimationConfiguration.staggeredList(
            position: index,
            delay: const Duration(milliseconds: 100),
            child: SlideAnimation(
              duration: const Duration(milliseconds: 800),
              curve: Curves.easeInCubic,
              verticalOffset: verticalOffset,
              horizontalOffset: horizontalOffset,
              child: ScaleAnimation(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.fastLinearToSlowEaseIn,
                  child: children[index]),
            ),
          );
        },
      ),
    );
  }
}
