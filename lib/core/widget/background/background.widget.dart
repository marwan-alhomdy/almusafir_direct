import 'package:flutter/material.dart';

import '../../utils/drwn/triangle_clipper.dart';
import '../../utils/resource/color_app.dart';
import '../../utils/style/border_radius.dart';

class BackgroundWidget extends StatelessWidget {
  const BackgroundWidget({
    super.key,
    this.appBar,
    required this.child,
  });
  final Widget child;

  final PreferredSizeWidget? appBar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainOneColor,
      appBar: appBar,
      body: Stack(
        children: [
          ClipPath(
            clipper: TriangleClipper(),
            child: Container(color: Theme.of(context).scaffoldBackgroundColor),
          ),
          Container(
            height: 50,
            width: MediaQuery.sizeOf(context).width,
            decoration: BoxDecoration(
              color: AppColors.mainOneColor,
              borderRadius: BorderRadiusAttribute.bottom(10),
            ),
          ),
          child,
        ],
      ),
    );
  }
}

class BackgroundWidget2 extends StatelessWidget {
  const BackgroundWidget2({
    super.key,
    required this.child,
    this.topMargin = 50,
  });
  final Widget child;
  final double topMargin;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      margin: EdgeInsets.only(left: 10, right: 10, top: topMargin, bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xffEBEEF0)),
        borderRadius: BorderRadius.circular(12),
      ),
      child: child,
    );
  }
}
