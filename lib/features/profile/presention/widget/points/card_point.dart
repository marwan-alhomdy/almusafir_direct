import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../../../core/utils/handler/handler.dart';

class CardPointWidget extends StatelessWidget {
  const CardPointWidget({
    super.key,
    required this.title,
    required this.note,
    required this.createAt,
  });
  final String title;

  final String? note;
  final String? createAt;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 5),
          ListTile(
            minLeadingWidth: 0,
            leading: Icon(
              Iconsax.wallet,
              color: Colors.deepOrange,
              size: 18,
            ),
            title: Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            trailing: Text(
              DateTimeHandler.formatDateFromString(createAt),
              style: TextStyle(color: Colors.blueAccent),
            ),
          ),
          Divider(height: 0, endIndent: 20, indent: 20),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(note ?? "----"),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}

class CardPointStatisticalWidget extends StatelessWidget {
  const CardPointStatisticalWidget(
      {super.key,
      required this.title,
      required this.icon,
      required this.points});
  final String title;
  final int points;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
      minTileHeight: 50,
      leading: Icon(icon, size: 18),
      title: Text(title),
      trailing: Text(points.toString()),
    ));
  }
}
