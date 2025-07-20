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
            title: "Total Points".tr,
            points: statisticalPoint.sumPoints ?? 0),
        CardPointStatisticalWidget(
            icon: Iconsax.wallet_remove,
            title: "Total Deleted Points".tr,
            points: statisticalPoint.sumPointsRemove ?? 0),
        CardPointStatisticalWidget(
            icon: Iconsax.empty_wallet_tick,
            title: "Total Used Points".tr,
            points: statisticalPoint.sumPointsOut ?? 0),
        CardPointStatisticalWidget(
            icon: Iconsax.wallet,
            title: "Total Current Points".tr,
            points: statisticalPoint.sumPointsAvailable ?? 0),
        CardPointStatisticalWidget(
            icon: Iconsax.wallet_1,
            title: "Point Price".tr,
            points: statisticalPoint.pointPrice ?? 0),
        CardPointStatisticalWidget(
            icon: Iconsax.wallet_money,
            title: "Total Points Value".tr,
            points: statisticalPoint.sumTotal ?? 0),
        CardPointStatisticalWidget(
            icon: Iconsax.wallet_minus,
            title: "Total Value of Used Points".tr,
            points: statisticalPoint.sumTotalRemove ?? 0),
        CardPointStatisticalWidget(
            icon: Iconsax.wallet_3,
            title: "Total Value of Available Points".tr,
            points: statisticalPoint.sumTotalAvailable ?? 0),
        Card(
            color: Colors.blueAccent,
            child: ListTile(
              onTap: () => Get.to(() => const DetaislPointsView()),
              minTileHeight: 50,
              iconColor: Colors.white,
              leading: const Icon(Iconsax.empty_wallet_time, size: 18),
              title: Text(
                "View Points Transactions".tr,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ))
      ],
    );
  }
}
