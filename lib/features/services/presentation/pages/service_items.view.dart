import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../../core/widget/appbar/my_appbar.dart';
import '../widgets/service_items.widget.dart';

class ServiceItemsView extends StatefulWidget {
  const ServiceItemsView({super.key});

  @override
  State<ServiceItemsView> createState() => _ServiceItemsViewState();
}

class _ServiceItemsViewState extends State<ServiceItemsView> {
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
        body: SingleChildScrollView(
            physics: ClampingScrollPhysics(),
            child: isGridView
                ? ListServiceItemsWidget()
                : GridServiceItemsWidget()));
  }
}
