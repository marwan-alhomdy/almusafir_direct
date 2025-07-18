import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/utils/resource/text_style.dart';
import '../../../../core/utils/style/border_radius.dart';
import '../../../../core/widget/image/image_widget.dart';
import '../../../checkout/presentation/pages/form_checkout_input.view.dart';
import '../../../service/presentation/pages/other_service.view.dart';
import '../../../shopping/presentation/pages/shops_category.view.dart';
import '../../data/model/orderstypes/datum.dart';

class CardServsiceWidget extends StatelessWidget {
  const CardServsiceWidget({super.key, required this.orderType});

  final OrderType? orderType;

  @override
  Widget build(BuildContext context) {
    return Card.filled(
      margin: const EdgeInsets.all(5),
      child: InkWell(
        customBorder: RoundedRectangleBorderAttribute.all(12),
        onTap: (orderType?.isSoon == 1) ? null : _moveToServiceDetails,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 5,
              children: [
                ImageWidget(
                  orderType?.image?.original ?? "",
                  width: 35,
                  height: 35,
                  fit: BoxFit.contain,
                ),
                Text(
                  orderType?.name ?? "",
                  textAlign: TextAlign.center,
                  style: AppTextStyles.getRegularStyle(fontSize: 12),
                ),
              ],
            ),

            // شعار "قريبًا"
            if (orderType?.isSoon == 1)
              Positioned(
                top: 4,
                right: 4,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    'قريبًا',
                    style: AppTextStyles.getRegularStyle(
                        color: Colors.white, fontSize: 12),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  void _moveToServiceDetails() {
    if (orderType?.isRequiredCart == 1 && orderType?.isRequiredShopId == 1) {
      Get.to(() => ShopCategoryView(orderType: orderType));
    } else if (orderType?.isRequiredCart == 1 &&
        orderType?.isRequiredShopId == 0) {
      Get.to(() => OtherServicesView(orderType: orderType));
    } else if (orderType?.isRequiredCart == 0) {
      Get.to(() => FormCheckoutInputView(orderType: orderType));
    } else {
      Get.to(() => const OtherServicesView());
    }
  }
}

class CardServsiceWidget2 extends StatelessWidget {
  const CardServsiceWidget2({super.key, required this.orderType});

  final OrderType? orderType;

  @override
  Widget build(BuildContext context) {
    return Card.filled(
      margin: const EdgeInsets.all(5),
      child: InkWell(
        customBorder: RoundedRectangleBorderAttribute.all(12),
        onTap: () => _moveToServiceDetails(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ImageWidget(orderType?.image?.small ?? "",
                width: 50, height: 50, fit: BoxFit.contain),
            Text(
              orderType?.name ?? "",
              textAlign: TextAlign.center,
              style: AppTextStyles.getRegularStyle(fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }

  void _moveToServiceDetails() {}
}
