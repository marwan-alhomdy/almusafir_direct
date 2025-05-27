import 'package:flutter/material.dart';

class RoutesRowWidget extends StatelessWidget {
  const RoutesRowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('Popular Routes',
                style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            RouteRowWidget('Sana\'a - Mukalla', '12000 YER'),
            RouteRowWidget('Sana\'a - Aden', '9000 YER'),
            RouteRowWidget('Aden - Mukalla', '6000 YER'),
          ],
        ),
      ),
    );
  }
}

class RouteRowWidget extends StatelessWidget {
  final String route;
  final String price;

  const RouteRowWidget(this.route, this.price, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(children: [
          const Icon(Icons.arrow_right_alt, color: Colors.blue),
          const SizedBox(width: 4),
          Text(route),
        ]),
        Text(price, style: const TextStyle(fontWeight: FontWeight.bold)),
      ],
    );
  }
}
