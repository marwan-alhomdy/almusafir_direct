import 'package:almusafir_direct/core/utils/resource/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../../core/widget/appbar/my_appbar.dart';
import '../../data/models/order_module/order_module.dart';
import '../widgets/order/details_order/details_order_price.widget.dart';
import '../widgets/order/details_order/header_details_order.widget.dart';
import '../widgets/order/details_order/order_status_picker.widget.dart';
import '../widgets/order/details_order/products_order.widget.dart';
import '../widgets/order/order_info.widget.dart';

class DetailsOrderView extends StatelessWidget {
  const DetailsOrderView({super.key, required this.order});
  final OrderModule order;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBarWithLogo(),
      body: DetailsOrderWidget(order: order),
    );
  }
}

class DetailsOrderWidget extends StatelessWidget {
  final OrderModule order;
  const DetailsOrderWidget({super.key, required this.order});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(15),
      physics: const ClampingScrollPhysics(),
      child: Column(
        spacing: 10,
        children: [
          HeaderDetailsOrderWidget(order: order),
          if (order.isShowStatuesPicker == 1)
            OrderStatusPickerWidget(
              status: order.orderStatesRefType ?? "",
            ),
          Card.filled(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                spacing: 5,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  OrderInfoWidget(
                      icon: Iconsax.card_copy,
                      label: "Payment Method:".tr,
                      value: order.paymentMethod?.name ?? ""),
                  OrderInfoWidget(
                    icon: Iconsax.save_2_copy,
                    label: "Tax Number:".tr,
                    value: order.department?.vatNumber ?? "",
                  ),
                  OrderInfoWidget(
                    icon: Iconsax.car_copy,
                    label: "Delivery Distance:".tr,
                    value: order.shippingDistance?.toStringAsFixed(4) ?? "",
                  ),
                ],
              ),
            ),
          ),
          Card.filled(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Notes".tr,
                      style: AppTextStyles.getBoldStyle(fontSize: 16)),
                  const Divider(),
                  Text(order.customerNotes ?? "No notes available".tr,
                      style: AppTextStyles.getRegularStyle()),
                ],
              ),
            ),
          ),
          if (order.items?.data?.isNotEmpty ?? false)
            ProductsOrderWidget(order),
          DetailsOrderPriceWidget(order),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
