import 'package:flutter/material.dart';

class RatingWidget extends StatelessWidget {
  const RatingWidget({
    super.key,
    required this.rating,
    this.sizeIcon,
    this.hideLessThan2 = false,
  });
  final num rating;
  final double? sizeIcon;
  final bool hideLessThan2;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: !hideLessThan2 || hideLessThan2 && rating >= 2,
      child: Row(
        children: List.generate(
          5,
          (index) => Icon(
            (rating >= 1 && index <= rating - 1)
                ? Icons.star_rate_rounded
                : Icons.star_border_rounded,
            color: Colors.orange,
            size: sizeIcon,
          ),
        ),
      ),
    );
  }
}
