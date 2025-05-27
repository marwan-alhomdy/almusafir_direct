import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constants/enum/order_status_custmer.dart';
import '../../../../core/data/models/order.module.dart';
import '../../../../core/utils/drwn/get_h_dashed_line_painter.dart';
import '../../../../core/utils/handler/handler.dart';
import '../../../../core/utils/resource/color_app.dart';
import '../../../../core/utils/resource/text_style.dart';
import '../../../../core/view/image.view.dart';
import '../../../../core/widget/image/image_widget.dart';
import '../../../../core/widget/plate/vehicle_plate.widget.dart';
import '../widget/appbar/details_order.appbar.dart';
import '../widget/details/status/order_status_widget.dart';

class DetailsOrderView extends StatefulWidget {
  const DetailsOrderView(
      {super.key, required this.status, required this.order});
  final OrderModel? order;
  final CarWashOrderStatus status;
  @override
  State<DetailsOrderView> createState() => _DetailsOrderState();
}

class _DetailsOrderState extends State<DetailsOrderView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const DetailsOrderAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(width: double.infinity),
              Text(
                "${"orderN".tr}  #${widget.order?.id ?? "0000"} ",
                style: AppTextStyles.getMediumStyle(
                  fontSize: 18,
                  color: const Color(0xFF323234),
                ),
              ),
              OrderStatusWidget(carWashOrderStatus: widget.status),
              const SizedBox(height: 10),
              const HorizontalDashedWidget(),
              const SizedBox(height: 20),
              VehiclePlateWidget(
                vehicleNumber: widget.order?.vehicle?.plateNumbers ?? "---",
                lettersEnglish: widget.order?.vehicle?.plateLettersEn ?? "---",
                lettersArabic: widget.order?.vehicle?.plateLettersAr ?? "---",
              ),
              const SizedBox(height: 20),
              _InfoOrderLabel(
                title: "${"type_of_washing".tr} : ",
                value: widget.order?.washType ?? "---",
              ),
              const SizedBox(height: 10),
              _InfoOrderLabel(
                title: "${"wsashing_date".tr} : ",
                value: DateTimeHandler.formatDate(widget.order?.whasDate),
              ),
              const SizedBox(height: 20),
              if ((widget.order?.imagesBefor ?? []).isNotEmpty) ...[
                Text(
                  "${"vehicle_photos_before_washing".tr} : ",
                  style: AppTextStyles.getMediumStyle(
                    color: AppColors.mainOneColor,
                  ),
                ),
                const SizedBox(height: 10),
                DeliveryImagesWidget(images: widget.order?.imagesBefor ?? []),
              ],
              if ((widget.order?.imagesAfter ?? []).isNotEmpty) ...[
                Text(
                  "${"vehicle_photos_after_washing".tr} : ",
                  style: AppTextStyles.getMediumStyle(
                    color: AppColors.mainOneColor,
                  ),
                ),
                const SizedBox(height: 10),
                DeliveryImagesWidget(images: widget.order?.imagesAfter ?? []),
              ],
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}

class _InfoOrderLabel extends StatelessWidget {
  const _InfoOrderLabel({
    required this.title,
    required this.value,
  });
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return _InfoWidget(
      title: title,
      value: Text(
        value,
        textAlign: TextAlign.center,
        style: AppTextStyles.getMediumStyle(),
      ),
    );
  }
}

class _InfoWidget extends StatelessWidget {
  const _InfoWidget({
    required this.title,
    required this.value,
  });
  final String title;
  final Widget value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: AppTextStyles.getMediumStyle(),
          ),
        ),
        Expanded(flex: 3, child: value),
      ],
    );
  }
}

class DeliveryImagesWidget extends StatelessWidget {
  const DeliveryImagesWidget({super.key, required this.images});
  final List<dynamic> images;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          images.length,
          (index) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () => Get.to(
                  () => ShowImageView(image: images[index]?.toString() ?? "")),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: ImageWidget(
                  images[index]?.toString() ?? "",
                  width: 70,
                  height: 70,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
