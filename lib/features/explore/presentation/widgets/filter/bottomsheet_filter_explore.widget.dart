import 'package:almusafir_direct/core/utils/resource/text_style.dart';
import 'package:almusafir_direct/helper/language.helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/constants/enum/explore.dart';

class FilterItemWidget extends StatefulWidget {
  final ExploreFilter value;
  final Function(ExploreFilter) onChanged;
  const FilterItemWidget({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  State<FilterItemWidget> createState() => _FilterItemWidgetState();
}

class _FilterItemWidgetState extends State<FilterItemWidget> {
  late ExploreFilter selectedValue;
  final bool isDrank = Get.isDarkMode;

  @override
  void initState() {
    selectedValue = widget.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      runAlignment: WrapAlignment.center,
      children: List.generate(
        ExploreFilter.values.length,
        (index) {
          final ExploreFilter item = ExploreFilter.values[index];

          final isSelected = item == selectedValue;

          return GestureDetector(
            onTap: () {
              selectedValue = item;
              widget.onChanged(item);
              setState(() {});
              //   widget.onTap(item);
            },
            child: Container(
              width: Get.width * 0.22,
              padding: const EdgeInsets.all(6),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? item.color
                          : isDrank
                              ? Colors.black26
                              : const Color(0xFFE8E8E8),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Icon(item.icon,
                        color: isSelected ? Colors.white : item.color),
                  ),
                  const SizedBox(width: 4),
                  Text(LanguageHelper.isArabic ? item.labelAr : item.labelEn,
                      textAlign: TextAlign.center,
                      style: AppTextStyles.getMediumStyle(fontSize: 12)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
