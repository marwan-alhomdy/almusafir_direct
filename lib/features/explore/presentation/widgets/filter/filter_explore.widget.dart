import 'package:almusafir_direct/core/widget/button/button.widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../../../core/constants/enum/explore.dart';
import '../../../../../core/utils/function/bottom_sheet.widget.dart';
import '../../../../../core/utils/resource/color_app.dart';
import '../../../../../core/widget/field/search_field.widget.dart';
import '../../../../../core/widget/liner.widget.dart';
import 'bottomsheet_filter_explore.widget.dart';

class ExploreFilterBarWidget extends StatelessWidget {
  final ExploreFilter value;
  final Function(ExploreFilter) onChanged;

  const ExploreFilterBarWidget(
      {super.key, required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Row(
        children: [
          const SizedBox(width: 10),
          Expanded(
            child: Card(
              elevation: 0.5,
              margin: EdgeInsets.zero,
              child: SearchFieldWidget(
                  onFieldSubmitted: (value) {},
                  controller: TextEditingController()),
            ),
          ),
          const SizedBox(width: 10),
          SizedBox(
            width: 50,
            height: 50,
            child: FloatingActionButton(
              elevation: 0.5,
              foregroundColor: Colors.white,
              backgroundColor: AppColors.mainOneColor,
              onPressed: openFilterDialog,
              child: const Icon(Iconsax.filter_copy),
            ),
          ),
          const SizedBox(width: 10),
        ],
      ),
    );
  }

  void openFilterDialog() {
    ExploreFilter filter = value;
    BottomSheetWidget.showIsScroll(
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          spacing: 10,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 10),
            const LineButtonSheetWidget(),
            FilterItemWidget(
                value: value, onChanged: (value) => filter = value),
            ButtonWidget(
                onTap: () {
                  Get.back();
                  onChanged(filter);
                },
                text: "OK".tr),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
