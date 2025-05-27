import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerCustomCard extends StatelessWidget {
  const ShimmerCustomCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 20,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (contex, index) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.grey[300],
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Container(
                      width: 500,
                      height: 20,
                      color: Colors.grey[300],
                    ),
                  ),
                  const SizedBox(width: 50),
                ],
              ),
              const Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
