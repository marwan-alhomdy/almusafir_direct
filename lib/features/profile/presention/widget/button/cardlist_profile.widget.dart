import 'package:flutter/material.dart';

class CardListProfileWidget extends StatelessWidget {
  const CardListProfileWidget(
      {super.key,
      required this.onTap,
      required this.icon,
      required this.title});
  final VoidCallback onTap;
  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Card.filled(
      child: ListTile(
        onTap: onTap,
        minTileHeight: 50,
        leading: Icon(icon, size: 18),
        title: Text(title),
      ),
    );
  }
}
