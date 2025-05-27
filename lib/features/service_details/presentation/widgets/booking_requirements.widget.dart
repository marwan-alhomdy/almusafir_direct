import 'package:flutter/material.dart';

class BookingRequirementsWidget extends StatelessWidget {
  const BookingRequirementsWidget({super.key});

  final List<String> items = const [
    'Valid ID card or passport',
    'Booking confirmation (electronic or printed)',
    'Credit card used for booking (if applicable)',
    'Medical certificate for pregnant women beyond 7 months',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items
          .map((e) => Row(
                children: [
                  const Icon(Icons.subdirectory_arrow_right,
                      size: 18, color: Colors.grey),
                  const SizedBox(width: 8),
                  Expanded(child: Text(e)),
                ],
              ))
          .toList(),
    );
  }
}
