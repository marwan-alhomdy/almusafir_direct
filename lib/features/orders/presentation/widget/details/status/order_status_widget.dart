import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import '../../../../../../core/Animation/animation_column_widget.dart';
import '../../../../../../core/utils/drwn/dashed_line_painter.dart';
import '../../../../../../core/utils/resource/color_app.dart';
import '../../../../../../helper/language.helper.dart';
import 'list_title_order_status_widget.dart';
import '../../../../../../core/constants/enum/order_status_custmer.dart';

class OrderStatusWidget extends StatelessWidget {
  const OrderStatusWidget({super.key, required this.carWashOrderStatus});
  final CarWashOrderStatus carWashOrderStatus;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(5),
      child: Column(
        children: [
          const SizedBox(height: 5),
          if (carWashOrderStatus == CarWashOrderStatus.FAILED)
            ListTitleOrderStatusWidget(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.mainOneColor.withOpacity(0.1)),
                icon: Iconsax.close_circle_copy,
                select: true,
                title: LanguageHelper.chooseLabelLanguage(
                    arabic: CarWashOrderStatus.FAILED.arabicTitle,
                    english: CarWashOrderStatus.FAILED.title),
                desc: "")
          else
            AnimationColumnWidget(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTitleOrderStatusWidget(
                    decoration: _getBoxDecorationConfirm(),
                    icon: Iconsax.car_copy,
                    select: carWashOrderStatus == CarWashOrderStatus.PENDING,
                    title: LanguageHelper.chooseLabelLanguage(
                      arabic: CarWashOrderStatus.PENDING.arabicTitle,
                      english: CarWashOrderStatus.PENDING.title,
                    ),
                    desc: ""),
                _getLine(true),
                ListTitleOrderStatusWidget(
                    decoration: _getBoxDecorationOnTheWay(),
                    icon: Iconsax.clock_copy,
                    select: carWashOrderStatus == CarWashOrderStatus.START,
                    title: LanguageHelper.chooseLabelLanguage(
                      arabic: CarWashOrderStatus.START.arabicTitle,
                      english: CarWashOrderStatus.START.title,
                    ),
                    desc: ""),
                _getLine(carWashOrderStatus == CarWashOrderStatus.END),
                ListTitleOrderStatusWidget(
                    decoration: _getBoxDecorationDeliverd(),
                    icon: Iconsax.receipt_copy,
                    select: false,
                    title: LanguageHelper.chooseLabelLanguage(
                      arabic: CarWashOrderStatus.END.arabicTitle,
                      english: CarWashOrderStatus.END.title,
                    ),
                    desc: ""),
              ],
            )
        ],
      ),
    );
  }

  Widget _getLine(bool selectLine) {
    return Container(
      // color: AppColors.secondaryOneColor,
      width: 1,
      height: 20,
      margin: const EdgeInsets.symmetric(horizontal: 22, vertical: 4),
      child: CustomPaint(
        painter: DashedLinePainter(),
        child: const SizedBox(height: 2, width: double.infinity),
      ),
    );
  }

  BoxDecoration _getBoxDecorationConfirm() {
    return carWashOrderStatus == CarWashOrderStatus.PENDING
        ? BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.mainOneColor.withOpacity(0.1))
        : BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.mainOneColor.withOpacity(0.8));
  }

  BoxDecoration _getBoxDecorationOnTheWay() {
    if (carWashOrderStatus == CarWashOrderStatus.PENDING) {
      return BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.mainOneColor.withOpacity(0.1));
    } else if (carWashOrderStatus == CarWashOrderStatus.START) {
      return BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.mainOneColor.withOpacity(0.1));
    } else {
      return BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.mainOneColor.withOpacity(0.8));
    }
  }

  BoxDecoration _getBoxDecorationDeliverd() {
    if (carWashOrderStatus == CarWashOrderStatus.PENDING ||
        carWashOrderStatus == CarWashOrderStatus.START) {
      return BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.mainOneColor.withOpacity(0.1));
    } else {
      return BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.mainOneColor.withOpacity(0.8));
    }
  }
}
