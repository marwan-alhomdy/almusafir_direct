import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerChatBubble extends StatelessWidget {
  const ShimmerChatBubble({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 20,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (contex, index) {
        bool isSentByUser = Random().nextBool();

        return Row(
          mainAxisAlignment:
              isSentByUser ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: [
            Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(isSentByUser ? 16 : 0),
                  bottomRight: Radius.circular(isSentByUser ? 0 : 16),
                  topLeft: const Radius.circular(16),
                  topRight: const Radius.circular(16),
                )),
                color: const Color(0xFFF4F4F4),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    constraints: BoxConstraints(
                        maxWidth: MediaQuery.sizeOf(context).width / 1.5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: double.infinity,
                          height: 14,
                          color: Colors.grey[300],
                        ),
                        const SizedBox(height: 5),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: 40,
                              height: 25,
                              color: Colors.grey[300],
                            ),
                            const SizedBox(width: 6),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
