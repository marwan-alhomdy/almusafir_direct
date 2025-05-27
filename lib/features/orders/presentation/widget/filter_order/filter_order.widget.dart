import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/constants/enum/order_status_custmer.dart';
import '../../../../../core/utils/resource/color_app.dart';
import '../../../../../helper/language.helper.dart';
import '../../logic/filter_order_cubit/filter_order_cubit.dart';
import 'button_filter_order.widget.dart';

class FilterOrderWidget extends StatelessWidget {
  const FilterOrderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.secondaryOneColor,
      padding: const EdgeInsets.only(bottom: 5),
      child: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        child: BlocBuilder<FilterOrderCubit, FilterOrderState>(
          builder: (context, state) {
            return Row(
              children: List.generate(
                CarWashOrderStatus.values.length,
                (index) => CarWashOrderStatus.values[index] ==
                        CarWashOrderStatus.PENDING
                    ? const SizedBox()
                    : ButtonFilterOrderWidget(
                        text: LanguageHelper.chooseLabelLanguage(
                          arabic: CarWashOrderStatus.values[index].arabicTitle,
                          english: CarWashOrderStatus.values[index].title,
                        ),
                        value: CarWashOrderStatus.values[index],
                        group:
                            context.read<FilterOrderCubit>().carWashOrderStatus,
                        onChanged:
                            context.read<FilterOrderCubit>().filterOrder),
              ),
            );
          },
        ),
      ),
    );
  }
}
