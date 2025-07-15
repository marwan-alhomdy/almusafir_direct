import 'package:almusafir_direct/core/data/shop_products/shop_products.dart';
import 'package:almusafir_direct/core/utils/function/bottom_sheet.widget.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/resource/text_style.dart';
import '../../../../core/utils/style/border_radius.dart';
import '../../../../core/widget/image/image_widget.dart';
import 'bottomsheet_services.widget.dart';

class ListServicesWidget extends StatelessWidget {
  const ListServicesWidget({super.key, required this.services});
  final List<ShopProduct> services;

  void _showServiceDetails(ShopProduct service) {
    BottomSheetWidget.show(BottomSheetServicesWidget(service: service));
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const ClampingScrollPhysics(),
      itemCount: services.length,
      itemBuilder: (context, index) {
        final service = services[index];
        return Card.filled(
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 10),
            onTap: () => _showServiceDetails(service),
            title: Text(service.name ?? "--"),
            trailing: const Icon(Icons.chevron_right),
            leading: Padding(
              padding: const EdgeInsets.all(10),
              child: ImageWidget(service.image?.small ?? "---",
                  width: 40, height: 30, fit: BoxFit.cover),
            ),
            subtitle: Text(service.description ?? "----",
                maxLines: 1, overflow: TextOverflow.ellipsis),
          ),
        );
      },
    );
  }
}

class GridServicesWidget extends StatelessWidget {
  const GridServicesWidget({super.key, required this.services});

  final List<ShopProduct> services;

  void _showServiceDetails(ShopProduct service) {
    BottomSheetWidget.show(BottomSheetServicesWidget(service: service));
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      physics: const ClampingScrollPhysics(),
      itemCount: services.length,
      itemBuilder: (context, index) {
        final service = services[index];
        return Card.filled(
          margin: const EdgeInsets.all(5),
          child: InkWell(
            customBorder: RoundedRectangleBorderAttribute.all(12),
            onTap: () => _showServiceDetails(service),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ImageWidget(service.image?.small ?? "---",
                    width: 40, height: 30, fit: BoxFit.cover),
                const SizedBox(height: 10),
                Text(
                  service.name ?? "------",
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.getRegularStyle(fontSize: 12),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
