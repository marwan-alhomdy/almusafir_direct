import 'package:almusafir_direct/features/profile/data/model/statistical_point_module.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../view/point/details_points.widget.dart';
import 'card_point.dart';

class MyPointsWidget extends StatelessWidget {
  const MyPointsWidget({super.key, required this.statisticalPoint});
  final StatisticalPointModule statisticalPoint;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CardPointStatisticalWidget(
            icon: Iconsax.wallet,
            title: "إجمالي النقاط",
            points: statisticalPoint.sumPoints ?? 0),
        CardPointStatisticalWidget(
            icon: Iconsax.wallet_remove,
            title: 'إجمالي النقاط المحذوفة',
            points: statisticalPoint.sumPointsRemove ?? 0),
        CardPointStatisticalWidget(
            icon: Iconsax.empty_wallet_tick,
            title: 'إجمالي النقاط المستخدمة',
            points: statisticalPoint.sumPointsOut ?? 0),
        CardPointStatisticalWidget(
            icon: Iconsax.wallet,
            title: 'إجمالي النقاط الحالية',
            points: statisticalPoint.sumPointsAvailable ?? 0),
        CardPointStatisticalWidget(
            icon: Iconsax.wallet_1,
            title: 'سعر النقطة',
            points: statisticalPoint.pointPrice ?? 0),
        CardPointStatisticalWidget(
            icon: Iconsax.wallet_money,
            title: 'إجمالي قيمة النقاط',
            points: statisticalPoint.sumTotal ?? 0),
        CardPointStatisticalWidget(
            icon: Iconsax.wallet_minus,
            title: 'اجمالي قيمة النقاط  المستخدمة',
            points: statisticalPoint.sumTotalRemove ?? 0),
        CardPointStatisticalWidget(
            icon: Iconsax.wallet_3,
            title: 'اجمالي قيمة النقاط المتاحة',
            points: statisticalPoint.sumTotalAvailable ?? 0),
        Card(
            color: Colors.blueAccent,
            child: ListTile(
              onTap: () => Get.to(() => const DetaislPointsView()),
              minTileHeight: 50,
              iconColor: Colors.white,
              leading: const Icon(Iconsax.empty_wallet_time, size: 18),
              title: const Text(
                'عرض عمليات النقاط',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ))
      ],
    );
  }
}
