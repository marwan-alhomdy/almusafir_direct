import 'package:almusafir_direct/core/utils/resource/text_style.dart';
import 'package:flutter/material.dart';

import '../../../../../core/data/shop_products/datum.dart';

class RadioUnitsWidget extends StatelessWidget {
  const RadioUnitsWidget(
      {super.key,
      required this.unit,
      required this.onChanged,
      this.groupValue});
  final UnitsDatum? groupValue;
  final UnitsDatum? unit;
  final Function(UnitsDatum?) onChanged;

  @override
  Widget build(BuildContext context) {
    return RadioListTile(
      groupValue: groupValue,
      contentPadding: const EdgeInsets.all(0),
      title: Text(
        unit?.unitsName ?? "---",
        style: AppTextStyles.getMediumStyle(),
      ),
      secondary: Text(
        unit?.price.toString() ?? "--",
        style: AppTextStyles.getMediumStyle(color: Colors.orange),
      ),
      value: unit,
      onChanged: (v) => onChanged(unit),
    );
  }
}
