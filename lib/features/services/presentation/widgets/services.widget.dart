import 'package:almusafir_direct/core/utils/function/bottom_sheet.widget.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/resource/text_style.dart';
import '../../../../core/utils/style/border_radius.dart';
import '../../data/models/service.models.dart';
import 'bottomsheet_services.widget.dart';

class ListServicesWidget extends StatelessWidget {
  const ListServicesWidget({super.key, required this.services});
  final List<OtherServiceMoele> services;

  void _showServiceDetails(OtherServiceMoele service) {
    BottomSheetWidget.show(BottomSheetServicesWidget(service: service));
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: ClampingScrollPhysics(),
      itemCount: services.length,
      itemBuilder: (context, index) {
        final service = services[index];
        return Card.filled(
          child: ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 10),
            onTap: () => _showServiceDetails(service),
            title: Text(service.title),
            trailing: const Icon(Icons.chevron_right),
            leading: Card.filled(
              color: service.color.withAlpha(50),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Icon(service.icon, color: service.color),
              ),
            ),
            subtitle: Text(service.description,
                maxLines: 1, overflow: TextOverflow.ellipsis),
          ),
        );
      },
    );
  }
}

class GridServicesWidget extends StatelessWidget {
  const GridServicesWidget({super.key, required this.services});
  final List<OtherServiceMoele> services;

  void _showServiceDetails(OtherServiceMoele service) {
    BottomSheetWidget.show(BottomSheetServicesWidget(service: service));
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      physics: ClampingScrollPhysics(),
      itemCount: services.length,
      itemBuilder: (context, index) {
        final service = services[index];
        return Card.filled(
          margin: EdgeInsets.all(5),
          child: InkWell(
            customBorder: RoundedRectangleBorderAttribute.all(12),
            onTap: () => _showServiceDetails(service),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(service.icon, color: service.color, size: 30),
                SizedBox(height: 10),
                Text(
                  service.title,
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
