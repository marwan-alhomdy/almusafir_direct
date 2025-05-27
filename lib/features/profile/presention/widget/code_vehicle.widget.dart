import 'package:almusafir_direct/core/utils/function/toast_box.dart';
import 'package:almusafir_direct/core/widget/button/button.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../../core/utils/resource/color_app.dart';
import '../../../../core/utils/resource/text_style.dart';
import '../../../../core/widget/field/pinput_widget.dart';
import '../bloc/code_vehicle/code_vehicle_cubit.dart';

class CodeVehicleWidget extends StatelessWidget {
  const CodeVehicleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CodeVehicleCubit, CodeVehicleState>(
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.symmetric(horizontal: 10),
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: const Color(0xffEBEEF0)),
              borderRadius: BorderRadius.circular(12)),
          child: Column(
            children: [
              const SizedBox(height: 10),
              Text(
                "vehicle_code".tr,
                style: AppTextStyles.getMediumStyle(
                  fontSize: 18,
                  color: AppColors.blackOneColor,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "change_vehicle_code".tr,
                style: AppTextStyles.getMediumStyle(
                  fontSize: 18,
                  color: AppColors.blackOneColor,
                ),
              ),
              const SizedBox(height: 20),
              PinputWidget(
                pinController:
                    context.read<CodeVehicleCubit>().codeVehicleController,
                onCompeted: (pin) {},
                pinputFocusNode: FocusNode(),
              ),
              const SizedBox(height: 20),
              (state is CodeVehicleLoading)
                  ? ButtonLoadingWidget(
                      isLoading: true,
                      color: AppColors.secondaryOneColor,
                      onTap: () {},
                      text: "",
                    )
                  : ButtonWidget(
                      onTap: () => _changeCodeVehicle(context),
                      text: "confirm".tr,
                      color: AppColors.secondaryOneColor,
                    ),
              const SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }

  void _changeCodeVehicle(BuildContext context) {
    final codeVehicleCubit = context.read<CodeVehicleCubit>();
    if (codeVehicleCubit.codeVehicleController.text.length != 4) {
      ToastBox.showError(message: "verification_code_hint_error".tr);
    } else if (codeVehicleCubit.codeVehicleController.text.length == 4) {
      context.read<CodeVehicleCubit>().changeCodeVehicle();
    }
  }
}
