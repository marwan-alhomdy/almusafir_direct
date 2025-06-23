import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/utils/resource/text_style.dart';
import '../../../../core/utils/style/border_radius.dart';
import '../../../../core/widget/image/image_widget.dart';
import '../../../services/presentation/pages/form_service_input.view.dart';
import '../../../services/presentation/pages/service.view.dart';
import '../../../services/presentation/pages/service_category.view.dart';
import '../../../services/presentation/pages/service_items.view.dart';
import '../../data/model/orderstypes/datum.dart';

class CardServsiceWidget extends StatelessWidget {
  const CardServsiceWidget({super.key, required this.orderType});

  final OrderType? orderType;

  @override
  Widget build(BuildContext context) {
    return Card.filled(
      margin: EdgeInsets.all(5),
      child: InkWell(
        customBorder: RoundedRectangleBorderAttribute.all(12),
        onTap: (orderType?.isSoon == 1) ? null : _moveToServiceDetails,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ImageWidget(
                  orderType?.image?.small ?? "",
                  width: 50,
                  height: 50,
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
                  padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
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
      //TODO : add Category Department Daily screen
      Get.to(() => ServiceCategoryView(orderType: orderType));
    } else if (orderType?.isRequiredCart == 1 &&
        orderType?.isRequiredShopId == 0) {
      print("ServiceItemsView");
      print(orderType?.refType);
      Get.to(() => ServiceItemsView());
    } else if (orderType?.isRequiredCart == 0) {
      print("FormServiceInputView");
      Get.to(() => FormServiceInputView(orderType: orderType));
    } else {
      print("ServicesView");
      Get.to(() => ServicesView());
    }
  }
}

class CardServsiceWidget2 extends StatelessWidget {
  const CardServsiceWidget2({super.key, required this.orderType});

  final OrderType? orderType;

  @override
  Widget build(BuildContext context) {
    return Card.filled(
      margin: EdgeInsets.all(5),
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
