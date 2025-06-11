import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BranchCardWidget extends StatelessWidget {
  const BranchCardWidget(
      {super.key,
      required this.name,
      required this.address,
      required this.phone});
  final String name;
  final String address;
  final String phone;

  @override
  Widget build(BuildContext context) {
    return Card.filled(
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Text(address),
            const SizedBox(height: 4),
            const Text("Sat-Thu: 8:00 AM – 8:00 PM, Fri: 2:00 PM – 8:00 PM"),
            const SizedBox(height: 8),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () => launchUrl(Uri.parse("tel:$phone")),
                  child: const Text("Call"),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.blue),
                  child: const Text("Directions"),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
