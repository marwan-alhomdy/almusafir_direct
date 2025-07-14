import 'package:almusafir_direct/core/widget/appbar/my_appbar.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../checkout/data/models/service.models.dart';
import '../widgets/services.widget.dart';

class ServicesView extends StatefulWidget {
  const ServicesView({super.key});

  @override
  State<ServicesView> createState() => _ServicesViewState();
}

class _ServicesViewState extends State<ServicesView> {
  bool isGridView = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBarWithLogo(
          actions: [
            IconButton(
              icon: Icon(isGridView
                  ? Iconsax.textalign_justifycenter
                  : Iconsax.element_3_copy),
              onPressed: () => setState(() {
                isGridView = !isGridView;
              }),
            ),
            SizedBox(width: 20),
          ],
        ),
        body: Padding(
            padding: const EdgeInsets.all(10),
            child: isGridView
                ? GridServicesWidget(services: services)
                : ListServicesWidget(services: services)));
  }
}
