import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingBarWidget extends StatelessWidget {
  const RatingBarWidget(
      {super.key,
      required this.initialRating,
      this.itemSize = 20,
      required this.onRatingUpdate});
  final num? initialRating;
  final double itemSize;
  final ValueChanged<double> onRatingUpdate;

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      initialRating: initialRating?.toDouble() ?? 1,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: false,
      itemCount: 5,
      itemSize: itemSize,
      glowRadius: 0.1,
      ignoreGestures: false,
      glowColor: Colors.amberAccent,
      unratedColor: Colors.grey.shade300,
      itemBuilder: (__, _) => const Icon(
        Icons.star,
        color: Colors.amber,
      ),
      onRatingUpdate: onRatingUpdate,
    );
  }
}
