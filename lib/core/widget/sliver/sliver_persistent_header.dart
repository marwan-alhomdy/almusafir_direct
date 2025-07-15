import 'package:flutter/material.dart';

class SliverHeaderDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;
  final double height;

  SliverHeaderDelegate({required this.child, required this.height});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      padding: const EdgeInsets.only(bottom: 2),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 1),
            blurRadius: 0.2,
            spreadRadius: 0,
            color: Colors.grey.withValues(alpha: 0.3),
          ),
        ],
      ),
      height: height,
      child: child,
    );
  }

  @override
  double get maxExtent => height;

  @override
  double get minExtent => height;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}
