import 'package:almusafir_direct/features/order/presentation/logic/order_cubit/order_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../../core/utils/resource/color_app.dart';
import '../../../../core/utils/resource/text_style.dart';
import '../../../../core/widget/button/button.widget.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(width: double.infinity),
        const Icon(Icons.nearby_error_outlined,
            color: AppColors.grayTwoColor, size: 120),
        const SizedBox(height: 20),
        Text("No orders found".tr,
            style: AppTextStyles.getRegularStyle(fontSize: 16)),
        const SizedBox(height: 20),
        SizedBox(
          width: 200,
          height: 50,
          child: ButtonWidget(
              text: "updateData".tr,
              onTap: () => context.read<OrderCubit>().getOrders()),
        )
      ],
    );
  }
}
