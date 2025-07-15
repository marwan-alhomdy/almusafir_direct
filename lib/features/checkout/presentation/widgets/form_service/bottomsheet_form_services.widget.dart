import 'package:almusafir_direct/core/data/service.module.dart';
import 'package:almusafir_direct/core/utils/resource/text_style.dart';
import 'package:almusafir_direct/core/widget/button/button.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../../../core/widget/liner.widget.dart';
import '../../logic/form_service_cubit/form_service_cubit.dart';
import 'checklist_services.widget.dart';
import 'loading_formservice.widget.dart';

class BottomSheetFormServicesWidget extends StatefulWidget {
  const BottomSheetFormServicesWidget(
      {super.key,
      required this.formServiceCubit,
      required this.onChanged,
      required this.valueSelected});
  final FormServiceCubit formServiceCubit;
  final Function(ServiceModul?) onChanged;
  final ServiceModul? valueSelected;

  @override
  State<BottomSheetFormServicesWidget> createState() =>
      _BottomSheetFormServicesWidgetState();
}

class _BottomSheetFormServicesWidgetState
    extends State<BottomSheetFormServicesWidget> {
  ServiceModul? valueSelected;

  @override
  void initState() {
    valueSelected = widget.valueSelected;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      constraints: BoxConstraints(
        maxHeight: MediaQuery.sizeOf(context).height * 0.7,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const LineButtonSheetWidget(),
          BlocBuilder<FormServiceCubit, FormServiceState>(
            bloc: widget.formServiceCubit,
            builder: (context, state) {
              if (state is FormServiceLoadingState) {
                return const LoadingFormServiceWidget();
              } else if (state is FormServiceErrorState) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 50),
                  child: Text(
                    state.message,
                    style: AppTextStyles.getMediumStyle(),
                  ),
                );
              } else if (state is FormServicesSuccessfullyState) {
                return CheckListServicesWidget(
                  services: state.services,
                  value: valueSelected,
                  onChanged: (value) => setState(() {
                    valueSelected = value;
                  }),
                );
              }
              return const SizedBox();
            },
          ),
          const SizedBox(height: 20),
          ButtonWidget(
            text: 'OK'.tr,
            onTap: () {
              Get.back();
              widget.onChanged(valueSelected);
            },
          ),
        ],
      ),
    );
  }
}
