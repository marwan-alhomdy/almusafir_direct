import 'package:flutter/material.dart';

class TermsListWidget extends StatelessWidget {
  const TermsListWidget({super.key});

  final List<String> items = const [
    'Tickets must be purchased at least 12 hours before departure',
    'Arrive at the station 45 minutes before departure time',
    'Free cancellation up to 24 hours before departure',
    '50% refund for cancellations between 12–24 hours before departure',
    'No refund for cancellations less than 12 hours before departure',
    'Maximum luggage allowance: 25kg + 7kg hand luggage',
    'Premium meal service available for extra charge',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items
          .map((e) => Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.check_circle, color: Colors.green, size: 18),
                  const SizedBox(width: 8),
                  Expanded(child: Text(e)),
                ],
              ))
          .toList(),
    );
  }
}
