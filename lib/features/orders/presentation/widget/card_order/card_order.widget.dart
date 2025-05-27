import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../../../core/constants/enum/order_status_custmer.dart';
import '../../../../../core/data/models/order.module.dart';
import '../../../../../core/utils/handler/handler.dart';
import '../../../../../core/utils/resource/color_app.dart';
import '../../../../../core/utils/resource/text_style.dart';
import '../../../../../core/utils/style/border_radius.dart';
import '../../../../../core/widget/container/container_text.widget.dart';
import '../../../../../core/widget/image/image_widget.dart';
import '../../../../../helper/language.helper.dart';
import '../../view/details_order.view.dart';

class CardOrderWidget extends StatelessWidget {
  const CardOrderWidget({super.key, required this.order, required this.status});
  final OrderModel? order;
  final CarWashOrderStatus status;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(() => DetailsOrderView(order: order, status: status)),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(width: 0.4, color: const Color(0xffEBEEF0)),
            borderRadius: const BorderRadius.all(Radius.circular(18))),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${"orderN".tr}( #${order?.id ?? "0000"} )",
                    style: AppTextStyles.getBoldStyle(
                      color: AppColors.blackOneColor,
                    ),
                  ),
                  ContainerTextWidget(
                    LanguageHelper.chooseLabelLanguage(
                      arabic: status.arabicTitle,
                      english: status.title,
                    ),
                    color: status.background,
                    fontSize: 12,
                  ),
                ],
              ),
            ),
            // const HorizontalDashedWidget(),
            const Divider(
              color: Colors.grey,
              thickness: 0.2,
              indent: 20,
              endIndent: 20,
            ),

            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: ClipRRect(
                    borderRadius: BorderRadiusAttribute.all(10),
                    child: ImageWidget(
                      order?.vehicle?.images?.firstOrNull ?? "",
                      fit: BoxFit.cover,
                      height: MediaQuery.sizeOf(context).width * 0.20,
                      width: MediaQuery.sizeOf(context).width * 0.20,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          order?.vehicle?.model ?? "---",
                          style: AppTextStyles.getBoldStyle(
                            color: AppColors.blackOneColor,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          order?.vehicle?.manufacturer ?? "---",
                          style: AppTextStyles.getRegularStyle(
                            color: AppColors.blackOneColor,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              order?.vehicle?.number ?? "----",
                              style: AppTextStyles.getMediumStyle(
                                color: AppColors.blackOneColor,
                                fontSize: 16,
                              ),
                            ),
                            // Text(
                            //   "${order?.cost ?? "----"} ${"RS".tr}",
                            //   style: AppTextStyles.getMediumStyle(
                            //     color: AppColors.blackOneColor,
                            //     fontSize: 16,
                            //   ),
                            // ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            const Divider(
              color: Colors.grey,
              thickness: 0.2,
              indent: 20,
              endIndent: 20,
            ),
            // const HorizontalDashedWidget(),
            const SizedBox(height: 3),
            Row(
              children: [
                const SizedBox(width: 10),
                const Icon(Iconsax.calendar_1_copy,
                    color: AppColors.grayOneColor),
                const SizedBox(width: 5),
                Text(
                  DateTimeHandler.formatDate(order?.whasDate),
                  style: AppTextStyles.getBoldStyle(),
                ),
                const Spacer(),
                ContainerTextWidget(
                  order?.washType ?? "----",
                  fontSize: 12,
                  color: AppColors.secondaryOneColor,
                ),
                const SizedBox(width: 10),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
