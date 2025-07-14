import 'package:almusafir_direct/core/widget/image/image_widget.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../../../core/data/service.module.dart';
import '../../../../../core/utils/resource/text_style.dart';

class CheckListServicesWidget extends StatelessWidget {
  const CheckListServicesWidget(
      {super.key,
      required this.services,
      required this.value,
      required this.onChanged});
  final List<ServiceModul> services;
  final ServiceModul? value;
  final Function(ServiceModul) onChanged;

  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: Scrollbar(
      trackVisibility: true,
      thumbVisibility: true,
      child: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(
            services.length,
            (index) => ListTile(
              minVerticalPadding: 0,
              onTap: () => onChanged(services[index]),
              leading: services[index].id == value?.id
                  ? Icon(Iconsax.tick_circle, color: Colors.green)
                  : Icon(Iconsax.tick_circle_copy, color: Colors.grey),
              title: Text(services[index].name ?? "---"),
              subtitle: Text(
                services[index].shortDescription ?? "---",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.getRegularStyle(fontSize: 10),
              ),
              trailing: isLogo(services[index])
                  ? ImageWidget(
                      getLogo(services[index]),
                      fit: BoxFit.cover,
                      width: 20,
                      height: 20,
                    )
                  : null,
            ),
          ),
        ),
      ),
    ));
  }

  bool isLogo(ServiceModul? value) {
    return (value?.logo != null || value?.image != null);
  }

  String getLogo(ServiceModul? value) {
    return value?.logo?.small ?? value?.image?.small ?? "";
  }
}
