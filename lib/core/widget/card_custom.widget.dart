import 'package:flutter/material.dart';

import '../utils/resource/color_app.dart';

class CardCustomWidget extends StatelessWidget {
  const CardCustomWidget(
      {super.key,
      required this.child,
      this.margin,
      this.padding,
      this.radius,
      this.height,
      this.width});
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final Widget child;
  final double? radius;
  final double? height;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: margin ?? const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      padding: padding ?? const EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(width: 0.4, color: const Color(0xffEBEEF0)),
          borderRadius: BorderRadius.circular(radius ?? 8)),
      child: child,
    );
  }
}

class CardCustomWithShadowWidget extends StatelessWidget {
  const CardCustomWithShadowWidget(
      {super.key,
      required this.child,
      this.margin,
      this.padding,
      this.height,
      this.width});
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final Widget child;

  final double? height;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: margin ?? const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      padding:
          padding ?? const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      decoration: AppBoxDecoration.mainBoxDecoration,
      child: child,
    );
  }
}
