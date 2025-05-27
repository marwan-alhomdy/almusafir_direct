import 'package:almusafir_direct/core/widget/appbar/my_appbar.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUsView extends StatelessWidget {
  const ContactUsView({super.key});

  Widget sectionTitle(String title) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Text(title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBarWithLogo(),
      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            sectionTitle("Phone Numbers"),
            _InfoRowWidget(
              icon: Icons.mobile_friendly,
              trailing: Iconsax.call,
              title: "+967 123 456 789",
              color: Colors.green,
              onTap: () {},
            ),
            _InfoRowWidget(
              icon: Icons.mobile_friendly,
              trailing: Iconsax.call,
              title: "+967 123 456 788",
              color: Colors.green,
              onTap: () {},
            ),
            _InfoRowWidget(
              icon: Icons.mobile_friendly,
              trailing: Iconsax.call,
              title: "+967 123 456 787",
              color: Colors.green,
              onTap: () {},
            ),
            sectionTitle("Email"),
            _InfoRowWidget(
              icon: Icons.email,
              trailing: Iconsax.send_1,
              title: "info@almusafirr.com",
              color: Colors.red,
              onTap: () {},
            ),
            _InfoRowWidget(
              icon: Icons.email,
              trailing: Iconsax.send_1,
              title: "support@almusafirr.com",
              color: Colors.red,
              onTap: () {},
            ),
            _InfoRowWidget(
              icon: Icons.email,
              trailing: Iconsax.send_1,
              title: "booking@almusafirr.com",
              color: Colors.red,
              onTap: () {},
            ),
            sectionTitle("Website"),
            _InfoRowWidget(
              icon: Icons.language,
              trailing: Iconsax.send_1,
              title: "www.almusafirr.com",
              color: Colors.blue,
              onTap: () {},
            ),
            sectionTitle("WhatsApp"),
            _InfoRowWidget(
              icon: Iconsax.whatsapp,
              trailing: Iconsax.message,
              title: "www.almusafirr.com",
              color: Colors.green,
              onTap: () {},
            ),
            sectionTitle("Branches"),
            _BranchCardWidget(
                name: "Sana'a - Main Office",
                address: "Al-Kahraba Street, Sana'a, Yemen",
                phone: "+967 123 456 789"),
            _BranchCardWidget(
                name: "Aden Branch",
                address: "Al-Mualla District, Aden, Yemen",
                phone: "+967 123 456 780"),
            _BranchCardWidget(
                name: "Taiz Branch",
                address: "26 September Street, Taiz, Yemen",
                phone: "+967 123 456 797"),
          ],
        ),
      ),
    );
  }
}

class _InfoRowWidget extends StatelessWidget {
  const _InfoRowWidget(
      {required this.icon,
      required this.title,
      required this.trailing,
      required this.color,
      required this.onTap});
  final IconData icon;
  final String title;

  final IconData trailing;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Card.filled(
        child: ListTile(
          minTileHeight: 50,
          leading: Icon(icon, size: 18),
          title: Text(title),
          trailing:
              IconButton(onPressed: () {}, color: color, icon: Icon(trailing)),
        ),
      ),
    );
  }
}

class _BranchCardWidget extends StatelessWidget {
  const _BranchCardWidget(
      {required this.name, required this.address, required this.phone});
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
