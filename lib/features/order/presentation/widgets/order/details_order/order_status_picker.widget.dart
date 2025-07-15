import 'package:almusafir_direct/core/constants/enum/order_statues.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../../../../core/utils/resource/color_app.dart';
import '../../../../../../core/utils/resource/text_style.dart';

class OrderStatusPickerWidget extends StatelessWidget {
  const OrderStatusPickerWidget({
    super.key,
    required this.status,
    this.onTap,
  });
  final VoidCallback? onTap;
  final String status;
  @override
  Widget build(BuildContext context) {
    int index = status.getOrderStatuesIndex();
    return Card.filled(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (index == -1) ...[
              ListTitleOrderStatusWidget(
                color: getOrderStatuesColor(index, -1, true),
                icon: Iconsax.info_circle,
                title: OrderStatues.COMPLETE.label,
              )
            ] else ...[
              ListTitleOrderStatusWidget(
                color: getOrderStatuesColor(index, 0, false),
                icon: Iconsax.bag_2,
                title: OrderStatues.NEW.label,
              ),
              _getLine(true),
              ListTitleOrderStatusWidget(
                color: getOrderStatuesColor(index, 1, false),
                icon: Iconsax.shop,
                title: OrderStatues.PROCESSING.label,
              ),
              _getLine(status == ""),
              ListTitleOrderStatusWidget(
                color: getOrderStatuesColor(index, 2, false),
                icon: Iconsax.truck_fast,
                title: OrderStatues.DELIVERY.label,
              ),
              _getLine(status == ""),
              ListTitleOrderStatusWidget(
                color: getOrderStatuesColor(index, 3, true),
                icon: Icons.check_rounded,
                title: OrderStatues.COMPLETE.label,
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _getLine(bool selectLine) {
    return Container(
      width: 1,
      height: 10,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
      child: const VerticalDivider(),
    );
  }

  Color getOrderStatuesColor(int index, int value, bool laster) {
    if (value == -1) {
      return AppColors.redOneColor;
    } else if (index == value) {
      return (laster) ? AppColors.mainOneColor : Colors.orange.shade500;
    } else if (index > value) {
      return AppColors.mainOneColor;
    } else {
      return AppColors.mainOneColor.withAlpha(100);
    }
  }
}

class ListTitleOrderStatusWidget extends StatelessWidget {
  const ListTitleOrderStatusWidget(
      {super.key,
      required this.color,
      required this.icon,
      required this.title});
  final Color color;
  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10,
      children: [
        CircleAvatar(
          backgroundColor: color,
          child: Icon(icon, color: Colors.white, size: 16),
        ),
        Text(
          title,
          style: AppTextStyles.getRegularStyle(
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
